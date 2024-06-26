import Foundation
import SocketIO
import SwiftyJSON
//import JavaScriptCore

class DataSocketManager {
    
    @Published var otherPlayerSendValues:Bool = false
    @Published var startScoreUpdate:Bool = false
    @Published var shouldNavigateToLoadingGameRoom:Bool = false
    
    static let shared = DataSocketManager()
    private let manager = SocketManager(socketURL: URL(string: "https://085f-2405-201-e04c-d077-e8cc-8f5e-8365-78a.ngrok-free.app/")! ,config: [
        .connectParams(["EIO": "3"]),
        .version(.two)
    ])
    
    private var socket: SocketIOClient?
    
    private init() {}
    
    func establishSocketConnection() {
        socket = manager.socket(forNamespace: "/create_room")
        
        // Connect the socket
        socket?.connect()
        
        // Handle 'connect' event
        socket?.on("connect") { [weak self] data, ack in
            print("Socket Connected")
            // Emit the "join_room" event with the required data
            self?.socket?.emit("join_room", ["username": AppData.shared.username, "room_id": AppData.shared.roomID])
        }
        
        // Handle 'call' event, called by Play_call
        socket?.on("call") {[weak self] data, _ in
            if let dataArray = data as? [[String: Any]], let firstElement = dataArray.first,
               let parameterName = firstElement["parameter_name"] as? String,
               let parameterValue = firstElement["parameter_value"] as? String {
                print("Received message: \(parameterName) - \(parameterValue)")
                // Update AppData with received values
                AppData.shared.parameter_name = parameterName
                AppData.shared.parameter_value = parameterValue
                print(AppData.shared.parameter_name)
                print(AppData.shared.parameter_value)
                print(AppData.shared.username)
                self?.otherPlayerSendValues = true
            }
        }
        
        
        // Handle 'allscoreadded' event called by members_play_call
        socket?.on("allscoreadded") {[weak self] _,_ in
            self?.otherPlayerSendValues = false
            self?.startScoreUpdate = true
            print("startScoreUpdated")
        }
        
        
        // Inside your socket?.on("status") closure
        socket?.on("status") { [weak self] data, _ in
            if let dataArray = data as? [[String: Any]],
               let message = dataArray[0]["message"] as? String,
               let status = dataArray[0]["status"] as? Bool {
                
                DispatchQueue.main.async { // Ensure updates are on the main thread
                    if status {
                        AppData.shared.RoomEntryStatus = true
                        if let users = dataArray[0]["users"] as? [String] {
                            AppData.shared.OpponentPlayers = users
                            print(users)
                        } else {
                            AppData.shared.OpponentPlayers = []
                        }
                    }else{
                        AppData.shared.JoinStatusMessage = message
                    }
                }
                print("Received status message: \(message)")
            }
        }


        
        
        // Handle 'leave' event called by leave_room
        socket?.on("leave") { [weak self]data, _ in
            if let dataArray = data as? [[String: Any]], let message = dataArray[0]["message"] as? String {
                print("Received status message: \(message)")
            }
        }
        
        // Handle 'theme_sent' event called by theme_call
        socket?.on("theme_sent") { [weak self] data, _ in
            if let receivedData = data as? [[String: Any]],
               let firstElement = receivedData.first,
               let themeSelected = firstElement["theme_selected"] as? String,
               let topicSelected = firstElement["topic_selected"] as? String,
               var usersData = firstElement["users_data"] as? [String: Any]{
                
                print("Received message: \(themeSelected) - \(topicSelected)")
                
                // Update AppData with received values
                AppData.shared.themeselected = themeSelected
                AppData.shared.topicselected = topicSelected
                AppData.shared.score = 0
                print(AppData.shared.themeselected)
                print(AppData.shared.topicselected)
                // Convert userDataArray to JSON format
                JSONDataManager.shared.jsonData = JSON(rawValue: usersData[AppData.shared.username])
                print(JSONDataManager.shared.jsonData)
                self?.shouldNavigateToLoadingGameRoom = true
            } else {
                print("Invalid data type received: \(type(of: data))")
                // Handle the error condition gracefully
            }
        }

        
        
    }
    
    func join_room(){
        self.socket?.emit("join_room", ["username": AppData.shared.username, "room_id": AppData.shared.roomID])
    }
    
    func leave_room(){
        AppData.shared.roomID = ""
        AppData.shared.themeselected = ""
        AppData.shared.topicselected = ""
        AppData.shared.mychance = 0
        AppData.shared.score = 0
        AppData.shared.parameter_name = ""
        AppData.shared.parameter_value = ""
        self.socket?.emit("leave_room", ["username": AppData.shared.username, "room_id": AppData.shared.roomID])
        
    }
    
    func play_call(){
        self.socket?.emit("play_call", ["room_id":AppData.shared.roomID,"parameter_name": AppData.shared.parameter_name,"parameter_value": AppData.shared.parameter_value])
    }
    
    func theme_selection(){
        let themeSelectedString = AppData.shared.themeselected
        self.socket?.emit("theme_selection",["room_id":AppData.shared.roomID,"theme_selected": themeSelectedString, "topic_selected":AppData.shared.topicselected])
    }
    
    func members_play_call(parameterName par_name: String, parameterValue par_value: String) {
        print("members play called")
        self.socket?.emit("members_play_call", ["username": AppData.shared.username,"room_id":AppData.shared.roomID,"score": AppData.shared.score,"parameter_name": par_name, "parameter_value": par_value])
    }
    
    
    //    func status(){
    //        socket?.on("status") { data, _ in
    //              if let dataArray = data as? [[String: Any]], let message = dataArray[0]["message"] as? String {
    //                  print("Received message: \(message)")
    //              }
    //          }
    //    }
    //
    //    func call(){
    //        socket?.on("call") { data, _ in
    //            if let dataArray = data as? [[String: Any]], let message = dataArray[0]["msg"] as? String {
    //                print("Received message: \(message)")
    //                AppData.shared.parameter_called = message
    //                print(AppData.shared.parameter_called)
    //            }
    //        }
    //    }
    
    //    func listenToChatUpdates(onReceive:@escaping ([String:Any]) -> Void){
    //        print("listenToChatUpdatesDESDOII=====")
    //        socket?.on("updated", callback: { data, _ in
    //            print("listenToChatUpdates---- \(data)")
    //            let firstElement = data[0] as! String
    //            if let data = firstElement.data(using: .utf8){
    //                if let dictionary = try? JSONSerialization.jsonObject(with: data,options: []) as? [String:Any]{
    //                    onReceive(dictionary)
    //                }
    //            }
    //
    //        })
    //    }
    //    func listenToRecievedMessages(onReceive:@escaping(String) -> Void){
    //        socket?.on("message recieved", callback: { data, _ in
    //            let firstElement = data[0] as! String
    //            print("TYPEODFDS---- \(firstElement)")
    //            if let data = firstElement.data(using: .utf8){
    //                if let dictionary = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]{
    //                    onReceive(dictionary["chatID"] as? String ?? "")
    //                } else {
    //                    print("Recienefjewoiqjwojelse----")
    //                }
    //            }
    //
    //
    //            if let dataDict = data as? [[String:Any]]{
    //                onReceive(dataDict.first?["chatID"] as? String ?? "")
    //            } else {
    //                print("Recienved msg but go nil data")
    //            }
    //        })
    //    }
    //    func emiteMessageSent(recieverID:String,message:String,chatID:String){
    //        let dictionary = ["senderID":AuthManager.shared.getUserID(),"receiverID":recieverID,"message":message,"chatID":chatID]
    //        if let jsonData = try? JSONSerialization.data(withJSONObject: dictionary, options: []){
    //            let jsonStr = String(data: jsonData, encoding: .utf8)!
    //            socket?.emit("new message", with: [jsonStr])
    //        }
    //
    //    }
}


