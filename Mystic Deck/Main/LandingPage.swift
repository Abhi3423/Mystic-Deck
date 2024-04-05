import SwiftUI

struct LandingPage: View {
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

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var rememberMe: Bool = false
  
    
    var body: some View {
        ZStack {
         
            // Background Image
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
                

                
            //Spacer(minLength: 10)
          
                
                TextField("Email", text: $username)
                    //.fontWeight(.semibold)
                    .foregroundColor(Color(hex: "7A1FA0"))
                    .padding()
                    .frame(width: 300.0)
                    //.background(Color(hex: "5D0083").opacity(0.3))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(hex: "7A1FA0"), lineWidth: 1)
                    )

      
                
                SecureField("Password", text: $password)
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

                HStack {
                    CheckBoxView(checked: $rememberMe)
                    Text("Remember Me")
                        .font(.system(size: 14))
                    
                        .foregroundColor(Color(hex: "7A1FA0"))
                }
//                
                NavigationLink(destination: NavigationBarView()) {
                    Text("Login")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 200.0)
                        .padding()
                        .background(Color(hex: "7A1FA0"))
                        .cornerRadius(10)
                }
                
                Spacer() // Add a Spacer to push the "Forgot Password?" text to the center
                
                HStack {
                    Spacer()
                    NavigationLink(destination: ForgotPasswordView()) {
                        Text("Forgot Password?")
                            .font(.system(size: 12))
                            .foregroundColor(Color(hex: "7A1FA0"))
                            .padding(.top, 10)
                    }
                    Spacer()
                }
            }
            .padding()
        }
    }
}

struct ForgotPasswordView: View {
    var body: some View {
        Text("Forgot Password View")
            .padding()
    }
}


struct SignupView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var rememberMe: Bool = false
    
    var body: some View {
        ZStack {
            // Background Image
            // Background Image
            Image("landtheme")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("LD")
                    .resizable()
                    .scaledToFit()
                    .padding(.top, 10)
                Text("MysticDeck")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color(hex: "7A1FA0"))
                


                TextField("Email", text: $email)
                    //.fontWeight(.semibold)
                    .foregroundColor(Color(hex: "7A1FA0"))
                    .padding()
                    .frame(width: 300.0)
                    //.background(Color(hex: "5D0083").opacity(0.3))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(hex: "7A1FA0"), lineWidth: 1)
                    )

      
                
                SecureField("Password", text: $password)
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
                Text("")

                
                NavigationLink(destination: NavigationBarView()) {
                    Text("Sign up")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 300.0)
                        .background(Color(hex: "7A1FA0"))
                        .cornerRadius(10)
                }
            Spacer()

                
                Rectangle()
                    .fill(Color(hex: "7A1FA0"))
                    .frame(height: 2)
                    .padding(.vertical, 10)
                
                Text("Or SignUp with")
                    .foregroundColor(Color(hex: "7A1FA0"))
                
                HStack(spacing: 20) {
                    Button(action: {
                        // Handle Google Login
                    }) {
                        Image("googleIcon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 65, height: 70)
                    }
                    
                    
                    Button(action: {
                        // Handle Apple Login
                    }) {
                        Image("appleIcon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70, height: 70)
                    }
                }
              Spacer()
                Spacer()
               
            }
            .padding()
        }
    }
}




struct CheckBoxView: View {
    @Binding var checked: Bool
    
    var body: some View {
        Button(action: {
            self.checked.toggle()
        }) {
            Image(systemName: checked ? "checkmark.square.fill" : "square")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(checked ? Color.blue : Color.gray)
        }
    }
}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage()
    }
}
