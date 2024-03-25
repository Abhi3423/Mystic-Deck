//
//  OppositePlayerProfile.swift
//  Mystic Deck
//
//  Created by user1 on 30/12/23.
//

import Foundation

import SwiftUI

struct OppositePlayerProfileView: View {
    var imageName: String
    var name: String
    var totalCards: Int
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .frame(width: 70, height: 80)
                .padding(.top, 3.0)
            
            Text(name)
                .font(Font.custom("Inter", size: 20.31).weight(.semibold))
                .lineSpacing(17.59)
                .foregroundColor(Color(red: 0.48, green: 0.12, blue: 0.63))
            
            Text("\(totalCards)")
                .font(Font.custom("Inter", size: 22.31).weight(.semibold))
                .lineSpacing(17.59)
                .foregroundColor(Color(red: 0.48, green: 0.12, blue: 0.63).opacity(0.60))
        }
        .padding()
        .frame(width: 160, height: 100)
    }
}

struct CardRectangleView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeView()
    }
}

