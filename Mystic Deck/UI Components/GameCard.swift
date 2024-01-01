import SwiftUI


//This is a code for Card structure
struct GameCard: View {
    var imageName: String
    var cardHeading: String
    var rectangles: [(String, String, String, String)] // (Rectangle Heading, Rectangle Content, Start Color, End Color)
    @State private var selectedRectangle: (String, String, String, String)? = nil
    
    var body: some View {
        ZStack(alignment: .top) {
            
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 320, height: 420)
                .cornerRadius(30)
            
            VStack(){
                
                Text(cardHeading)
                    .font(.system(size: 32))
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
                                        endColor: rectangles[index].3,
                                        isSelected: Binding(
                                                                           get: { isSelected(rectangle: rectangles[index]) },
                                                                           set: { newValue in
                                                                               handleRectangleTap(rectangle: rectangles[index], newValue: newValue)
                                                                           }
                                                                       )
                                    )
                                    .onTapGesture {
//                                        handleRectangleTap(rectangle: rectangles[index], newValue: newValue)
                                        print(index)
                                    }
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal, 5.0)
                .padding(.top, 60.0)
                .cornerRadius(15)
            }
            .padding(.top, 35.0)
        }
        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 4)
    }
    
//    private func handleRectangleTap(rectangle: (String, String, String, String)) {
//        print(rectangle)
//        if let selectedRectangle = selectedRectangle, selectedRectangle.0 == rectangle.0 && selectedRectangle.1 == rectangle.1 {
//            print(selectedRectangle)
//            self.selectedRectangle = nil
//        } else {
//            print(self.selectedRectangle)
//            let updatedRectangle = (rectangle.0, rectangle.1, "#DB8C16", "#D97D27")
//            self.selectedRectangle = updatedRectangle
//            print(self.selectedRectangle)
//            print("selected")
//        }
//    }
    
    
    private func handleRectangleTap(rectangle: (String, String, String, String), newValue: Bool) {
            if newValue {
                selectedRectangle = rectangle
            } else {
                selectedRectangle = nil
            }
        }

        private func isSelected(rectangle: (String, String, String, String)) -> Bool {
            return selectedRectangle != nil && selectedRectangle! == rectangle
        }
    
    
}

//will be removed, only used to see the presentation
//struct HistoryCard_Previews: PreviewProvider {
//    static var previews: some View {
//        GameRoomView()
//}
//}

struct RectangleView: View {
    var heading: String
    var content: String
    var startColor: String
    var endColor: String
    @Binding var isSelected: Bool
//    @State private var isSelected: Bool = true// Add this state
    
    var body: some View {
        
        ZStack(alignment: .leading){
            RoundedRectangle(cornerRadius: 10)
                .fill(LinearGradient(gradient: Gradient(colors: [Color(hex: startColor), Color(hex: endColor)]), startPoint: .top, endPoint: .bottom))
                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 5)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(heading)
                    .font(.system(size: 17))
                    .bold()
                    .foregroundColor(.white)
                    .padding(.leading, 2.0)
                
                Text(content)
                    .font(.system(size: 17))
                    .foregroundColor(.white)
                    .padding(.leading, 5)
                
            }
            .padding(.vertical, 6)
            .padding(.horizontal, 3)
        }
        .frame(width: 140, height: 70)
        
//        .onTapGesture {
//            isSelected.toggle()
//            print("Rectangle tapped - isSelected: \(isSelected)")
//        }
//        .overlay(
//            RoundedRectangle(cornerRadius: 10)
//                .stroke(isSelected ? Color.orange : Color.clear, lineWidth: 2)
//                .fill(LinearGradient(gradient: Gradient(colors: [isSelected ? Color(hex: "#DB8C16") : Color(hex: "#BBB3AC"), isSelected ?  Color(hex: "#D97D27"): Color(hex: "#000000")]), startPoint: .top, endPoint: .bottom))
//        )
        
        .onTapGesture {
                   // Toggle the isSelected state when tapped
                   isSelected.toggle()
               }
               .overlay(
                   RoundedRectangle(cornerRadius: 10)
                       .fill(isSelected ? Color.orange : Color.clear)
               )
        
    }
}
