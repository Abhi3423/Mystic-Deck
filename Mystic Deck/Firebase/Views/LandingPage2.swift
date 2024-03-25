//
//  LandingPage2.swift
//  Mystic Deck
//
//  Created by Hitarth Rathod on 24/03/24.
//

import SwiftUI

struct LandingPage2: View {
    @Binding var shouldShowAuthView: String?
    @State private var showSignUp = false
    @State private var showLogin = false
   
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background Image
                Image("landtheme")
                    .resizable()
                    .scaledToFill()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                Spacer()
                    Image("LD")
                        .resizable()
                        .scaledToFit()
                        .padding(.top, -100)
                    
                    
                    Text("MysticDeck")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color(hex: "7A1FA0"))
                        .multilineTextAlignment(.leading)
                    
                    //Spacer(minLength: 1)
                    
                    VStack(spacing: 10) {
                        NavigationLink(destination: LoginView()) {
                            Text("Login into existing account")
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 300.0)
                                .background(Color(hex: "7A1FA0"))
                                .cornerRadius(10)
                        }
                        Text("or")
                            .foregroundColor(Color(hex: "7A1FA0"))
                        
                        
                        NavigationLink(destination: SignupView()) {
                            Text("Don't have an account? Sign up")
                                .fontWeight(.semibold)
                                .foregroundColor(Color(hex: "7A1FA0"))
                                .padding()
                                .frame(width: 300.0)
                                //.background(Color(hex: "5D0083").opacity(0.3))
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color(hex: "7A1FA0"), lineWidth: 1)
                                )
                        }
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
            }
        }
    }
}
