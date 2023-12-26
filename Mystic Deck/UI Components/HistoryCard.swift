import SwiftUI
import SwiftyJSON


struct HistoryCard: View {
    var imageName: String
    var cardHeading: String
    var rectangles: [(String, String, String, String)] // (Rectangle Heading, Rectangle Content, Start Color, End Color)
    @State private var selectedRectangle: (String, String)? = nil
    
    var body: some View {
        ZStack(alignment: .top) {
            
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 320, height: 500)
                .cornerRadius(30)
            
            VStack(){
                
                Text(cardHeading)
                    .font(.system(size: 35))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding()
                    .textCase(.uppercase)
                
                VStack {
                    ForEach(0..<(rectangles.count / 2), id: \.self) { rowIndex in
                        HStack(spacing: 20) {
                            ForEach(0..<2, id: \.self) { colIndex in
                                let index = rowIndex * 2 + colIndex
                                if index < rectangles.count {
                                    RectangleView(
                                        heading: rectangles[index].0,
                                        content: rectangles[index].1,
                                        startColor: rectangles[index].2,
                                        endColor: rectangles[index].3
                                    )
                                    .onTapGesture {
                                handleRectangleTap(rectangle: rectangles[index])
                                                                        }
                                    .background(selectedRectangle != nil ?
                                        Color.orange.opacity(1) : Color.clear)
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal, 5.0)
                .padding(.top, 100.0)
                .cornerRadius(15)
            }
            .padding(.top, 35.0)
        }
    }
    
    private func handleRectangleTap(rectangle: (String, String, String, String)) {
        if let selectedRectangle = selectedRectangle, selectedRectangle.0 == rectangle.0 && selectedRectangle.1 == rectangle.1 {
            self.selectedRectangle = nil
            print("helllo")
        } else {
            self.selectedRectangle = (rectangle.0, rectangle.1)
            print("selected")
        }
    }


}

struct HistoryCard_Previews: PreviewProvider {
    static var previews: some View {
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
            ])
    }
}

struct RectangleView: View {
    var heading: String
    var content: String
    var startColor: String
    var endColor: String
//    @State private var isSelected: Bool = false // Add this state
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(heading)
                .font(.system(size: 17))
                .bold()
                .foregroundColor(.white)
                .padding(.leading, 2)
            Text(content)
                .font(.system(size: 16))
                .foregroundColor(.white)
                .padding(.leading, 5)
        }
        .padding(.vertical, 6)
        .padding(.horizontal, 3)
        .frame(width: 140)
        .background(LinearGradient(gradient: Gradient(colors: [Color(hex: startColor), Color(hex: endColor)]), startPoint: .top, endPoint: .bottom))
        .cornerRadius(10)
//        .onTapGesture {
//                    isSelected.toggle()
//                    print("Rectangle tapped - isSelected: \(isSelected)")
//                }
//        .overlay(
//                    RoundedRectangle(cornerRadius: 10)
//                        .stroke(isSelected ? Color.orange : Color.clear, lineWidth: 2)
//                )

    }
}
