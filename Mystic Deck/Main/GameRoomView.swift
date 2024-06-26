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
    @State private var winnerName: String = ""
    
    @State private var winCardHeading: String = ""
    @State private var winCardContent: String = ""
    
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
               
                Image("themenew")
                    .resizable()
                    .scaledToFill()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                
                VStack{
                    
                    
                    ZStack{
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(height: 69)
                            .background(Color(red: 0.48, green: 0.12, blue: 0.63))
//                            .offset(x: 0, y: 0)
                            .padding(.vertical,15.0)
                        
                        HStack() {
                            
                            Image("profile")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 40) // Adjusted frame size to reduce image size
                                .foregroundColor(.white)
                                .padding(.horizontal, -10)
                                .onTapGesture {
                                    // Handle tapping the export icon
                                }
                            
                            Spacer()
                            
                            
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
                                .onTapGesture {
                                    isSettingsPopupVisible.toggle()
                                    // Handle tapping the export icon
                                }
                        }.padding(.horizontal,10.0)
                    }.frame(maxWidth: .infinity)
                    
                    
                    HStack{
                        OppositePlayerProfileView(imageName: "player", name: "Arul", totalCards: 4)
                        OppositePlayerProfileView(imageName: "player", name: "Abhishek", totalCards: 4)
                    }
                    .padding(.bottom, 15.0)
                    
                    
                    HStack{
                        //                    Text("\(AppData.shared.username)")
                        Spacer()
                        
                        Text("Score: \(AppData.shared.score)")
                            .foregroundColor(Color(red: 0.36, green: 0, blue: 0.51))
                            .font(Font.custom("Inter", size: 24).weight(.semibold))
                    }
                    .padding(.bottom, 10.0)
                    .padding(.horizontal,15.0)
                    
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
                                        .offset(x: -40,y:-10)
                                }
                            }
                        }
                            
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(height: 140)
                                .background(Color(red: 0.95, green: 0.81, blue: 1))
                                .cornerRadius(20)
                                .offset(y: 130)
                                .shadow(radius: 10)
                       
                        if(showPlayButton == true || AppData.shared.mychance == 1){
                            
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
                                .padding(.bottom,40.0)
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
                    
                }
                
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
                        
                        
                        Button(action: {
                            print("Exit")
                            DataSocketManager.shared.leave_room()
                            isHomeActive = true
                            print(isHomeActive)
                        }) {
                            Text("EXIT")
                                .frame(width: 130, height: 35)
                                .padding(.horizontal, 30.0)
                                .padding(.vertical, 10.0)
                                .bold()
                                .foregroundColor(.white)
                                .background(Color(red: 0.36, green: 0, blue: 0.51))
                                .cornerRadius(28)
                                .font(.system(size: 28))
                        }
                        
                        //                    CustomButton(buttonText: "EXIT") {
                        //                        print("Exit")
                        //                        DataSocketManager.shared.leave_room()
                        //                        isHomeActive = true
                        //                        print(isHomeActive)
                        //                    }
                        
                        Spacer()
                    }
                    .background(Color.white)
                    .cornerRadius(20)
                    .padding()
                    .frame(height: 200)
                }
            }
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
                
                Color(red: 0.95, green: 0.82, blue: 1) // Adjust the RGB values as needed
                       .edgesIgnoringSafeArea(.all) // Ignore safe area edges
                       .overlay(
                        VStack(spacing: 0) {
                            Image("sheetwin")
                                .resizable()
                                .scaledToFit()
                                .edgesIgnoringSafeArea(.all)
                                .frame(width: 400, height: 300)
                                .padding(.vertical, 20.0)
                            
                            Text("\(winnerName) has won the game")
                                .font(Font.custom("Inter", size: 20.53).weight(.bold))
                                .tracking(0.37)
                                .padding()
                                .foregroundColor(Color(red: 0.48, green: 0.12, blue: 0.63))
                            
                            ZStack() {
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 330, height: 215)
                                    .background(Color(red: 0.95, green: 0.82, blue: 1))
                                    .cornerRadius(12)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .inset(by: 0.50)
                                            .stroke(Color(red: 0.48, green: 0.12, blue: 0.63), lineWidth: 0.50)
                                    )
                                    .offset(x: 0, y: 0)
                                    .shadow(
                                        color: Color(red: 0.48, green: 0.12, blue: 0.63, opacity: 1), radius: 0, x: 3.51, y: 3.51
                                    )
                                Text("Odisha")
                                    .font(Font.custom("Inter", size: 20.53).weight(.bold))
                                    .tracking(0.37)
                                    .foregroundColor(Color(red: 0.48, green: 0.12, blue: 0.63))
                                    .offset(x: -114, y: -78.50)
                                Text("Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tercc incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco ut labore et dolore magna aliqua. Ut enim ad minim veniaut labore et ")
                                    .font(Font.custom("Inter", size: 16))
                                    .tracking(0.32)
                                    .foregroundColor(Color(red: 0.48, green: 0.12, blue: 0.63))
                                    .offset(x: 7, y: 17)
                                    .padding()
                            }.frame(width: 330, height: 215)
                        }
                )
                
            }
            .background(Color(red: 0.48, green: 0.12, blue: 0.63))
            .sheet(isPresented: $showLoseSheet, onDismiss: {
                // Loop through the jsonData to find and remove matching key-value pairs
                if var jsonData = JSONDataManager.shared.jsonData {
                    print(jsonData[AppData.shared.themeselected][AppData.shared.topicselected]["Cards"])
                    if var cards = jsonData[AppData.shared.themeselected][AppData.shared.topicselected]["Cards"].dictionaryObject as? [String: [String: String]] {
                        var keysToRemove: [String] = []
                        print("loss dismiss: \(AppData.shared.parameter_name)")
                        for (key, values) in cards {
                            print(key, values)
                            // Check if the key-value pair matches the condition
                            if let parameterValue = values[AppData.shared.parameter_name], parameterValue == AppData.shared.parameter_value {
                                // Add the key to the list of keys to remove
                                keysToRemove.append(key)
                            }else{
                                let parameterValue = values[AppData.shared.parameter_name]
                                print("loss dismiss parameterValue: \(parameterValue)")
                                print("loss dismiss app data value: \(AppData.shared.parameter_value)")
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
                            }
                            else{
                                JSONDataManager.shared.jsonData = jsonData
                                DraggedCardData.shared.resetDraggedCard()
                                refreshID = UUID()
                            }
                        }
                        
//                      print(jsonData[AppData.shared.themeselected][AppData.shared.topicselected]["Cards"])
                    }
                    
                } else {
                    print("JSON data is nil")
                }
                
                showLoseSheet = false
            }) {
                Color(red: 0.95, green: 0.82, blue: 1) // Adjust the RGB values as needed
                       .edgesIgnoringSafeArea(.all) // Ignore safe area edges
                       .overlay(
                        VStack(spacing: 0) {
                            Image("sheetlose")
                                .resizable()
                                .scaledToFit()
                                .edgesIgnoringSafeArea(.all)
                                .frame(width: 400, height: 200)
                                .padding(.vertical, 20.0)
                            
                            Text("\(winnerName) has won the game")
                                .font(Font.custom("Inter", size: 20.53).weight(.bold))
                                .tracking(0.37)
                                .foregroundColor(Color(red: 0.48, green: 0.12, blue: 0.63))
                                .padding()

                            ZStack() {
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 330, height: 215)
                                    .background(Color(red: 0.95, green: 0.82, blue: 1))
                                    .cornerRadius(12)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .inset(by: 0.50)
                                            .stroke(Color(red: 0.48, green: 0.12, blue: 0.63), lineWidth: 0.50)
                                    )
                                    .offset(x: 0, y: 0)
                                    .shadow(
                                        color: Color(red: 0.48, green: 0.12, blue: 0.63, opacity: 1), radius: 0, x: 3.51, y: 3.51
                                    )
                                Text("Odisha")
                                    .font(Font.custom("Inter", size: 20.53).weight(.bold))
                                    .tracking(0.37)
                                    .foregroundColor(Color(red: 0.48, green: 0.12, blue: 0.63))
                                    .offset(x: -114, y: -78.50)
                                Text("Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tercc incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco ut labore et dolore magna aliqua. Ut enim ad minim veniaut labore et ")
                                    .font(Font.custom("Inter", size: 16))
                                    .tracking(0.32)
                                    .foregroundColor(Color(red: 0.48, green: 0.12, blue: 0.63))
                                    .offset(x: 7, y: 17)
                                    .padding()
                            }.frame(width: 330, height: 215)
                        }
                )
            }.background(Color(red: 0.48, green: 0.12, blue: 0.63))
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
                                    winnerName = winner
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
            }
        }
}

//struct GameRoomView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameRoomView(theme: "theme", topic: "imageName")
//    }
//}
