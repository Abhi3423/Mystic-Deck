//
//  MpGameMove.swift
//  Mystic Deck
//
//  Created by user1 on 23/02/24.
//

import Foundation


struct MpGameMove: Codable{
    enum Action: Int , Codable{
        case start,move , reset,end
    }
    
    let action: Action
    let playName: String?
    let index: Int?
    
    
    func data() -> Data?{
        try? JSONEncoder().encode(self)
    }
}
