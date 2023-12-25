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
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                Spacer()
                        .frame(height: 150)
                
            HistoryCard(
                imageName: "maharashtra",
                cardHeading: "Maharashtra",
                rectangles: [
                    ("AREA (sq km)", "308,000", "#BBB3AC", "#000000"),
                    ("POPULATION", "13.16 crore", "#BBB3AC", "#000000"),
                    ("MPI", "0.033", "#BBB3AC", "#000000"),
                    ("POLLUTION", "137 AQI avg.", "#BBB3AC", "#000000"),
                    ("LITERACY RATE", "82.3%", "#BBB3AC", "#000000"),
                    ("GDP", "35.3 lakh cr.", "#BBB3AC", "#000000"),
                ]
            )
                
//                CustomButton(buttonText: "PLAY") {
//                    print("Button clicked!")
//                    isNavigationActive = true
//                    // Perform any action you want here
//                }
            }
        }
}

struct GameRoomView_Previews: PreviewProvider {
    static var previews: some View {
        GameRoomView()
    }
}
