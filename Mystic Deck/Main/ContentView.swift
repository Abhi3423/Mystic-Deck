//
//  ContentView.swift
//  Mystic Deck
//
//  Created by user1 on 16/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        if let unwrappedJsonData = jsonData {
            CardStack(jsonData: unwrappedJsonData)
        } else {
            Text("Failed to load JSON data.")
        }
    }
}

#Preview {
    ContentView()
}
