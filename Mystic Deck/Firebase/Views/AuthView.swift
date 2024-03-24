//
//  AuthView.swift
//  SwiftUI-Auth
//
//  Created by Derek Hsieh on 1/7/23.
//

import SwiftUI

struct AuthView2: View {
    @State private var currentViewShowing: String = "login" // login or signup
        
    var body: some View {
        
        if(currentViewShowing == "login") {
            LoginView2(currentShowingView: $currentViewShowing)
                .preferredColorScheme(.light)
        } else {
            SignupView2(currentShowingView: $currentViewShowing)
                .preferredColorScheme(.dark)
                .transition(.move(edge: .bottom))
        }
  
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView2()
    }
}
