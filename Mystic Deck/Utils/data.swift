//import Foundation
//
//func parseJSON() {
//    let jsonString = """
//    {
//      "geography" : {
//        "states and cities" : null,
//        "agriculture" : {
//
//        },
//        "rivers" : null,
//        "crime and safety" : {
//          "percentage" : "20%"
//        }
//      },
//      "history" : {
//        "agriculture" : {
//
//        },
//        "constitution" : {
//
//        },
//        "medieval" : null,
//        "heritage" : {
//          "percentage" : "20%"
//        }
//      }
//    }
//    """
//
//    if let data = jsonString.data(using: .utf8) {
//        do {
//            if let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
//                // Now you have a Swift dictionary containing the parsed JSON data
//                print(jsonObject)
//                
//                // Access specific data
//                if let geography = jsonObject["geography"] as? [String: Any],
//                   let crimeAndSafety = geography["crime and safety"] as? [String: Any],
//                   let percentage = crimeAndSafety["percentage"] as? String {
//                    print("Crime and Safety Percentage:", percentage)
//                }
//                
//                if let history = jsonObject["history"] as? [String: Any],
//                   let heritage = history["heritage"] as? [String: Any],
//                   let percentage = heritage["percentage"] as? String {
//                    print("Heritage Percentage:", percentage)
//                }
//            }
//        } catch {
//            print("Error parsing JSON:", error)
//        }
//    }
//}
//
//
