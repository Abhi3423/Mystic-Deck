import SwiftUI

struct GameRoomView: View {
    @State private var mysticOffset: CGFloat = -200
    @State private var deckOffset: CGFloat = 400
    @State private var opacity: Double = 0.0
    @State private var buttonopacity: Double = 0.0
    @State private var showLoginButtons: Bool = false
    @State private var showNewText: Bool = true
    @State private var isNavigationActive: Bool = false
    
    var body: some View {
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
                .padding(.bottom, 30.0)
                
                if let unwrappedJsonData = jsonData {
                    CardStack(jsonData: unwrappedJsonData)
                        .offset(x: 20)
                } else {
                    Text("Failed to load JSON data.")
                }
                
                Spacer().frame(height: 30)
                CustomButton(buttonText: "PLAY") {
                    print("Button clicked!")
                    // isNavigationActive = true
                    // Perform any action you want here
                    
                }
            }.frame(width: 370, height: 840).padding(.top,50.0)
        }.padding()
    }
}

struct GameRoomView_Previews: PreviewProvider {
    static var previews: some View {
        GameRoomView()
    }
}
