//
//  ContentView.swift
//  SwiftUI-Auth
//
//  Created by Derek Hsieh on 1/7/23.
//

import SwiftUI
import FirebaseAuth

struct ContentView2: View {
    
    @AppStorage("uid") var userID: String = "" {
           didSet {
               // Update AppData.shared.username when userID is set
               AppData.shared.username = userID
           }
    }
    var body: some View {
        
        if userID == "" {
            AuthView2()
        } else {
            NavigationBarView()
//            Text("Logged In! \nYour user id is \(userID)")
//            
//            Button(action: {
//                let firebaseAuth = Auth.auth()
//                do {
//                    try firebaseAuth.signOut()
//                    withAnimation {
//                        userID = ""
//                    }
//                } catch let signOutError as NSError {
//                    print("Error signing out: %@", signOutError)
//                }
//            }) {
//                Text("Sign Out")
//            }
        }
        
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
