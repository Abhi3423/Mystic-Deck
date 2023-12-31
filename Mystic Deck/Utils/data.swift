
import SwiftUI
import SwiftyJSON
func createSampleJSON() -> JSON {
    var mainJSON = JSON()

    // Geography
    var geographyJSON = JSON()
    geographyJSON["states and cities"]["Area"] = "308,000 sq km"
    geographyJSON["states and cities"]["population"] = "12.22"
    geographyJSON["states and cities"]["pollution"] = "127 AQI avg."
    geographyJSON["states and cities"]["MPI"] = "0.033"
    geographyJSON["states and cities"]["Literacy Rate"] = "83.03%"
    geographyJSON["states and cities"]["GDP"] = "32 lakh crores"

    geographyJSON["rivers"]["Area"] = "308,000 sq km"
    geographyJSON["rivers"]["population"] = "12.22"
    geographyJSON["rivers"]["pollution"] = "127 AQI avg."
    geographyJSON["rivers"]["MPI"] = "0.033"
    geographyJSON["rivers"]["Literacy Rate"] = "83.03%"
    geographyJSON["rivers"]["GDP"] = "32 lakh crores"

    geographyJSON["agriculture"] = JSON()

    var crimeAndSafetyJSON = JSON()
    crimeAndSafetyJSON["percentage"] = "20%"
    geographyJSON["crime and safety"] = crimeAndSafetyJSON

    mainJSON["geography"] = geographyJSON
    
    print(geographyJSON["crime and safety"]["percentage"])

    // History
    var historyJSON = JSON()
    historyJSON["medieval"]["Area"] = "308,000 sq km"
    historyJSON["medieval"]["population"] = "12.22"
    historyJSON["medieval"]["pollution"] = "127 AQI avg."
    historyJSON["medieval"]["MPI"] = "0.033"
    historyJSON["medieval"]["Literacy Rate"] = "83.03%"
    historyJSON["medieval"]["GDP"] = "32 lakh crores"

    historyJSON["constitution"] = JSON()
    historyJSON["agriculture"] = JSON()

    var heritageJSON = JSON()
    heritageJSON["percentage"] = "20%"
    historyJSON["heritage"] = heritageJSON

    mainJSON["history"] = historyJSON

    return mainJSON
}

// Example Usage:
let sampleJSON = createSampleJSON()
