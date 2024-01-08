import SwiftUI

struct LoadingGameRoomView: View {
    @State private var showLoading: Bool = true
    @State private var isActive: Bool = false
    let theme: Theme
    let imageName: String
    
    var body: some View {
        ZStack {
            Image("gameroombg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .opacity(showLoading ? 1 : 0)
            
            if showLoading {
                Text("Loading \(imageName)")
                    .foregroundColor(.black)
                    .italic()
                    .font(Font.custom("Hoefler Text", size: 30))
                    .shadow(color: .black, radius: 5, x: 0, y: 0)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                            withAnimation {
                                showLoading = false
                                isActive = true
                            }
                        }
                    }
            }
        }
        .background(
            NavigationLink("", destination: GameRoomView(theme: theme, topic: imageName), isActive: $isActive)
        )
    }
}

//struct LoadingGameRoomView_Previews: PreviewProvider {
   // static var previews: some View {
      //  LoadingGameRoomView()
  //  }
//}
