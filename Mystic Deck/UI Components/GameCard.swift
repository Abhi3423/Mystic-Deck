import SwiftUI


//This is a code for Card structure
struct GameCard: View {
    var imageName: String
    var cardHeading: String
    var rectangles: [(String, String)] // (Rectangle Heading, Rectangle Content, Start Color, End Color)
    @State private var selectedRectangle: (String, String)? = nil
    
    var body: some View {
        ZStack(alignment: .top) {
            
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 370, height: 220)
                .cornerRadius(17)
            
            
//            HStack{
                
//                Text(cardHeading)
//                    .font(Font.custom("Hoefler Text", size: 24).weight(.bold))
//                    .foregroundColor(Color(red: 0.48, green: 0.12, blue: 0.63))
//                    .textCase(.uppercase)
                
                
                VStack {
                    ForEach(0..<(rectangles.count / 2), id: \.self) { rowIndex in
                        HStack(spacing: 20) {
                            ForEach(0..<2, id: \.self) { colIndex in
                                let index = rowIndex * 2 + colIndex
                                if index < rectangles.count {
                                    RectangleView(
                                        heading: rectangles[index].0,
                                        content: rectangles[index].1,
                                        isSelected: Binding(
                                            get: { isSelected(rectangle: rectangles[index]) },
                                            set: {  newValue in
                                                if (AppData.shared.mychance == 1){
                                                    
                                                    handleRectangleTap(rectangle: rectangles[index], newValue: newValue)
                                                }
                                                //                                                else{
                                                //                                                    if(AppData.shared.parameter_name == rectangles[index].0 && AppData.shared.parameter_value == rectangles[index].1 && DataSocketManager.shared.otherPlayerSendValues == true){
                                                //
                                                //                                                        handleRectangleTap(rectangle: rectangles[index], newValue: newValue)
                                                //                                                        print("going to call members play from else if")
                                                //                                                        DataSocketManager.shared.members_play_call(parameterName: rectangles[index].0,parameterValue: rectangles[index].1)
                                                //                                                        //                                                        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                                                //                                                        //                                                            callAPI(endpoint: "/score_update", method: "POST", formData: [ "room_id": AppData.shared.roomID]) { responseString in
                                                //                                                        //                                                                if let responseString = responseString,
                                                //                                                        //                                                                   let data = responseString.data(using: .utf8),
                                                //                                                        //                                                                   let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                                                //                                                        //                                                                   let scores = json["scores"] as? [String: Int],
                                                //                                                        //                                                                   let winner = json["winner"] as? String {
                                                //                                                        //                                                                    if let score = scores[AppData.shared.username] {
                                                //                                                        //                                                                        AppData.shared.score = score
                                                //                                                        //                                                                    }
                                                //                                                        //
                                                //                                                        //                                                                    // Handle the response
                                                //                                                        //                                                                    print("Response:\(responseString)")
                                                //                                                        //
                                                //                                                        //                                                                    if(AppData.shared.username == winner){
                                                //                                                        //                                                                        AppData.shared.mychance = 1
                                                //                                                        //                                                                        showWinSheet = true
                                                //                                                        //                                                                    }else{
                                                //                                                        //                                                                        AppData.shared.mychance = 0
                                                //                                                        //                                                                    }
                                                //                                                        //                                                                } else {
                                                //                                                        //                                                                    // Handle the error
                                                //                                                        //                                                                    print("Failed to fetch data")
                                                //                                                        //                                                                }
                                                //                                                        //                                                            }
                                                //                                                        //                                                        }
                                                //
                                                //                                                    }
                                                //                                                }
                                            }
                                        )
                                    )
                                    .onTapGesture {
                                        if (AppData.shared.mychance == 1) {
                                            print(rectangles[index].1)
                                            AppData.shared.parameter_name = rectangles[index].0
                                            AppData.shared.parameter_value = rectangles[index].1
                                        }
                                    }
                                    .onReceive(DataSocketManager.shared.$otherPlayerSendValues) { newValue in
                                        if newValue {
                                            if (AppData.shared.parameter_name == rectangles[index].0 &&
                                                DataSocketManager.shared.otherPlayerSendValues == true) {
                                                handleRectangleTap(rectangle: rectangles[index], newValue: newValue)
                                                DraggedCardData.shared.draggedCard = DraggedCardModel(imageName: imageName, cardHeading: cardHeading, rectangles: rectangles)
                                                print("going to call members play from onrecieve")
                                                print(rectangles[index].1)
                                                DataSocketManager.shared.otherPlayerSendValues = false
                                                DataSocketManager.shared.members_play_call(parameterName: rectangles[index].0, parameterValue: rectangles[index].1)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal, 5.0)
                .padding(.top, 60.0)
                .cornerRadius(15)
                .offset(x: 57, y: -45)
            }
//        }
        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 4)
        .offset(y: 18)
        
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
    
    
    private func handleRectangleTap(rectangle: (String, String), newValue: Bool) {
        if newValue {
            selectedRectangle = rectangle
        } else {
            selectedRectangle = nil
        }
    }
    
    private func isSelected(rectangle: (String, String)) -> Bool {
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
    @Binding var isSelected: Bool
    //    @State private var isSelected: Bool = true// Add this state
    
    var body: some View {
        
        ZStack(alignment: .leading){
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 100, height: 45.57)
                .background(Color(red: 0.48, green: 0.12, blue: 0.63))
                .cornerRadius(4.72)
                .overlay(
                    RoundedRectangle(cornerRadius: 4.72)
                        .inset(by: -0.50)
                        .stroke(Color(red: 0.95, green: 0.81, blue: 1), lineWidth: 0.50)
                )
                .offset(x: 0, y: 0)
                .shadow(
                    color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 10.07
                )
            
            VStack(alignment: .center, spacing: 4) {
                Text(heading)
                    .font(Font.custom("Inter", size: 10.97).weight(.semibold))
                    .bold()
                    .foregroundColor(.white)
                    .padding(.leading, 2.0)
                
                Text(content)
                    .font(Font.custom("Inter", size: 16.52).weight(.bold))
                    .foregroundColor(.white)
                    .padding(.leading, 5)
                
            }
            .padding(.vertical, 6)
            .padding(.horizontal, 3)
            .frame(width: 100, height: 60)
        }
        .frame(width: 100, height: 60)
        
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
            RoundedRectangle(cornerRadius: 4.72)
                .inset(by: -0.50)
                .stroke( isSelected ? Color.green : Color.clear, lineWidth: isSelected ? 5.50 : 0)
                .fill(isSelected ? Color.purple.opacity(0.95) : Color.clear)
                .frame(width: 100, height: 45.57)
        )
        
    }
}

struct dStackView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 380, height: 220)
                .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                .cornerRadius(17)
                .overlay(
                    RoundedRectangle(cornerRadius: 17)
                        .inset(by: -1)
                        .stroke(Color(red: 0.36, green: 0, blue: 0.51), lineWidth: 1)
                )
                .shadow(
                    color: Color(red: 0, green: 0, blue: 0, opacity: 0.40), radius: 4
                )
            
            GameCard(
                imageName: "Odhisa",
                cardHeading: "Odhisa",
                rectangles: [
                    ("AREA", "12111"),
                    ("POPULATION", "12121"),
                    ("MPI", "21"),
                    ("POLLUTION", "122"),
                    ("LITERACY RATE", "32"),
                    ("GDP", "12"),
                ]
            )
        }
    }
}
