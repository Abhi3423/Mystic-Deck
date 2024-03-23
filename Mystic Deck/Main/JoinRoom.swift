import SwiftUI

struct LoadingView: View {
    @State private var code: String = ""
    @State private var navigateToWaitingRoom: Bool = false

    var body: some View {
        NavigationView {
            GeometryReader { geo in
                ZStack {
                    // 1) Background Image
                    Image("landingwave")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                        .frame(width: geo.size.width, height: geo.size.height)

                    // 2) Join Room Text
                    VStack {
                        
                        
                        
                        Text("Join Room")
                            
                            .font(.system(size: 35, weight: .bold, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(Color(hue: 0.728, saturation: 0.953, brightness: 0.741))
                            .multilineTextAlignment(.center)
                            .lineLimit(0)
                            .padding(.top, -100)
                            
                        
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

