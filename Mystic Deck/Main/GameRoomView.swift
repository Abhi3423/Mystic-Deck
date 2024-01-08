import SwiftUI

struct GameRoomView: View {
    @State private var mysticOffset: CGFloat = -200
    @State private var deckOffset: CGFloat = 400
    @State private var opacity: Double = 0.0
    @State private var buttonopacity: Double = 0.0
    @State private var showLoginButtons: Bool = false
    @State private var showNewText: Bool = true
    @State private var isNavigationActive: Bool = false
    @State private var isSettingsPopupVisible = false
    
    let theme: Theme
    let topic: String
    
    
    var body: some View {
        
        ZStack{
            
            ZStack {
                Image("gameroombg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: 400)
                
                
                VStack{
                    
                    HStack{
                        OppositePlayerProfileView(imageName: "player", name: "Arul", totalCards: 8)
                        OppositePlayerProfileView(imageName: "player", name: "Hitarth", totalCards: 8)
                        OppositePlayerProfileView(imageName: "player", name: "Aman", totalCards: 8)
                    }
                    .padding(.bottom, 40.0)
                    
                    
                    HStack{
                        Text("Abhishek Yadav")
                        Spacer()
                        ZStack{
                            Circle()
                                .fill(Color.green)
                                .frame(width: 40)
                            Text("8")
                                .foregroundColor(.white)
                        }
                        
                    }
                    .font(.system(size: 26))
                    .bold()
                    .padding(.bottom, 20.0)
                    
                    if let unwrappedJsonData = jsonData {
                        CardStack(jsonData: unwrappedJsonData, theme: theme, topic: topic)
                            .offset(x: 20)
                    } else {
                        Text(topic)
                    }
                    
                    Spacer().frame(height: 30)
                    
                    HStack{
                        Spacer()
                        CustomButton(buttonText: "PLAY") {
                            print("Button clicked!")
                            // isNavigationActive = true
                            // Perform any action you want here
                            
                        }
                        Spacer()
                        Image("settings")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .onTapGesture {
                                // Show the settings popup
                                isSettingsPopupVisible.toggle()
                            }
                    }
                    
                }.frame(width: 370, height: 840).padding(.top,50.0)
                
                
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
                        
                        NavigationView{
                            CustomButton(buttonText: "EXIT") {
                                print("Exit")
                                // isNavigationActive = true
                                
                            }
                        }
                        
                        Spacer()
                    }
                    .background(Color.white)
                    .cornerRadius(20)
                    .padding()
                    .frame(height: 200)
                }
            }.padding() .navigationBarBackButtonHidden(true)
        }.navigationBarBackButtonHidden(true)
    }
}

//struct GameRoomView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameRoomView()
//    }
//}
