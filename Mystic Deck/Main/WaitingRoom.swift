import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            // Background Image
            Image("themebk")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            LinearGradient(gradient: Gradient(colors: [Color(hue: 0.628, saturation: 0.553, brightness: 0.601), Color.clear]), startPoint: .top, endPoint: .center)
                .edgesIgnoringSafeArea(.top)
            
            VStack {
                
                Spacer()
                
                // Join and Create Room Buttons
                VStack(spacing: 30) {
                    NavigationLink(destination: LoadingView()) {
                        // Join Room Button
                        ButtonView(label: "Join Room")
                    }
                    
                    NavigationLink(destination: WaitingRoomView()) {
                        // Create Room Button
                        ButtonView(label: "Create Room")
                    }
                }
                
                Spacer()
                
                
                HStack(spacing: 20) {
                    BoxView(content: "Points")
                    BoxView(content: "Duration")
                    BoxView(content: "Stats")
                }
                
                Spacer()
                
                // Tabular View
                TableView()
                
                Spacer()
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
            .frame(width: 300, height: 100)
            .background(LinearGradient(gradient: Gradient(colors: [Color(hue: 0.628, saturation: 0.553, brightness: 0.841), Color(red: 75/255, green: 0/255, blue: 130/255)]), startPoint: .leading, endPoint: .trailing))
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

struct TableView: View {
    var body: some View {
        VStack {
            // Table Header
            HStack {
                Text("Profile")
                Spacer()
                Text("Name")
                Spacer()
                Text("Wins")
            }
            .padding()
            
            // Dummy Data Rows
            HStack {
                Text("Profile 1")
                Spacer()
                Text("Player 1")
                Spacer()
                Text("5")
            }
            .padding()
            
            HStack {
                Text("Profile 2")
                Spacer()
                Text("Player 2")
                Spacer()
                Text("8")
            }
            .padding()
        }.scaledToFit()
    }
}



struct WaitingRoomView: View {
    @State private var imageSize: CGFloat = 1.0 // default scale factor
    @State private var showShareWindow = false
    
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
                            Spacer()
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
                        HStack {
                            Spacer()
                            Button(action: {
                                // Toggle share window
                                withAnimation {
                                    showShareWindow.toggle()
                                }
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
                        .padding(.bottom, 20)
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
            }
            .navigationBarBackButtonHidden(true)
        }
        .navigationBarBackButtonHidden(true)
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
