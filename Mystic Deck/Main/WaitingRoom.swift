import SwiftUI

struct HomeView: View {
    
    var body: some View {
        //Home Page
        ZStack {
//             Background Image
//            Image("BG")
//                .resizable()
//                .scaledToFill()
//                .edgesIgnoringSafeArea(.all)
////            
//            LinearGradient(gradient: Gradient(colors: [Color(hue: 0.628, saturation: 0.553, brightness: 0.601), Color.clear]), startPoint: .top, endPoint: .center)
//                .edgesIgnoringSafeArea(.top)
//            
            VStack {
                
           Text("Welcome Users !!")
                    .font(.title)
                    .bold()
                    .foregroundColor(.purple)
                
                Image("Kite")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 300, height: 300)

                VStack() {
                    NavigationLink(destination: LoadingView()) {
                 
                        ButtonView(label: "Join Room")
                    }
                    
                    NavigationLink(destination: WaitingRoomView(comingfrom: "create_room")) {

                        ButtonView(label: "Create Room")
                    }
                }
                Image("Lotus")
                    .frame(width: 50,height: 80)

            }.scaledToFit()
   }
        
        }
    }




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
                
                Image("BG")
                   
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.8)
                
                    VStack {
                        
                        Text("Waiting Room")
                            .font(.system(size: 26, weight: .bold, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(Color(hue: 0.728, saturation: 0.953, brightness: 0.741))
                            .multilineTextAlignment(.center)
                            .lineLimit(nil)
                            .padding(.top, 50)
                        Spacer(minLength: 30)
                        
                        VStack {
//                            Spacer()
                            HStack {
//                                Spacer()
                                Button(action: {
                                    
                                }) {
                                    VStack {
                                        Image("b1")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 50 * imageSize, height: 50 * imageSize)
                                        Text("Waiting for Players To Join...")
                                            .foregroundColor(Color.purpleColor)
                                        
                                    }
                                }
//                                Spacer()
                            }
                            
                            HStack {
                                Button(action: {
                                    // Action for b2
                                }) {
                                    VStack {
                                        Image("b2")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 50 * imageSize, height: 50 * imageSize)
                                        Text("User2")
                                            .foregroundColor(.purple)
                                    }
                                    
                                    Image("Waiting Line")
                                        .frame(width: 230, height: 350)

                            Spacer()
//                                Spacer()
//                                Spacer()
//                                Spacer()
                                Button(action: {
                                    // Action for b3
                                }) {
                                    VStack {
                                        Image("b3")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 50 * imageSize, height: 50 * imageSize)
                                        Text("User3")
                                            .foregroundColor(.purple)
                                    }
                                }
                                
                            }
                            
                            HStack {
//                                Spacer()
                                Button(action: {
                                    // Action for b4
                                }) {
                                    VStack {
                                        Image("b4")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 50 * imageSize, height: 150 * imageSize)
                                        Text("User4")
                                            .foregroundColor(.purple)
                                    }
                                }
//                                Spacer()
                            }
                        }
//                        .padding(.top)
//                        Spacer()
                        
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
                                        Image(systemName: "square.and.arrow.up")
                                            .resizable()
                                            .foregroundColor(.white)
                                            .background(Color.purple)
                                            .frame(width: 30 * imageSize, height: 35 * imageSize)
                                    }
                                    Spacer(minLength: 0)
                                    
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
                                            .foregroundColor(.white)
                                            .background(Color.purple)
                                            .frame(width: 30 * imageSize, height: 30 * imageSize)
                                            .padding(.horizontal)
                                    }
                                    Spacer()
                                }
                            }
                            // Sliding share window
                                            if showShareWindow {
                                                VStack {
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
                                                .frame(maxWidth: 1000, maxHeight: 2000)
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
