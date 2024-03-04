import SwiftUI

struct ScorePage: View {
    var body: some View {
        ZStack {
            Image("mainbg")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                Image("Score")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                
                Text("Congratulations!")
                    .font(.title)
                    .foregroundColor(Color.white)
                    .padding()
                
                Text("You win this round!")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(Color.red)
                    .padding()
                
                Spacer()
            }
        }
    }
}

struct ScorePage_Previews: PreviewProvider {
    static var previews: some View {
        ScorePage()
    }
}
