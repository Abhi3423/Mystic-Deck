import SwiftUI

struct CView: View {
    @State private var isCardThrown = false
    
    var body: some View {
        VStack {
            if !isCardThrown {
                CardStackView()
                    .gesture(
                        DragGesture()
                            .onEnded { value in
                                if value.translation.width > 100 {
                                    withAnimation {
                                        self.isCardThrown = true
                                    }
                                }
                            }
                    )
            } else {
                ThrownCardView()
            }
        }
    }
}

struct CardStackView: View {
    var body: some View {
        VStack {
            Text("Swipe to throw the card")
                .foregroundColor(.blue)
            // Stack of cards here
        }
    }
}

struct ThrownCardView: View {
    var body: some View {
        Text("Thrown card")
            .font(.largeTitle)
            .foregroundColor(.red)
            .padding()
            .rotationEffect(.degrees(-45))
            .offset(x: 0, y: -300)
            .animation(.spring())
    }
}

//struct CView_Previews: PreviewProvider {
//    static var previews: some View {
//        CView()
//    }
//}
