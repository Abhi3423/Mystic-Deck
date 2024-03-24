//
//  LoginView.swift
//  SwiftUI-Auth
//
//  Created by Derek Hsieh on 1/7/23.
//

import SwiftUI
import FirebaseAuth

struct LoginView2: View {
    @Binding var currentShowingView: String
    @AppStorage("uid") var userID: String = ""
    
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    
    
    private func isValidPassword(_ password: String) -> Bool {
        // minimum 6 characters long
        // 1 uppercase character
        // 1 special char
        
        let passwordRegex = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])(?=.*[A-Z]).{6,}$")
        
        return passwordRegex.evaluate(with: password)
    }
    
    var body: some View {
        ZStack {
            Image("landtheme")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                Image("LD")
                    .resizable()
                    .scaledToFit()
                    .padding(.top, 10)
                Text("MysticDeck")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color(hex: "7A1FA0"))
                

//                Spacer()
//                
//                Spacer()

                HStack {
                    Image(systemName: "mail")
                    TextField("Email", text: $email)
                    
                    Spacer()
                    
                    
                    if(email.count != 0) {
                        
                        Image(systemName: email.isValidEmail() ? "checkmark" : "xmark")
                            .fontWeight(.bold)
                            .foregroundColor(email.isValidEmail() ? .green : .red)
                    }
                    
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.black)
                    
                )
                
                .padding()
                
                
                HStack {
                    Image(systemName: "lock")
                    SecureField("Password", text: $password)
                    
                    Spacer()
                    
                    if(password.count != 0) {
                        
                        Image(systemName: isValidPassword(password) ? "checkmark" : "xmark")
                            .fontWeight(.bold)
                            .foregroundColor(isValidPassword(password) ? .green : .red)
                    }
                    
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.black)
                    
                )
                .padding()
                
                
                Button(action: {
                    withAnimation {
                        self.currentShowingView = "signup"
                    }
                    
                    
                }) {
                    Text("Don't have an account?")
                        .foregroundColor(.black)
                }
                
//                Spacer()
//                Spacer()
//                
                
                Button {
                    Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                        if let error = error {
                            print(error)
                            return
                        }
                        
                        if let authResult = authResult {
                            print(authResult.user.uid)
                            withAnimation {
                                userID = authResult.user.uid
                            }
                        }
                        
                        
                    }
                } label: {
                    Text("Sign In")
                        .foregroundColor(.white)
                        .font(.title3)
                        .bold()
                    
                        .frame(maxWidth: .infinity)
                        .padding()
                    
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(hex: "7A1FA0"))
                        )
                        .padding(.horizontal)
                }
                
                
            }
            
        }
    }
}