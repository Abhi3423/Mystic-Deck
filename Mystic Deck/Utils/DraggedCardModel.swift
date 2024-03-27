//
//  DraggedCardModel.swift
//  Mystic Deck
//
//  Created by Abhishek Yadav on 25/03/24.
//

import Foundation
import Combine

struct DraggedCardModel {
    var imageName: String
    var cardHeading: String
    var rectangles: [(String, String)]
}

class DraggedCardData {
    @Published var draggedCard: DraggedCardModel?
    @Published var draggedCardIndex: Int? = nil
    static let shared = DraggedCardData()
    
    func resetDraggedCard() {
            draggedCard = nil
        }
}
