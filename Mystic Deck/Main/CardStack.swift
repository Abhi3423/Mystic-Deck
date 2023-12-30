
import Foundation
import SwiftyJSON
import SwiftUI

struct CardStack: View {
    var jsonData: JSON
    
    var body: some View {
        VStack{
            Text("hvhvhh")
            
            ScrollView{
                VStack{
                    ForEach(1...4, id: \.self) { cardNumber in
                        if let cardData = jsonData["geography"]["states and cities"]["Cards"]["\(cardNumber)"].dictionary,
                           let name = cardData["name"]?.string,
                           let image = cardData["image"]?.string,
                           let area = cardData["AREA"]?.string,
                           let population = cardData["POPULATION"]?.string,
                           let mpi = cardData["MPI"]?.string,
                           let pollution = cardData["POLLUTION"]?.string,
                           let literacyRate = cardData["LITERACY RATE"]?.string,
                           let gdp = cardData["GDP"]?.string,
                           let startColor = jsonData["geography"]["states and cities"]["Startcolor"].string,
                           let endColor = jsonData["geography"]["states and cities"]["Endcolor"].string{
                            
                            
                            GameCard(
                                imageName: image,
                                cardHeading: name,
                                rectangles: [
                                    ("AREA", area, startColor, endColor),
                                    ("POPULATION", population, startColor, endColor),
                                    ("MPI", mpi, startColor, endColor),
                                    ("POLLUTION", pollution, startColor, endColor),
                                    ("LITERACY RATE", literacyRate, startColor, endColor),
                                    ("GDP", gdp, startColor, endColor),
                                ]
                            )
                        }
                    }
                }
            }
            .frame(width: 50)
        }
    }
}


let jsonData: JSON? = extractCardData()

struct CardStackView_Previews: PreviewProvider {
    static var previews: some View {
        if let unwrappedJsonData = jsonData {
            CardStack(jsonData: unwrappedJsonData)
        } else {
            Text("Failed to load JSON data.")
        }
    }
}
