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
                    //Text("Email ID")
                        
                    
                    
                    TextField("Email ID", text: $email)
                        .foregroundColor(Color(hex: "7A1FA0"))
                    
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
                        .foregroundColor(Color(hex: "7A1FA0"))
                    
                )
                
                .padding()
                
                
                HStack {
                    Image(systemName: "lock")
                   
                        
                    
                    SecureField("Password", text: $password)
                        .foregroundColor(Color(hex: "7A1FA0"))
                    
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
                        .foregroundColor(Color(hex: "7A1FA0"))
                    
                )
                .padding()
                
                
                Button(action: {
                    withAnimation {
                        self.currentShowingView = "signup"
                    }
                    
                    
                }) {
                    Text("Don't have an account?")
                        .foregroundColor(Color(hex: "7A1FA0"))
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
                Spacer()
                Spacer()
                
                
            }
            
        }
    }
}

