import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                // Background Image
                Image("themebk")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    // Welcome Text
                    Text("Welcome User")
                        .font(.system(size: 36, weight: .bold, design: .rounded))
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color(hue: 0.728, saturation: 0.953, brightness: 0.741))
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                        .padding(.top, -150)
                        //.padding(.bottom, 0)
                    
                    // Join and Create Room Buttons
                    VStack(spacing: 70) {
                        NavigationLink(destination: WaitingRoomView()) {
                            Text("Join Room")
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 300, height: 100)
                                .background(LinearGradient(gradient: Gradient(colors: [Color(hue: 0.628, saturation: 0.553, brightness: 0.841), Color(red: 75/255, green: 0/255, blue: 130/255)]), startPoint: .leading, endPoint: .trailing))
                                .cornerRadius(40)
                        }
                        NavigationLink(destination: WaitingRoomView()) {
                            Text("Create Room")
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 300, height: 100)
                                .background(LinearGradient(gradient: Gradient(colors: [Color(hue: 0.628, saturation: 0.553, brightness: 0.841), Color(red: 75/255, green: 0/255, blue: 130/255)]), startPoint: .leading, endPoint: .trailing))
                                .cornerRadius(40)
                        }
                    }
                    //.padding(.horizontal, 50)
                    //.frame(maxWidth: .infinity)
                    //.background(Color.black.opacity(0))
                    //.cornerRadius(0)
                }
            }
        }
    }
}

struct WaitingRoomView: View {
    @State private var imageSize: CGFloat = 1.0 // default scale factor
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background Image
                Image("themebk")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    // Title
                    Text("Waiting Room")
                        .font(.system(size: 26, weight: .bold, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(Color(hue: 0.728, saturation: 0.953, brightness: 0.741))
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                        .padding(.top, 20)
                    Spacer()
                   
                    
                    // Buttons at the middle of each edge
                    VStack {
                        HStack {
                            Spacer()
                            Button(action: {
                                // Action for b1
                            }) {
                                VStack {
                                    Image("b1")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 150 * imageSize, height: 150 * imageSize)
                                    Text("User1")
                                        .foregroundColor(.black)
                                }
                            }
                            Spacer()
                        }
                        
                        HStack {
                            Button(action: {
                                // Action for b2
                            }) {
                                VStack {
                                    Image("b2")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 150 * imageSize, height: 150 * imageSize)
                                    Text("User2")
                                        .foregroundColor(.black)
                                }
                            }
                            //Spacer()
                           // Spacer()
                           // Spacer()
                            Button(action: {
                                // Action for b3
                            }) {
                                VStack {
                                    Image("b3")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 150 * imageSize, height: 150 * imageSize)
                                    Text("User3")
                                        .foregroundColor(.black)
                                }
                            }
                        }
                        
                        HStack {
                            Spacer()
                            Button(action: {
                                // Action for b4
                            }) {
                                VStack {
                                    Image("b4")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 150 * imageSize, height: 150 * imageSize)
                                    Text("User4")
                                        .foregroundColor(.black)
                                }
                            }
                            Spacer()
                        }
                    }
                    Spacer()
                    
                    // Share Button and Rectangle
                    VStack {
                       // Spacer()
                        HStack {
                            Spacer()
                            Button(action: {
                                // Implement share action
                                // Present share sheet
                            }) {
                                Image(systemName: "square.and.arrow.up")
                                    .resizable()
                                    .foregroundColor(.white)
                                    .frame(width: 30 * imageSize, height: 35 * imageSize)
                            }
                            Spacer(minLength: 0)
                            
                            Rectangle()
                                .fill(Color.white)
                                .frame(width: 100 * imageSize, height: 40 * imageSize)
                                .cornerRadius(5)
                                .overlay(
                                    Text("CX2031")
                                        .foregroundColor(.black)
                                )
                            Spacer(minLength: 20)
                            
                            NavigationLink(destination: ThemeView()) {
                                Image(systemName: "arrow.right")
                                    .resizable()
                                    .foregroundColor(.white)
                                    .frame(width: 30 * imageSize, height: 30 * imageSize)
                                    .padding(.leading, 10)
                            }
                            Spacer()
                        }
                    }
                }
            }
        }
    }
}

struct NewPageView: View {
    var body: some View {
        ZStack {
            Image("themebk")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
