//
//  NavigationTab.swift
//  Mystic Deck
//
//  Created by user1 on 10/01/24.
//

import Foundation

import SwiftUI

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
                .background(Color.purpleColor)
             
            }
            .background(
                ZStack {
                    Image("landingwave")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                    
                    LinearGradient(gradient: Gradient(colors: [Color(hue: 0.628, saturation: 0.553, brightness: 0.601), Color.clear]), startPoint: .top, endPoint: .center)
                        .edgesIgnoringSafeArea(.top)
                    
                }
            )

//            .navigationBarItems(leading: Heading(), trailing: ProfileButton())

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
//        Button(
//            Image(systemName: imageName)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 28, height: 28)
//        .padding(.bottom, -30.0)
//            
//        .foregroundColor(selectedTab == tabIndex ? .blue : .gray)) {onClick()
//        }
//        Button(action: onClick) {
//            Image(systemName: imageName)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 28, height: 28)
//        .padding(.bottom, -30.0)
//            
//        }
        VStack{
            Button("", systemImage: imageName, action: onClick)    .labelStyle(.iconOnly)
                .foregroundColor(selectedTab == tabIndex ? .white : .white.opacity(0.6))
            
            Text("\(title)")
                .font(Font.custom("Hoefler Text", size: 13))
                .padding(.top,1.0)
                .foregroundColor(selectedTab == tabIndex ? .white : .white)
        }

//    label: {VStack {
//        Image(systemName: imageName)
//            .resizable()
//            .aspectRatio(contentMode: .fit)
//            .frame(width: 28, height: 28)
//    }
//    .padding(.bottom, -30.0)
//        
//    .foregroundColor(selectedTab == tabIndex ? .blue : .gray)
//    }
//        .onAppear {
//                    // You can print selectedTab here
//                    print(selectedTab)
//                    print(tabIndex)
//                }
    }
}

//struct AchievementsView: View {
//    var body: some View {
//        NavigationView {
//            Image("themebk") // Set background image for the entire view
//                .resizable()
//                .scaledToFill()
//                .edgesIgnoringSafeArea(.all)
//                .overlay(
//                    HStack {
//                        Spacer()
//                        
//                        List {
//                            AchievementRow(title: "Beginner", description: "Unlock your first card")
//                            AchievementRow(title: "Collector", description: "Collect 10 different cards")
//                            AchievementRow(title: "Master", description: "Unlock all cards")
//                            // Add more achievement rows as needed
//                        }
//                        Spacer()
//                    }
//                )
//            
//                .navigationBarTitle("Achievements")
//        }
//    }
//    
//    struct AchievementRow: View {
//        var title: String
//        var description: String
//        
//        var body: some View {
//            VStack(alignment: .leading) {
//                Text(title)
//                    .font(.headline)
//                    .padding()
//                    .background(Color.white.opacity(0.8)) // Background color for title
//                    .cornerRadius(10) // Rounded corners for the title background
//                Text(description)
//                    .font(.subheadline)
//                    .foregroundColor(.gray)
//                    .padding()
//                    //.background(Color.white.opacity(0.8)) // Background color for description
//                    .cornerRadius(10) // Rounded corners for the description background
//            }
//        }
//    }
//}


struct AchievementsView: View {
    let points = [
        Achievement(title: "Beginner", description: "Unlock your first card"),
        Achievement(title: "Collector", description: "Collect 10 different cards"),
        Achievement(title: "Master", description: "Unlock all cards")
    ]
    
    @State private var currentIndex = 0
    
    var body: some View {
        Spacer()
        GeometryReader { geometry in
            ScrollView(.vertical, showsIndicators: true) {
                VStack(spacing: 50) {
                    ForEach(points.indices, id: \.self) { index in
                        AchievementRow(achievement: points[index])
                            .frame(width: geometry.size.width - 40) // Adjust width
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .opacity(currentIndex == index ? 1.0 : 1.0)
                    }
                }
                .frame(width: geometry.size.width - 40) // Adjust width
                .padding()
                .offset(y: CGFloat(currentIndex) * geometry.size.height)
               // .animation(.easeInOut(duration: 1.0))
            }
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { timer in
                withAnimation {
                    currentIndex = (currentIndex) % points.count
                }
            }
        }
        .navigationBarTitle("Achievements")
    }
}

struct Achievement {
    let title: String
    let description: String
}

struct AchievementRow: View {
    let achievement: Achievement
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(achievement.title)
                .font(.system(size: 28)) // Increase font size
                .fontWeight(.bold)
            
            // Conditional image for Beginner achievement
            if achievement.title == "Beginner" {
                Image("Card1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 70, height: 70)
            }
            
            Text(achievement.description)
                .font(.subheadline)
                .font(.system(size: 40))
                .foregroundColor(.gray)
        }
        .padding(.leading) // Push content to the left
    }
}


struct GuideView: View {
    let points = [
        "1. Welcome, oh mighty sorcerer, to the mystical realm of MysticDeck, where the cards hold secrets and magic awaits!",
        "2. As you embark on your journey through the enchanted forest of MysticDeck, summon your fellow wizards by crafting a mystical room. Share the secret incantation with your comrades to unite your powers!",
        "3. Have your friends lost their way in the labyrinth of spells? Fear not! Send forth a mystical signal, guiding them back to your circle of enchantment. Together, you shall conquer the unknown!",
        "4. As the grand sorcerer presiding over this magical gathering, it falls upon you to set the stage for the epic duel ahead. Choose a theme from the mystical scrolls, each containing its own secrets and challenges. Only you wield the power to shape the destiny of this arcane battle!",
        "5. Now, wizards and witches alike, it is time to cast your spells! Peer into the depths of your enchanted cards and select the incantation that resonates with your inner magic. Choose wisely, for your fate hangs in the balance!",
        "6. With your chosen enchantment in hand, it is time to unleash its power upon the realm! Lead the charge, oh noble sorcerer, and click 'Play' to set the arcane energies into motion. Let your friends follow in your mystical footsteps!",
        "7. Behold, as the cosmic forces converge! Compare the arcane energies woven into each card, and may the highest power reign supreme! Let laughter echo through the halls of MysticDeck as friends become foes and victory dances in the flicker of candlelight!"
    ]
    
    @State private var currentIndex = 0
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 45) {
                    ForEach(points.indices, id: \.self) { index in
                        Text(points[index])
                            .font(.headline)
                            .padding()
                            .frame(width: geometry.size.width - 40) // Adjust width
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .opacity(currentIndex == index ? 1.0 : 0.5)
                    }
                }
                .frame(width: geometry.size.width * CGFloat(points.count), height: 650) // Adjust height
                .padding()
                .offset(x: -CGFloat(currentIndex) * geometry.size.width)
                .animation(.easeInOut(duration: 1.0))
            }
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { timer in
                    withAnimation {
                        currentIndex = (currentIndex + 1) % points.count
                    }
                }
            }
        }
        Spacer()
        .navigationBarTitle("Guide:")
    }
}
struct SettingsView: View {
    @State private var isSoundEnabled = true
    @State private var isNotificationEnabled = true
    @State private var isHintsEnabled = true
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Toggle("Sound", isOn: $isSoundEnabled)
                .font(.title) // Increase text size
                .toggleStyle(SwitchToggleStyle(tint: .secondary))
            
            Spacer()
            Toggle("Notification", isOn: $isNotificationEnabled)
                .font(.title) // Increase text size
                .toggleStyle(SwitchToggleStyle(tint: .secondary))
            Spacer()
            Toggle("Hints", isOn: $isHintsEnabled)
                .font(.title) // Increase text size
                .toggleStyle(SwitchToggleStyle(tint: .secondary))
            Spacer()
            Button(action: {
                // Action for Connect with Social Media
            }) {
                Text("Connect with Social Media to Send Gifts to Friends")
                    .font(.headline) // Increase button text size
                    .foregroundColor(.white)
            }
            .padding(.horizontal, 24.0)
            .padding(.vertical, 14.0)
            .frame(maxWidth: .infinity)
            .background(LinearGradient(gradient: Gradient(colors: [Color(hue: 0.628, saturation: 0.553, brightness: 0.841), Color(red: 75/255, green: 0/255, blue: 130/255)]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(10)
            
            Button(action: {
                // Action for Contact Us
            }) {
                Text("Contact Us")
                    .font(.headline) // Increase button text size
                    .foregroundColor(.white)
            }
            .padding(.horizontal, 24.0)
            .padding(.vertical, 14.0)
            .frame(maxWidth: .infinity)
            .background(LinearGradient(gradient: Gradient(colors: [Color(hue: 0.628, saturation: 0.553, brightness: 0.841), Color(red: 75/255, green: 0/255, blue: 130/255)]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(10)
//            Spacer()
            
            Button(action: {
                // Action for Restore
            }) {
                Text("Restore")
                    .font(.headline) // Increase button text size
                    .foregroundColor(.white)
            }
            .padding(.horizontal, 24.0)
            .padding(.vertical, 14.0)
            .frame(maxWidth: .infinity)
            .background(LinearGradient(gradient: Gradient(colors: [Color(hue: 0.628, saturation: 0.553, brightness: 0.841), Color(red: 75/255, green: 0/255, blue: 130/255)]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(10)
            
//            Spacer()
        }
        .padding()
        .navigationBarTitle("Settings")
    }
}
struct MenuButton: View {
    var body: some View {
        Button(action: {
            // Handle menu action
        }) {
            Image(systemName: "list.dash")
                .imageScale(.large)
                .foregroundColor(Color(hue: 0.728, saturation: 0.953, brightness: 0.741))
                .padding()
        }
    }
}

struct Heading: View {
    var body: some View {
        HStack(spacing: 0) {
            Text("Mystic")
                .font(Font.custom("Hoefler Text", size: 40))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
                .padding(.leading)

            Text("Deck")
                .font(Font.custom("Hoefler Text", size: 27))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
                .offset(x:4, y: 12)
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
}
