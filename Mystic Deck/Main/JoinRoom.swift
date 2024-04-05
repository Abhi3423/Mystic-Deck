import SwiftUI


struct LoadingView: View {
    @State private var code: String = ""
    @State private var navigateToWaitingRoom: Bool = false
    @State private var navigateToHome: Bool = false
    @State private var JoinMessage: String = ""
    @State private var showMessage: Bool = false
    @State private var refreshID = UUID()
    @State private var isJoinButtonDisabled: Bool = false
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                ZStack {
                    // 1) Background Image
                    Image("themenew1")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                        .frame(width: geo.size.width, height: geo.size.height)
                    
                    
                    VStack (spacing: 30){

                            HStack {
                                
                                Image("back")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50, height: 40)
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 3)
                                    .padding(.vertical, -25)
                                    .onTapGesture {
                                        JoinMessage = ""
                                        showMessage = false
                                        AppData.shared.JoinStatusMessage = ""
                                        navigateToHome = true
                                    }
                                
                                NavigationLink(
                                    destination: NavigationBarView(),
                                    isActive: $navigateToHome,
                                    label: {EmptyView()}
                                    
                                )
                                
                                Spacer(minLength: 85)
                                Text(" Join Room")
                                    .font(.system(size: 20, weight: .bold, design: .rounded))
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white)
                                    .multilineTextAlignment(.center)
                                    .lineLimit(0)
                                    .padding(.vertical, -5)
                                    .padding(.trailing, 10) // Added padding to create space between text and images
                                
                                Spacer() // Added spacer to push images to the right
                                
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
                            }
                        //                        themeButtons
                        //
                        //                        ScrollView {
                        //                            if selectedTheme != "" {
                        //                                generateImages(for: selectedTheme)
                        //                            }
                        //                        }
                        
                    }.padding(.bottom, 750.5)
                    
                    
                    // 2) Join Room Text
                    VStack {
                        
                        
                        //
                        //                        Text("Join Room")
                        //
                        //                            .font(.system(size: 35, weight: .bold, design: .rounded))
                        //                            .fontWeight(.bold)
                        //                            .foregroundColor(Color(hue: 0.728, saturation: 0.953, brightness: 0.741))
                        //                            .multilineTextAlignment(.center)
                        //                            .lineLimit(0)
                        //                            .padding(.top, -100)
                        
                        //
                        
                        
                        //                        ZStack{
                        //                            Rectangle()
                        //                                .foregroundColor(.clear)
                        //                                .frame(width: 300, height: 40)
                        //                                .background(Color(red: 0.36, green: 0, blue: 0.51).opacity(0.04))
                        //                                .cornerRadius(10)
                        //                                .overlay(
                        //                                    RoundedRectangle(cornerRadius: 10)
                        //                                        .inset(by: 1)
                        //                                        .stroke(Color(red: 0.48, green: 0.12, blue: 0.63), lineWidth: 1)
                        //                                )
                        //                                .shadow(
                        //                                    color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 4, y: 4
                        //                                )
                        //
                        //                            Text("\(JoinMessage)")
                        //                                .font(Font.custom("Inter", size: 20).weight(.semibold))
                        //                                .lineSpacing(17.59)
                        //                                .foregroundColor(Color(red: 0.48, green: 0.12, blue: 0.63))
                        //                        }
                        
                        Image("Kite")
                        
                        
                        //                         3) Text Field for "Enter the code"
                        Text("Room Code")
                            .foregroundStyle(.purple)
                        
                        TextField("Enter the code", text: $code)
                            .padding()
                        //                            .background(Color.purpleColor)
                        //                            .background(in: Rectangle, fillStyle: Color.purpleColor)
                            .foregroundColor(.black)
                        //                            .border(.purple,width: 3)
                            .textFieldStyle(.roundedBorder )
                        //                            .background(
                        //                                LinearGradient(gradient: Gradient(colors: [Color(red: 75/255, green: 0/255, blue: 130/255).opacity(0.3), Color(red: 75/255, green: 0/255, blue: 130/255).opacity(0.2)]), startPoint: .leading, endPoint: .trailing)
                        //                            )
                            .cornerRadius(10)
                            .frame(width: 300, height: 40)
                            .cornerRadius(10)
                        
                        
                        if showMessage {
                            ZStack {
                                Text("\(JoinMessage)")
                                    .font(Font.custom("Inter", size: 20).weight(.semibold))
                                    .lineSpacing(17.59)
                                    .foregroundColor(Color(red: 0.48, green: 0.12, blue: 0.63))
                            }
                            .frame(width: 300)
                            .transition(.scale)
                            .id(refreshID)
                            .padding()
                        }
                        
                        
                        NavigationLink(
                            destination: WaitingRoomView(comingfrom: "join_room"),
                            isActive: $navigateToWaitingRoom,
                            label: {
                                Text("Join")
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 24.0)
                                    .padding(.vertical, 14.0)
                                    .background(Color.purpleColor)
                                    .cornerRadius(10)
                                    .frame(width: 80, height: 40)
                                    .onTapGesture {
                                        if (code != "") {
                                            joinButtonAction()
                                        }
                                    }
                                
                            }
                            
                        )
                        
                        
                        Spacer()
                        
                        GeometryReader { geo in
                            
                            Image("Lotus")
                                .resizable()
                                .frame(width: geo.size.width)
                                .shadow(
                                    color: Color(red: 0, green: 0, blue: 0, opacity: 0.40), radius: 26.50, y: 7
                                )
                        }
                        
                        
                    }
                    .padding(.bottom, -80)
                    .padding(.top, 50.0)
                    .onReceive(AppData.shared.$RoomEntryStatus) { shouldNavigate in
                        if shouldNavigate {
                            if(AppData.shared.RoomEntryStatus == true){
                                print(AppData.shared.roomID)
                                navigateToWaitingRoom = true
                                print("going to navigate")
                            }
                        }
                    }
                    .onReceive(AppData.shared.$JoinStatusMessage) { _ in
                        DispatchQueue.main.async { // Ensure updates are on the main thread
                            showMessage = !AppData.shared.JoinStatusMessage.isEmpty
                            JoinMessage = AppData.shared.JoinStatusMessage
                            print(JoinMessage)
                            refreshID = UUID() // Refreshing to trigger the animation again
                        }
                    }
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
    
    private func joinButtonAction() {
            guard !code.isEmpty, !isJoinButtonDisabled else { return }
            isJoinButtonDisabled = true // Disable button
            
            // Perform button action
            AppData.shared.roomID = "\(code)"
            DataSocketManager.shared.establishSocketConnection()
            DataSocketManager.shared.join_room()
            
            // Enable button after a delay
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { // Adjust delay as needed
                isJoinButtonDisabled = false
            }
        }
    
}


struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}

