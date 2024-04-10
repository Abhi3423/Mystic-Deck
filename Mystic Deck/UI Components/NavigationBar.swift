//
//  NavigationTab.swift
//  Mystic Deck
//
//  Created by user1 on 10/01/24.
//

import Foundation

import SwiftUI
import FirebaseAuth




struct NavigationBarView: View {
    @State private var selectedTab: Int = 0
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                switch selectedTab {
                case 0:
                    HomeView()
                case 1:
                    AchievementsView()
                case 2:
                    GuideView()
                case 3:
                    SettingsView()
                default:
                    EmptyView()
                }
                
                Spacer()
                
                HStack {
                    TabBarButton(imageName: "house.fill", title: "Home", tabIndex: 0, selectedTab: $selectedTab)
                        .dynamicTypeSize(.xxLarge)
                    Spacer()
                    TabBarButton(imageName: "rosette", title: "Achievements", tabIndex: 1, selectedTab: $selectedTab)
                        .dynamicTypeSize(.xxLarge)
                    Spacer()
                    TabBarButton(imageName: "book.fill", title: "Guide", tabIndex: 2, selectedTab: $selectedTab)
                        .dynamicTypeSize(.xxxLarge)
                    Spacer()
                    TabBarButton(imageName: "gearshape.fill", title: "Settings", tabIndex: 3, selectedTab: $selectedTab)
                        .dynamicTypeSize(.xxxLarge)
                }
                .padding(.horizontal,40)
                .padding(.top,10)
                .padding(.bottom,-16)
                .background(Color(red: 0.48, green: 0.12, blue: 0.63).opacity(0.9))
            }
            
            .background(
                ZStack {
                    Image("themenew")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                }
            )
            
            // .navigationBarItems(leading: Heading(), trailing: ProfileButton())
            
        }
        .navigationBarBackButtonHidden(true)
        
    }
    
}



struct TabBarButton: View {
    let imageName: String
    let title: String
    let tabIndex: Int
    @Binding var selectedTab: Int
    
    func onClick() {
        print("Button clicked! Additional actions can be performed here.")
        selectedTab = tabIndex
    }
    
    var body: some View {
        
        VStack{
            Button("", systemImage: imageName, action: onClick)    .labelStyle(.iconOnly)
                .foregroundColor(selectedTab == tabIndex ? .white : .white.opacity(0.4))
            
            Text("\(title)")
                .font(Font.custom("Hoefler Text", size: 13))
                .padding(.top,1.0)
                .foregroundColor(selectedTab == tabIndex ? .white : .white.opacity(0.4))
        }
    }
}


struct Navbar: View {
    let NavbarHeading: String
    
    var body: some View{
        
        HStack {
            
            
            Image("profile")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 40) // Adjusted frame size to reduce image size
                .foregroundColor(.white)
                .padding(.horizontal, -10)
                .padding(.vertical, -25)
                .onTapGesture {
                    // Handle tapping the export icon
                }
            
//            Image("back")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 50, height: 40) // Adjusted frame size to reduce image size
//                .foregroundColor(.white)
//                .padding(.horizontal, 3)
//                .padding(.vertical, -25)
//                .onTapGesture {
//                    // Handle tapping the export icon
//                }
            
            Spacer()
            
            Text(NavbarHeading)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
                .lineLimit(0)
                .padding(.vertical, -5)
                
            
            Spacer() // Added spacer to push images to the right
            
            Image("bar")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40) // Adjusted frame size to reduce image size
                .foregroundColor(.white)
                .padding(.horizontal, 5)
                .padding(.vertical, -25)
                .onTapGesture {
                    // Handle tapping the export icon
                }
        }
        .padding(.horizontal)
        .padding(.top, 4.0)
    }
}

struct AchievementsView: View {
    var body: some View {
        
        Navbar(NavbarHeading: "Achievements")
        
        VStack(alignment: .center, spacing: 20.0) {
            AcheivementBox(imagename:"beginner", title: "Beginner", description: "Unlock your first card!")
            
            AcheivementBox(imagename:"collector", title: "Collector", description: "Unlock your first card!")
            
            AcheivementBox(imagename:"master", title: "Master", description: "Unlock your first card!")
            
        }.padding(.vertical,50.0)
    }
    
    struct AcheivementBox: View{
        var imagename: String
        var title: String
        var description: String
        
        var body: some View{
            ZStack() {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 325, height: 117)
                    .background(Color(red: 0.95, green: 0.81, blue: 1))
                    .cornerRadius(15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .inset(by: 0.50)
                            .stroke(Color(red: 0.48, green: 0.12, blue: 0.63), lineWidth: 0.50)
                    )
                    .offset(x: 0, y: 0)
                    .shadow(
                        color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 4
                    )
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 91, height: 85)
                    .background(Color(red: 0.48, green: 0.12, blue: 0.63).opacity(0.40))
                    .cornerRadius(10)
                    .offset(x: -104, y: 0)
                Text("\(title)")
                    .font(Font.custom("Inter", size: 17).weight(.heavy))
                    .lineSpacing(13.74)
                    .foregroundColor(Color(red: 0.48, green: 0.12, blue: 0.63))
                    .offset(x: -6, y: -31.50)
                ZStack() {
                    Image("\(imagename)")
                        .frame(width: 64, height: 45.90)
                        .offset(x: -78, y: 15)
                    
                }
                .frame(width: 62.69, height: 40.90)
                .offset(x: -31.37, y: -17.55)
                .rotationEffect(.degrees(-3.05))
                Text("\(description)")
                    .font(Font.custom("Inter", size: 12).weight(.heavy))
                    .lineSpacing(13.74)
                    .foregroundColor(Color(red: 0.48, green: 0.12, blue: 0.63).opacity(0.50))
                    .offset(x: 20.50, y: -7.50)
                ZStack() {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 191, height: 23)
                        .background(Color(red: 0.48, green: 0.12, blue: 0.63).opacity(0.40))
                        .cornerRadius(5)
                        .offset(x: 0, y: 0)
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 163, height: 16)
                        .background(Color(red: 0.95, green: 0.81, blue: 1))
                        .cornerRadius(3)
                        .offset(x: -11, y: 0.50)
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 58, height: 16)
                        .background(Color(red: 0.48, green: 0.12, blue: 0.63))
                        .cornerRadius(3)
                        .offset(x: -63.50, y: 0.50)
                    Text("3")
                        .font(Font.custom("Inter", size: 8.20).weight(.semibold))
                        .lineSpacing(6.62)
                        .foregroundColor(Color(red: 0.48, green: 0.12, blue: 0.63))
                        .offset(x: 77.50, y: 1)
                    Text("25%")
                        .font(Font.custom("Inter", size: 8.20).weight(.semibold))
                        .lineSpacing(6.62)
                        .foregroundColor(Color(red: 0.48, green: 0.12, blue: 0.63))
                        .offset(x: -2.50, y: 0)
                }
                .frame(width: 191, height: 23)
                .offset(x: 50, y: 31)
            }
            .frame(width: 325, height: 117)
        }
    }
}


struct GuideView: View {
    let points = [
        "1. User login to the app.",
        "2. If the user is the leader, they create a room and share the code with friends.",
        "3. Friends click on 'Join Room' and enter the unique code in the text field.",
        "4. The leader selects a theme for the game; only the leader can select the theme.",
        "5. The game starts, and Player 1 selects a parameter on their card that they think is best.",
        "6. Player 1 clicks 'Play', and other players select the same type of parameter.",
        "7. All card parameters are compared, and the highest one wins the round."
    ]
    
    @State private var currentIndex = 0
    
    var body: some View {
        
        Navbar(NavbarHeading: "Guide")
        
        GeometryReader { geometry in
            ScrollView {
                VStack(alignment: .center, spacing: 30) {
                    GuideBox()
                    GuideBox()
                    GuideBox()
                }
            }
            .frame(width: geometry.size.width)
            .padding(.top, 60.0)
        }
    }
    
    
    struct GuideBox: View{
        var body: some View{
            ZStack() {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 325, height: 237)
                    .background(Color(red: 0.95, green: 0.81, blue: 1))
                    .cornerRadius(15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .inset(by: 0.50)
                            .stroke(Color(red: 0.48, green: 0.12, blue: 0.63), lineWidth: 0.50)
                    )
                    .offset(x: 0, y: 0)
                    .shadow(
                        color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 4
                    )
                Text("How to Play")
                    .font(Font.custom("Inter", size: 17).weight(.semibold))
                    .lineSpacing(13.74)
                    .foregroundColor(Color(red: 0.48, green: 0.12, blue: 0.63))
                    .offset(x: 0, y: -90.50)
                HStack{
                    Text("Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.Lorem ipsum dolor sit amet")
                        .font(Font.custom("Inter", size: 12))
                        .lineSpacing(17)
                        .foregroundColor(Color(red: 0.48, green: 0.12, blue: 0.63))
                }.padding()
            }
            .frame(width: 325, height: 237)
        }
    }
}



struct SettingsView: View {
    @State private var isSoundEnabled = true
    @State private var isNotificationEnabled = true
    @State private var isHintsEnabled = true
    
    var body: some View {
        
        Navbar(NavbarHeading: "Settings")
        
        VStack(spacing: 20) {
            Spacer()
            Toggle("Sound", isOn: $isSoundEnabled)
                .font(.title) // Increase text size
                .toggleStyle(SwitchToggleStyle(tint: Color(hex: "7A1FA0")))
            
            Spacer()
            Toggle("Notification", isOn: $isNotificationEnabled)
                .font(.title) // Increase text size
                .toggleStyle(SwitchToggleStyle(tint: Color(hex: "7A1FA0")))
            Spacer()
            Toggle("Hints", isOn: $isHintsEnabled)
                .font(.title) // Increase text size
                .toggleStyle(SwitchToggleStyle(tint: Color(hex: "7A1FA0")))
            Spacer()
            Button(action: {
                // Action for Connect with Social Media
            }) {
                Text("Connect with Social Media to Send Gifts to Friends")
                    .fontWeight(.semibold)
                    .foregroundColor(Color(hex: "7A1FA0"))
                    .padding()
                    .frame(width: 300.0)
                //.background(Color(hex: "5D0083").opacity(0.3))
                    .cornerRadius(10)
                    .padding(.horizontal, 24.0)
                    .padding(.vertical, 14.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(hex: "7A1FA0"), lineWidth: 1)
                    )
            }
            //            .padding(.horizontal, 24.0)
            //            .padding(.vertical, 14.0)
            //            .frame(maxWidth: .infinity)
            //            .background(LinearGradient(gradient: Gradient(colors: [Color(hue: 0.628, saturation: 0.553, brightness: 0.841), Color(red: 75/255, green: 0/255, blue: 130/255)]), startPoint: .leading, endPoint: .trailing))
            //            .cornerRadius(10)
            
            Button(action: {
                // Action for Contact Us
            }) {
                Text("Contact Us")
                    .fontWeight(.semibold)
                    .foregroundColor(Color(hex: "7A1FA0"))
                    .padding()
                    .frame(width: 300.0)
                //.background(Color(hex: "5D0083").opacity(0.3))
                    .cornerRadius(10)
                    .padding(.horizontal, 24.0)
                    .padding(.vertical, 14.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(hex: "7A1FA0"), lineWidth: 1)
                    )
            }
            //            .padding(.horizontal, 24.0)
            //            .padding(.vertical, 14.0)
            //            .frame(maxWidth: .infinity)
            //            .background(LinearGradient(gradient: Gradient(colors: [Color(hue: 0.628, saturation: 0.553, brightness: 0.841), Color(red: 75/255, green: 0/255, blue: 130/255)]), startPoint: .leading, endPoint: .trailing))
            //            .cornerRadius(10)
            //            Spacer()
            
            
            Button(action: {
                let firebaseAuth = Auth.auth()
                do {
                    try firebaseAuth.signOut()
                    withAnimation {
                        AppData.shared.username = ""
                    }
                } catch let signOutError as NSError {
                    print("Error signing out: %@", signOutError)
                }
            }) {
                Text("Sign Out")
                    .fontWeight(.semibold)
                    .foregroundColor(Color(hex: "7A1FA0"))
                    .padding()
                    .frame(width: 300.0)
                //.background(Color(hex: "5D0083").opacity(0.3))
                    .cornerRadius(10)
                    .padding(.horizontal, 24.0)
                    .padding(.vertical, 14.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(hex: "7A1FA0"), lineWidth: 1)
                    )
            }
            //            .padding(.horizontal, 24.0)
            //            .padding(.vertical, 14.0)
            //            .frame(maxWidth: .infinity)
            //            .background(LinearGradient(gradient: Gradient(colors: [Color(hue: 0.628, saturation: 0.553, brightness: 0.841), Color(red: 75/255, green: 0/255, blue: 130/255)]), startPoint: .leading, endPoint: .trailing))
            //            .cornerRadius(10)
            
            //            Spacer()
        }
        .padding()
    }
}


struct HomeView: View {
    
    var body: some View {
        
        
        //Home Page
        Navbar(NavbarHeading: "MysticDeck")
        
        VStack{
            
            ZStack {
                
                
                //             Background Image
                //            Image("BG")
                //                .resizable()
                //                .scaledToFill()
                //                .edgesIgnoringSafeArea(.all)
                ////
                //            LinearGradient(gradient: Gradient(colors: [Color(hue: 0.628, saturation: 0.553, brightness: 0.601), Color.clear]), startPoint: .top, endPoint: .center)
                //                .edgesIgnoringSafeArea(.top)
                //
                
                Text("Welcome \(AppData.shared.username) !!")
                    .font(.title)
                    .bold()
                    .foregroundColor(.purple)
                    .padding(.top, -180)
                
                Image("Kite")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .offset(x:10, y:20)
                //                    .frame(width: 300, height: 300)
                
                VStack(spacing: 20) {
                    Spacer(minLength: 1)
                    
                    NavigationLink(destination: LoadingView()) {
                        
                        ButtonView(label: "Join Room")
                    }
                    
                    NavigationLink(destination: WaitingRoomView(comingfrom: "create_room")) {
                        
                        ButtonView(label: "Create Room")
                    }
                }
                //                Image("Lotus")
                //                    .frame(width: 50,height: 80)
                
            }
            .padding(.top, -200)
            
        }
    }
    
}

struct ProfileButton: View {
    var body: some View {
        Button(action: {
            // Handle profile action
        }) {
            Image("832")
                .resizable()
                .frame(width: 60, height: 60.0)
                .clipShape(Circle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView()
    }
}

extension Color {
    static let themebk = Color(red: 0.2, green: 0.4, blue: 0.6)
    static let purpleColor = Color(red: 0x7A / 255.0, green: 0x1F / 255.0, blue: 0xA0 / 255.0)
    static let themenew = Color(red: 0.2, green: 0.4, blue: 0.6)
}
