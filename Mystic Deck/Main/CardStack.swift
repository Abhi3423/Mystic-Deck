import Foundation
import SwiftyJSON
import SwiftUI

struct CardStack: View {
    var jsonData: JSON
    let theme: String
    let topic: String
    //    @Binding var selectedCardData: (String, [String: Any])?
    var body: some View {
        
        let cardData = jsonData[theme][topic]["Cards"]
        let numberOfCards = cardData.dictionary?.count ?? 0
        
        
        if numberOfCards > 0 {
            ZStack(alignment: .top){
                ForEach(1...numberOfCards, id: \.self) { cardNumber in
                    
                    CardBack(cardNumber: cardNumber,jsonData: jsonData, isDragged: DraggedCardData.shared.draggedCardIndex == cardNumber)
                        .rotationEffect(.degrees(Double(cardNumber * cardNumber)-Double(50 / cardNumber)))
                        .offset(x: CGFloat((cardNumber * cardNumber * 4)-(cardNumber * 5)))
                    //                        .onTapGesture {
                    //                            // Send the key of the clicked card to another view
                    //                            let key = "\(cardNumber)"
                    //                            print(key)
                    //                            // Handle sending the key to another view
                    //                        }
                }
            }
         
        } else {
            Text("No data to show")
                .frame(height: 200)
        }
    }
    
}


struct CardBack: View {
    let cardNumber: Int
    var jsonData: JSON
    @State private var isTapped = false
    var isDragged: Bool
    //    @Binding var selectedCardData: (String, [String: Any])?
    var body: some View {
        // Customize the appearance of the CardBack
        Image("CardBack")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 380, height: 260) // Adjust size as needed
            .cornerRadius(10)
            .opacity(isDragged ? 0 : 1.0)
            .gesture(
                DragGesture()
                    .onEnded { value in
                        if value.translation.width < 50 {
                            // When the card is dragged enough, update selectedCardData
                    
                            if let cardData = jsonData[AppData.shared.themeselected][AppData.shared.topicselected]["Cards"]["\(cardNumber)"].dictionary {
                                let imageName = cardData["image"]?.string ?? ""
                                let cardHeading = cardData["name"]?.string ?? ""
                                var rectangles: [(String, String)] = []
                                for (key, value) in cardData {
                                    if key != "image" && key != "name" {
                                        if let stringValue = value.string {
                                            rectangles.append((key, stringValue))
                                        }
                                    }
                                }
                                
                                // Update the draggedCardData with the values obtained
                                DraggedCardData.shared.draggedCardIndex = cardNumber
                                DraggedCardData.shared.draggedCard = DraggedCardModel(imageName: imageName, cardHeading: cardHeading, rectangles: rectangles)
//                                print(DraggedCardData.shared.draggedCard)
                            }
                        }
                        //                            if let cardData = jsonData[AppData.shared.themeselected][AppData.shared.topicselected]["Cards"]["\(cardNumber)"].dictionary {
                        //                                selectedCardData = (String(cardNumber), cardData)
                        //                                print(selectedCardData)
                        //                            }
                        else{
                            print(value.translation.width)
                        }
                    }
            )
    }
}


//let jsonData: JSON? = shuffleCards(for: AppData.shared.themeselected, topic: AppData.shared.topicselected)

//struct CardStackView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardStack(jsonData: JSONDataManager.shared.jsonData ?? "", theme: "ge", topic: "st")
//    }
//}
