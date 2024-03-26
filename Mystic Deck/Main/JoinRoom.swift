import SwiftUI

struct LoadingView: View {
    @State private var code: String = ""
    @State private var navigateToWaitingRoom: Bool = false

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
                        VStack{

                            HStack {
                                
                                
                                Image("back")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50, height: 40) // Adjusted frame size to reduce image size
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 3)
                                    .padding(.vertical, -25)
                                    .onTapGesture {
                                        // Handle tapping the export icon
                                    }
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
                        }
                        .padding(.bottom, 750.5)
                    
                        
//                        themeButtons
//                        
//                        ScrollView {
//                            if selectedTheme != "" {
//                                generateImages(for: selectedTheme)
//                            }
//                        }
                        
                    }
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
                                    .frame(width: 300, height: 40)
                                    .onTapGesture {
                            
          
                                        if (code != "") {
                                            AppData.shared.roomID = "\(code)"
                                            print(AppData.shared.roomID)
                                            navigateToWaitingRoom = true
                                        }
                                    }
//                                Image("Lotus")
//                                    .imageScale(.small)
                            }
                        )
                    }
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}


struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}

