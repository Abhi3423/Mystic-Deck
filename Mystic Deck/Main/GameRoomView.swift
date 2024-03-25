import SwiftUI
import SwiftyJSON

struct GameRoomView: View {
    @State private var mysticOffset: CGFloat = -200
    @State private var deckOffset: CGFloat = 400
    @State private var opacity: Double = 0.0
    @State private var buttonopacity: Double = 0.0
    @State private var showLoginButtons: Bool = false
    @State private var showNewText: Bool = true
    @State private var isNavigationActive: Bool = false
    @State private var isSettingsPopupVisible = false
    @State private var showPlayButton = false
    @State private var refreshID = UUID()
    @State private var showWinSheet = false
    @State private var showLoseSheet = false
    @State private var isHomeActive = false
    @State private var isEndActive = false
    
    let theme: String
    let topic: String
    
    
    @ViewBuilder
    var destinationToHomeView: some View {
        if isEndActive {
            NavigationBarView()
        } else {
            EmptyView()
        }
    }
    
    var body: some View {
        
        ZStack {
            Image("BG")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .frame(width: 400)
            
            
            VStack{
                
                ZStack{
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 425, height: 69)
                        .background(Color(red: 0.48, green: 0.12, blue: 0.63))
                        .offset(x: 0, y: 0)
                        .padding(.vertical,15.0)
                    
                    HStack {
                        Image("profile")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 40) // Adjusted frame size to reduce image size
                            .foregroundColor(.white)
                            .padding(.horizontal, -10)
                            .padding(.vertical, -25)
                            .onTapGesture {
                                // Handle tapping the export icon
                            }
                        Spacer(minLength: 65)
                        
                        VStack{
                            Text("\(theme)")
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.center)
                                .lineLimit(0)
                                .padding(.vertical, -5)
                                .padding(.trailing, 10) // Added padding to create space between text and images
                            
                            Text("\(topic)")
                                .font(.system(size:17, weight: .bold, design: .rounded))
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(Color.white.opacity(0.50))
                                .multilineTextAlignment(.center)
                                .lineLimit(0)
                                .padding(.vertical, -5)
                                .padding(.trailing, 10) // Added padding to create space between text and images
                        }
                        
                        Spacer() // Added spacer to push images to the right
                        
                        Image("bar")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40) // Adjusted frame size to reduce image size
                            .foregroundColor(.white)
                            .padding(.horizontal, 5)
                            .padding(.vertical, -25)
                            .onTapGesture {
                                // Handle tapping the export icon
                            }
                    }.padding(.horizontal,30.0)
                }
                
                
                HStack{
                    OppositePlayerProfileView(imageName: "player", name: "Arul", totalCards: 4)
                    OppositePlayerProfileView(imageName: "player", name: "Abhishek", totalCards: 4)
                }
                .padding(.bottom, 10.0)
                
                
                HStack{
                    //                    Text("\(AppData.shared.username)")
                    Spacer()
                    
                    Text("Score: \(AppData.shared.score)")
                        .foregroundColor(Color(red: 0.36, green: 0, blue: 0.51))
                        .font(Font.custom("Inter", size: 24).weight(.semibold))
                }
                
                ZStack{
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 370, height: 220)
                        .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                        .cornerRadius(17)
                        .overlay(
                            RoundedRectangle(cornerRadius: 17)
                                .inset(by: -1)
                                .stroke(Color(red: 0.36, green: 0, blue: 0.51), lineWidth: 1)
                        )
                        .shadow(
                            color: Color(red: 0, green: 0, blue: 0, opacity: 0.40), radius: 4
                        )
                    
                    VStack{
                        if let draggedData = DraggedCardData.shared.draggedCard {
                            GameCard(imageName: draggedData.imageName,cardHeading: draggedData.cardHeading,rectangles: draggedData.rectangles)
                                .id(refreshID)
                        } else {
                            Text("Please Select the Card") // Placeholder or error message
                        }
                    }
                    
                }
                .offset(y: -15.0)
                
                ZStack{
                    if let unwrappedJsonData = JSONDataManager.shared.jsonData {
                        if(unwrappedJsonData[AppData.shared.themeselected][AppData.shared.topicselected]["Cards"].isEmpty){
                            NavigationLink(
                                destination: destinationToHomeView,
                                isActive: $isEndActive,
                                label: {
                                    EmptyView()
                                }
                            )
                        }else{
                            VStack{
                                Spacer()
                                CardStack(jsonData: unwrappedJsonData, theme: theme, topic: topic)
                                    .id(refreshID)
                                    .offset(x: -50,y:-40)
                            }
                        }
                    }
                    
                    if(showPlayButton == true || AppData.shared.mychance == 1){
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 390, height: 100)
                            .background(Color(red: 0.95, green: 0.81, blue: 1))
                            .cornerRadius(20)
                            .offset(y: 110)
                            .shadow(radius: 10)
                        VStack {
                            Spacer()
                            ZStack() {
                                Rectangle()
                                    .foregroundColor(Color(red: 0.48, green: 0.12, blue: 0.63).opacity(0.40))
                                    .frame(width: 136.99, height: 47.35)
                                    .cornerRadius(28.75)
                                
                                Button(action: {
                                    print("Play Button clicked!")
                                    DataSocketManager.shared.play_call()
                                }) {
                                    Text("PLAY")
                                        .font(Font.custom("Inter", size: 24).weight(.semibold))
                                        .lineSpacing(23.23)
                                        .foregroundColor(Color(red: 0.36, green: 0, blue: 0.51))
                                        .offset(x: 0.39, y: -0.49)
                                }
                            }
                            .padding(.bottom,30.0)
                        }
                    }
                    
                    //                    HStack{
                    //                        Spacer()
                    //                        if(showPlayButton == true || AppData.shared.mychance == 1){
                    //                            CustomButton(buttonText: "PLAY") {
                    //                                print("Play Button clicked!")
                    //                                DataSocketManager.shared.play_call()
                    //                            }
                    //                        }
                    //                        Spacer()
                    //                        Image("settings")
                    //                            .resizable()
                    //                            .frame(width: 40, height: 40)
                    //                            .onTapGesture {
                    //                                // Show the settings popup
                    //                                isSettingsPopupVisible.toggle()
                    //                            }
                    //                    }
                }
                
            }.frame(width: 370, height: 840)
            
            // Background for the popup
            if isSettingsPopupVisible {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        isSettingsPopupVisible = false
                    }
            }
            
            // Popup content
            if isSettingsPopupVisible {
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            isSettingsPopupVisible = false
                        }) {
                            Image("cross")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 40, height: 40)
                        }
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding()
                    }
                    
                    NavigationLink(
                        destination: destinationToHomeView,
                        isActive: $isHomeActive,
                        label: {
                            EmptyView()
                        }
                    )
                    
                    
                    CustomButton(buttonText: "EXIT") {
                        print("Exit")
                        DataSocketManager.shared.leave_room()
                        isHomeActive = true
                        print(isHomeActive)
                    }
                    
                    Spacer()
                }
                .background(Color.white)
                .cornerRadius(20)
                .padding()
                .frame(height: 200)
            }
        }
        .padding()
        .navigationBarBackButtonHidden(true)
        .sheet(isPresented: $showWinSheet, onDismiss: {
            // Loop through the jsonData to find and remove matching key-value pairs
            if var jsonData = JSONDataManager.shared.jsonData {
                print(jsonData[AppData.shared.themeselected][AppData.shared.topicselected]["Cards"])
                if var cards = jsonData[AppData.shared.themeselected][AppData.shared.topicselected]["Cards"].dictionaryObject as? [String: [String: String]] {
                    var keysToRemove: [String] = []
                    
                    for (key, values) in cards {
                        // Check if the key-value pair matches the condition
                        if let parameterValue = values[AppData.shared.parameter_name], parameterValue == AppData.shared.parameter_value {
                            // Add the key to the list of keys to remove
                            keysToRemove.append(key)
                        }
                    }
                    
                    // Remove the key-value pairs from the "Cards" dictionary
                    for key in keysToRemove {
                        cards.removeValue(forKey: key)
                    }
                    
                    // Convert the modified Swift dictionary back to a JSON object
                    if let updatedCards = cards as? [String: Any] {
                        jsonData[AppData.shared.themeselected][AppData.shared.topicselected]["Cards"] = JSON(updatedCards)
                        if(jsonData[AppData.shared.themeselected][AppData.shared.topicselected]["Cards"].isEmpty){
                            JSONDataManager.shared.jsonData = jsonData
                            print("Exit because cards over")
                            DataSocketManager.shared.leave_room()
                            isEndActive = true
                        }else{
                            JSONDataManager.shared.jsonData = jsonData
                            DraggedCardData.shared.resetDraggedCard()
                            refreshID = UUID()
                        }
                        
                    }
                    print(jsonData[AppData.shared.themeselected][AppData.shared.topicselected]["Cards"])
                }
                
            } else {
                print("JSON data is nil")
            }
            
            showWinSheet = false
        }) {
            Text("You win!")
                .font(.title)
                .foregroundColor(.black)
                .padding()
        }
        .sheet(isPresented: $showLoseSheet, onDismiss: {
            // Loop through the jsonData to find and remove matching key-value pairs
            if var jsonData = JSONDataManager.shared.jsonData {
                print(jsonData[AppData.shared.themeselected][AppData.shared.topicselected]["Cards"])
                if var cards = jsonData[AppData.shared.themeselected][AppData.shared.topicselected]["Cards"].dictionaryObject as? [String: [String: String]] {
                    var keysToRemove: [String] = []
                    
                    for (key, values) in cards {
                        // Check if the key-value pair matches the condition
                        if let parameterValue = values[AppData.shared.parameter_name], parameterValue == AppData.shared.parameter_value {
                            // Add the key to the list of keys to remove
                            keysToRemove.append(key)
                        }
                    }
                    
                    // Remove the key-value pairs from the "Cards" dictionary
                    for key in keysToRemove {
                        cards.removeValue(forKey: key)
                    }
                    
                    // Convert the modified Swift dictionary back to a JSON object
                    if let updatedCards = cards as? [String: Any] {
                        jsonData[AppData.shared.themeselected][AppData.shared.topicselected]["Cards"] = JSON(updatedCards)
                        if(jsonData[AppData.shared.themeselected][AppData.shared.topicselected]["Cards"].isEmpty){
                            JSONDataManager.shared.jsonData = jsonData
                            print("Exit because cards over")
                            DataSocketManager.shared.leave_room()
                            isEndActive = true
                        }else{
                            JSONDataManager.shared.jsonData = jsonData
                            DraggedCardData.shared.resetDraggedCard()
                            refreshID = UUID()
                        }
                    }
                    
                    print(jsonData[AppData.shared.themeselected][AppData.shared.topicselected]["Cards"])
                }
                
            } else {
                print("JSON data is nil")
            }
            
            showLoseSheet = false
        }) {
            Text("You Loose!")
                .font(.title)
                .foregroundColor(.black)
                .padding()
        }
        .id(refreshID)
        .onReceive(DataSocketManager.shared.$startScoreUpdate) { newValue in
            if newValue {
                if !DataSocketManager.shared.otherPlayerSendValues {
                    callAPI(endpoint: "/score_update", method: "POST", formData: ["room_id": AppData.shared.roomID]) { responseString in
                        DispatchQueue.main.async {
                            if let responseString = responseString,
                               let data = responseString.data(using: .utf8),
                               let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                               let scores = json["scores"] as? [String: Int],
                               let winner = json["winner"] as? String {
                                
                                if let score = scores[AppData.shared.username] {
                                    AppData.shared.score = score
                                }
                                
                                // Handle the response
                                print("Response:\(responseString)")
                                DataSocketManager.shared.startScoreUpdate = false
                                print(refreshID)
                                if AppData.shared.username == winner {
                                    AppData.shared.mychance = 1
                                    showWinSheet = true
                                    showPlayButton = true
                                } else {
                                    AppData.shared.mychance = 0
                                    showLoseSheet = true
                                    showPlayButton = false
                                }
                            } else {
                                // Handle the error
                                print("Failed to fetch data")
                            }
                        }
                    }
                }
            }
        }
        .onReceive(DraggedCardData.shared.$draggedCard){_ in
            refreshID = UUID()
            print("CHANGED")
        }
        
    }
}

//struct GameRoomView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameRoomView(theme: "theme", topic: "imageName")
//    }
//}
