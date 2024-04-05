import SwiftUI





struct ButtonView: View {
    var label: String
    
    var body: some View {
        Text(label)
            .foregroundColor(.white)
            .padding()
            .font(.system(size: 25))
            .frame(width: 300, height: 80)
            .background(Color.purpleColor)
            .cornerRadius(20)
    }
}

struct BoxView: View {
    var content: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .fill(Color.white)
            .frame(width: 100, height: 100)
            .overlay(
                Text(content)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
            )
            .scaledToFit()
    }
}




struct WaitingRoomView: View {
    @State private var imageSize: CGFloat = 1.0 // default scale factor
    @State private var generatedcode:String="xxxxxx"
    @State var comingfrom:String
    @State private var privateShouldNavigateToLoadingGameRoom: Bool = false
    @State private var showShareWindow = false
    @State private var refreshID = UUID()
    @ViewBuilder
    var destinationView: some View {
        if privateShouldNavigateToLoadingGameRoom {
            LoadingGameRoomView(theme: AppData.shared.themeselected, imageName: AppData.shared.topicselected)
        } else {
            EmptyView()
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                
                Image("themenew1")
                
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                //                    .opacity(0.8)
                
                //                VStack (spacing: 30){
                //                    VStack{
                //
                //                        HStack {
                //
                //
                //                            Image("back")
                //                                .resizable()
                //                                .aspectRatio(contentMode: .fit)
                //                                .frame(width: 50, height: 40) // Adjusted frame size to reduce image size
                //                                .foregroundColor(.white)
                //                                .padding(.horizontal, 3)
                //                                .padding(.vertical, -25)
                //                                .onTapGesture {
                //                                    // Handle tapping the export icon
                //                                }
                //                            Spacer(minLength: 65)
                //                            Text("Explore Themes")
                //                                .font(.system(size: 20, weight: .bold, design: .rounded))
                //                                .font(.title)
                //                                .fontWeight(.bold)
                //                                .foregroundColor(Color.white)
                //                                .multilineTextAlignment(.center)
                //                                .lineLimit(0)
                //                                .padding(.vertical, -5)
                //                                .padding(.trailing, 10) // Added padding to create space between text and images
                //
                //                            Spacer() // Added spacer to push images to the right
                //
                //                            Image("profile")
                //                                .resizable()
                //                                .aspectRatio(contentMode: .fit)
                //                                .frame(width: 50, height: 40) // Adjusted frame size to reduce image size
                //                                .foregroundColor(.white)
                //                                .padding(.horizontal, -10)
                //                                .padding(.vertical, -25)
                //                                .onTapGesture {
                //                                    // Handle tapping the export icon
                //                                }
                //
                //                            Image("bar")
                //                                .resizable()
                //                                .aspectRatio(contentMode: .fit)
                //                                .frame(width: 40, height: 40) // Adjusted frame size to reduce image size
                //                                .foregroundColor(.white)
                //                                .padding(.horizontal, 5)
                //                                .padding(.vertical, -25)
                //                                .onTapGesture {
                //                                    // Handle tapping the export icon
                //                                }
                //                        }
                //                    }
                //                    .padding(.bottom, 750.5)
                //
                //
                ////                        themeButtons
                ////
                ////                        ScrollView {
                ////                            if selectedTheme != "" {
                ////                                generateImages(for: selectedTheme)
                ////                            }
                ////                        }
                //
                //                }
                VStack {
                    
                    //                        Text("Waiting Room")
                    //                            .font(.system(size: 26, weight: .bold, design: .rounded))
                    //                            .fontWeight(.bold)
                    //                            .foregroundColor(Color(hue: 0.728, saturation: 0.953, brightness: 0.741))
                    //                            .multilineTextAlignment(.center)
                    //                            .lineLimit(nil)
                    //                            .padding(.top, 50)
                    
                    Spacer(minLength: 120)
                    Spacer()
                    Spacer()
                    
                    //                        VStack {
                    ////                            Spacer()
                    //
                    //                            ForEach(AppData.shared.OpponentPlayers.indices, id: \.self) { index in
                    //                                    ZStack {
                    //                                        Image("squareImage")
                    //                                            .resizable()
                    //                                            .scaledToFit()
                    //                                            .frame(width: 100, height: 100) // Adjust size as needed
                    //
                    //                                        if index % 2 == 0 {
                    //                                            VStack {
                    //                                                Image("b1")
                    //                                                    .resizable()
                    //                                                    .scaledToFit()
                    //                                                    .frame(width: 30, height: 30) // Adjust size as needed
                    //                                                Text(AppData.shared.OpponentPlayers[index])
                    //                                                    .foregroundColor(Color.purpleColor)
                    //                                            }
                    //                                            .position(x: 50, y: 50) // Adjust position based on square image size
                    //                                        } else {
                    //                                            Image("waiting")
                    //                                                .resizable()
                    //                                                .scaledToFit()
                    //                                                .frame(width: 30, height: 30) // Adjust size as needed
                    //                                                .position(x: 50, y: 50) // Adjust position based on square image size
                    //                                        }
                    //                                    }
                    //                                }
                    //
                    //                            ForEach(AppData.shared.OpponentPlayers, id: \.self) { opponentPlayer in
                    //                                    Button(action: {
                    //                                        // Action for the button
                    //                                    }) {
                    //                                        VStack {
                    //                                            Image("b1")
                    //                                                .resizable()
                    //                                                .scaledToFit()
                    //                                                .frame(width: 50 * imageSize, height: 50 * imageSize)
                    //                                            Text(opponentPlayer)
                    //                                                .foregroundColor(Color.purpleColor)
                    //                                        }
                    //                                    }
                    //                                }
                    //
                    //
                    //                            HStack {
                    ////                                Spacer()
                    //                                Button(action: {
                    //
                    //                                }) {
                    //                                    VStack {
                    //                                        Image("b1")
                    //                                            .resizable()
                    //                                            .scaledToFit()
                    //                                            .frame(width: 50 * imageSize, height: 50 * imageSize)
                    //                                        Text("Waiting for Players To Join...")
                    //                                            .foregroundColor(Color.purpleColor)
                    //
                    //                                    }
                    //                                }
                    ////                                Spacer()
                    //                            }
                    //
                    //                            HStack {
                    //                                Button(action: {
                    //                                    // Action for b2
                    //                                }) {
                    //                                    VStack {
                    //                                        Image("b2")
                    //                                            .resizable()
                    //                                            .scaledToFit()
                    //                                            .frame(width: 50 * imageSize, height: 50 * imageSize)
                    //                                        Text("User2")
                    //                                            .foregroundColor(.purple)
                    //                                    }
                    //
                    //                                    Image("Waiting Line")
                    //                                        .frame(width: 230, height: 350)
                    //                                }
                    ////                                Spacer()
                    ////                                Spacer()
                    ////                                Spacer()
                    //                                Button(action: {
                    //                                    // Action for b3
                    //                                }) {
                    //                                    VStack {
                    //                                        Image("b3")
                    //                                            .resizable()
                    //                                            .scaledToFit()
                    //                                            .frame(width: 50 * imageSize, height: 50 * imageSize)
                    //                                        Text("User3")
                    //                                            .foregroundColor(.purple)
                    //                                    }
                    //                                }
                    //
                    //                            }
                    //
                    //                            HStack {
                    ////                                Spacer()
                    //                                Button(action: {
                    //                                    // Action for b4
                    //                                }) {
                    //                                    VStack {
                    //                                        Image("b4")
                    //                                            .resizable()
                    //                                            .scaledToFit()
                    //                                            .frame(width: 50 * imageSize, height: 50 * imageSize)
                    //                                        Text("User4")
                    //                                            .foregroundColor(.purple)
                    //                                    }
                    //                                }
                    ////                                Spacer()
                    //                            }
                    //                        }
                    //                        .padding(.top)
                    
                    
                    
                    VStack(spacing: 20) {
                            ForEach(0..<(AppData.shared.OpponentPlayers.count / 2 + AppData.shared.OpponentPlayers.count % 2), id: \.self) { row in
                                HStack(spacing: 20) {
                                    ForEach(row * 2..<min((row + 1) * 2, AppData.shared.OpponentPlayers.count), id: \.self) { index in
                                        ZStack{
                                            Rectangle()
                                                .foregroundColor(.clear)
                                                .frame(width: 150, height: 145)
                                                .background(Color(red: 0.84, green: 0.60, blue: 0.91))
                                                .cornerRadius(17)
                                            
                                            VStack{
                                                Image("b1")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 50 * imageSize, height: 50 * imageSize)
                                                
                                                Text(AppData.shared.OpponentPlayers[index])
                                                    .foregroundColor(Color.purpleColor)
                                                    .font(Font.custom("Inter", size: 16))
                                                    .padding()
                                            }
                                        }
                                    }
                                }
                            }
                    }  
                    .onReceive(AppData.shared.$OpponentPlayers) { _ in
                        DispatchQueue.main.async { refreshID = UUID() }
                    }
                   .id(refreshID)
                
                    if(comingfrom == "create_room"){
                        Text("Continue when your all players joined!!")
                            .foregroundColor(Color.purpleColor)
                            .padding()
                    }
                    
                    Spacer()
                    // Share Button and Rectangle
                    VStack {
                 
                        if(comingfrom == "create_room"){
                            HStack {
                                Spacer()
                                Button(action: {
                                    // Implement share action
                                    // Present share sheet
                                    // Toggle share window
                                    withAnimation {
                                        showShareWindow.toggle()
                                    }
                                }) {
                                    //                                        Spacer()
                                    Image(systemName: "square.and.arrow.up")
                                        .resizable()
                                        .foregroundColor(.purpleColor)
                                    //                                            .background(Color.purple)
                                        .frame(width: 30 * imageSize, height: 35 * imageSize)
                                }
                                Spacer(minLength: 60)
                                
                                ZStack {
                                    RoundedRectangle(cornerRadius: 8.79)
                                        .fill(Color(#colorLiteral(red: 0.47843137383461, green: 0.12156862765550613, blue: 0.6274510025978088, alpha: 0)))
                                    
                                    RoundedRectangle(cornerRadius: 8.79)
                                        .strokeBorder(Color(#colorLiteral(red: 0.47843137383461, green: 0.12156862765550613, blue: 0.6274510025978088, alpha: 1)), lineWidth: 1)
                                }
                                .frame(width: 168, height: 45)
                                .overlay(
                                    Text( generatedcode)
                                        .foregroundColor(.purple)
                                )
                                Spacer(minLength: 20)
                                
                                NavigationLink(destination: ThemeView()) {
                                    Image(systemName: "arrow.right")
                                        .resizable()
                                        .foregroundColor(.purpleColor)
                                    //                                            .background(Color.purple)
                                        .frame(width: 30 * imageSize, height: 30 * imageSize)
                                        .padding(.horizontal)
                                }
                                //                                    Spacer()
                                
                            }
                        }
                        // Sliding share window
                        if showShareWindow {
                            VStack {
                                //                                                    Spacer()
                                Spacer()
                                HStack {
                                    
                                    Spacer()
                                    VStack(alignment: .leading, spacing: 20) {
                                        ShareOptionButton(iconName: "doc.on.doc", text: "Copy text")
                                        ShareOptionButton(iconName: "square.and.arrow.up", text: "Share code")
                                        ShareOptionButton(iconName: "message", text: "Forward via WhatsApp")
                                        ShareOptionButton(iconName: "envelope", text: "Forward by mail")
                                    }
                                    
                                    Spacer()
                                    
                                }
                                Spacer()
                                
                            }
                            .frame(maxWidth: 1000, maxHeight: 200)
                            .background(Color.white)
                            
                            .transition(.move(edge: .bottom))
                            .edgesIgnoringSafeArea(.all)
                            .onTapGesture {
                                // Dismiss share window when tapped outside
                                withAnimation {
                                    showShareWindow.toggle()
                                }
                            }
                        }
                        Spacer()
                        
                        NavigationLink(
                            destination: destinationView,
                            isActive: $privateShouldNavigateToLoadingGameRoom,
                            label: { EmptyView() }
                        )
                        
                    }.onReceive(DataSocketManager.shared.$shouldNavigateToLoadingGameRoom) { shouldNavigate in
                        if shouldNavigate {
                            privateShouldNavigateToLoadingGameRoom = true
                        }
                    }
                }
            } .navigationBarBackButtonHidden(true)
        } .navigationBarBackButtonHidden(true)
          .onAppear {
                print("waiting room")
                print(AppData.shared.roomID)
                DataSocketManager.shared.establishSocketConnection()
                if(comingfrom=="create_room"){
                    generatedcode = generateUniqueCode()
                    // Call the callAPI function inside the closure
                    callAPI(endpoint: "/create_room", method: "POST", formData: ["creator_id": "123", "room_id": generatedcode]) { responseString in
                        if let responseString = responseString, let data = responseString.data(using: .utf8) {
                            do {
                                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                                   let session = json["session"] as? [String: Any],
                                   let roomID = session["room_id"] as? String {
                                    AppData.shared.roomID = roomID
                                    AppData.shared.roomID = generatedcode
                                    AppData.shared.mychance = 1
                                    print("Response: \(responseString)")
                                } else {
                                    print("Error: Unable to parse JSON or extract room ID")
                                }
                            } catch {
                                print("Error: \(error)")
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

struct ShareOptionButton: View {
    var iconName: String
    var text: String
    
    var body: some View {
        Button(action: {
            // Action for share option button
        }) {
            HStack(spacing: 10) {
                Image(systemName: iconName)
                    .foregroundColor(.blue)
                Text(text)
                    .foregroundColor(.blue)
            }
        }
    }
}

//struct NewPageView: View {
//    var body: some View {
//        ZStack {
//            Image("themebk")
//                .resizable()
//                .scaledToFill()
//                .edgesIgnoringSafeArea(.all)
//
//        }
//    }
//}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        //        HomeView()
        WaitingRoomView(comingfrom: "create_room")
    }
}
