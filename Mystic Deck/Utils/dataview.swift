import SwiftyJSON

func extractCardData() -> JSON? {
    guard let url = Bundle.main.url(forResource: "everydata", withExtension: "json") else {
        print("Error: JSON file not found.")
        return nil
    }

    do {
        let data = try Data(contentsOf: url)
        let json = try JSON(data: data)
        
        
        return json
       
    } catch {
        print("Error loading JSON file: \(error.localizedDescription)")
        return nil
    }
}

// Call the function to extract and print card data
//extractCardData()
