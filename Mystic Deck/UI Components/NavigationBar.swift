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
                    Spacer()
                    TabBarButton(imageName: "rosette", title: "Achievements", tabIndex: 1, selectedTab: $selectedTab)
                    Spacer()
                    TabBarButton(imageName: "book.fill", title: "Guide", tabIndex: 2, selectedTab: $selectedTab)
                    Spacer()
                    TabBarButton(imageName: "gearshape.fill", title: "Settings", tabIndex: 3, selectedTab: $selectedTab)
                }
                .padding()
            }
            .background(
                ZStack {
                    Image("themebk")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                    
//                    LinearGradient(gradient: Gradient(colors: [Color(hue: 0.328, saturation: 0.513, brightness: 0.201), Color.clear]), startPoint: .top, endPoint: .bottom).opacity(0.7)
//                        .edgesIgnoringSafeArea(.all)
                }
            )

            .navigationBarItems(leading: Heading(), trailing: ProfileButton())

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
        
        Button("", systemImage: imageName, action: onClick)    .labelStyle(.iconOnly)
            .foregroundColor(selectedTab == tabIndex ? .blue : .gray)

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

struct AchievementsView: View {
    var body: some View {
        Spacer()
        Text("Achievements Content")
    }
}

struct GuideView: View {
    var body: some View {
        Spacer()
        Text("Guide Content")
    }
}

struct SettingsView: View {
    var body: some View {
        Spacer()
        Text("Settings jhbjhbjuhbjjhContent")
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
}
