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
                .background(Color.purpleColor)
                
            }
            
            .background(
                ZStack {
                    Image("themenew1")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
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

struct AchievementsView: View {
    var body: some View {
        
        VStack (spacing: 30){
            VStack{
                
                HStack {
                    
                    
                    Image("back")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 40) // Adjusted frame size to reduce image size
                        .foregroundColor(.white)
                        .padding(.horizontal, 3)
                        .padding(.vertical, -25)
                        .onTapGesture {
                            // Handle tapping the export icon
                        }
                    Spacer(minLength: 73)
                    Text("Achievements")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .lineLimit(0)
                        .padding(.vertical, -5)
                        .padding(.trailing, 10) // Added padding to create space between text and images
                    
                    Spacer() // Added spacer to push images to the right
                    
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
            }            .padding(.top, -80.5)
            
            
            //                        themeButtons
            //
            //                        ScrollView {
            //                            if selectedTheme != "" {
            //                                generateImages(for: selectedTheme)
            //                            }
            //                        }
            
        }
        
        
        
        NavigationView {
            
            
            VStack {
                
                Spacer()
                
                List {
                    
                    AchievementRow(title: "Beginner", description: "")
                    
                    AchievementRow(title: "Collector", description: "Collect 10 different badges")
                    
                    AchievementRow(title: "Master", description: "Unlock all the badges")
                    // Add more achievement rows as needed
                }
                .scrollContentBackground(.hidden) // Hide the standard background of the List
                
            }
            .background(
                Image("themenew1")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
            )
            
            
        }
    }
    
    struct AchievementRow: View {
        var title: String
        var description: String
        
        var body: some View {
            
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .padding()
                    .background(Color.white.opacity(0.8)) // Background color for title
                    .cornerRadius(10) // Rounded corners for the title background
                Image("win")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100,height: 100)
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding()
                    .background(Color.white.opacity(0.8)) // Background color for description
                    .cornerRadius(10) // Rounded corners for the description background
            }
            
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
        VStack (spacing: 30){
            VStack{
                
                HStack {
                    
                    
                    Image("back")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 40) // Adjusted frame size to reduce image size
                        .foregroundColor(.white)
                        .padding(.horizontal, 3)
                        .padding(.vertical, -25)
                        .onTapGesture {
                            // Handle tapping the export icon
                        }
                    Spacer(minLength: 115)
                    Text("Guide")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .lineLimit(0)
                        .padding(.vertical, -5)
                        .padding(.trailing, 10) // Added padding to create space between text and images
                    
                    Spacer() // Added spacer to push images to the right
                    
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
            }            .padding(.top, -80.5)
            
            
            //                        themeButtons
            //
            //                        ScrollView {
            //                            if selectedTheme != "" {
            //                                generateImages(for: selectedTheme)
            //                            }
            //                        }
            
        }
        
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
                .offset(x: -CGFloat(currentIndex) * geometry.size.width - 17)
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
    }
}

struct SettingsView: View {
    @State private var isSoundEnabled = true
    @State private var isNotificationEnabled = true
    @State private var isHintsEnabled = true
    
    var body: some View {
        VStack (spacing: 30){
            VStack{
                
                HStack {
                    
                    
                    Image("back")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 40) // Adjusted frame size to reduce image size
                        .foregroundColor(.white)
                        .padding(.horizontal, 3)
                        .padding(.vertical, -25)
                        .onTapGesture {
                            // Handle tapping the export icon
                        }
                    Spacer(minLength: 108)
                    Text("Setting")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .lineLimit(0)
                        .padding(.vertical, -5)
                        .padding(.trailing, 10) // Added padding to create space between text and images
                    
                    Spacer() // Added spacer to push images to the right
                    
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
            }
            .padding(.top, -80.5)
            
            
            //                        themeButtons
            //
            //                        ScrollView {
            //                            if selectedTheme != "" {
            //                                generateImages(for: selectedTheme)
            //                            }
            //                        }
            
        }
        
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





struct HomeView: View {
    
    var body: some View {
        
        
        //Home Page
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
            VStack {
                
                
                VStack{
                    
                    HStack {
                        
                        
                        Image("back")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 40) // Adjusted frame size to reduce image size
                            .foregroundColor(.white)
                            .padding(.horizontal, 3)
                            .padding(.vertical, -25)
                            .onTapGesture {
                                // Handle tapping the export icon
                            }
                        Spacer(minLength: 108)
                        Text("Home")
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                            .lineLimit(0)
                            .padding(.vertical, -5)
                            .padding(.trailing, 10) // Added padding to create space between text and images
                        
                        Spacer() // Added spacer to push images to the right
                        
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
                }
                .padding(.top, -250.5)
                
                
                //                        themeButtons
                //
                //                        ScrollView {
                //                            if selectedTheme != "" {
                //                                generateImages(for: selectedTheme)
                //                            }
                //                        }
                
            }
            Text("Welcome User !!")
                .font(.title)
                .bold()
                .foregroundColor(.purple)
                .padding(.top, -190)
            
            Image("Kite")
                .resizable()
                .aspectRatio(contentMode: .fit)
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
//    }



struct Heading: View {
    @State private var selectedTheme: String = Theme.history.rawValue
    @State private var isNavigationActive = false
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                ZStack {
                    Color.clear
                        .background(
                            Image("themenew1")
                                .resizable()
                                .scaledToFill()
                                .edgesIgnoringSafeArea(.all)
                                .frame(width: geo.size.width, height: geo.size.height)
                        )
                    
                    
                    VStack (spacing: 1){
                        VStack{
                            HStack {
                                
                                Image("back")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50, height: 40) // Adjusted frame size to reduce image size
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 3)
                                    .padding(.vertical, -25)
                                    .onTapGesture {
                                        // Handle tapping the export icon
                                    }
                                Spacer(minLength: 108)
                                Text("HOME")
                                    .font(.system(size: 20, weight: .bold, design: .rounded))
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white)
                                    .multilineTextAlignment(.center)
                                    .lineLimit(0)
                                    .padding(.vertical, -5)
                                    .padding(.trailing, 10) // Added padding to create space between text and images
                                
                                Spacer() // Added spacer to push images to the right
                                
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
                        }
                        
                        //                        themeButtons
                        //
                        //                        ScrollView {
                        //                            if selectedTheme != "" {
                        //                                generateImages(for: selectedTheme)
                        //                            }
                        //                        }
                        .padding(.bottom, 700.5)
                    }
                }
                .onAppear {
                    // Set navigation bar color
                    UINavigationBar.appearance().barTintColor = UIColor(named: "7A1FA0")
                }
                
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
        }
        .navigationBarBackButtonHidden(true)
    }
    
    
    
    //    private var themeButtons: some View {
    //        HStack(spacing: 8) {
    //            ForEach(Theme.allCases) { theme in
    //                Button(action: {
    //                    selectedTheme = theme.rawValue
    //                }) {
    //                    Text(theme.rawValue)
    //                        .padding(.horizontal, 9)
    //                        .padding(.vertical, 10)
    //                        .background(
    //                            selectedTheme == theme.rawValue ?
    //                                Color(hex: "7A1FA0") :
    //                                Color(hex: "5D0083").opacity(0.4)
    //                        )
    //                        .foregroundColor(selectedTheme == theme.rawValue ? .white : Color(hex: "7A1FA0"))
    //                        .cornerRadius(20)
    //                }
    //                .padding(.bottom, 8)
    //            }
    //        }
    //    }
    
    
    
    
    @ViewBuilder
    var destinationView: some View {
        if isNavigationActive {
            LoadingGameRoomView(theme: AppData.shared.themeselected, imageName: AppData.shared.topicselected)
        } else {
            EmptyView()
        }
    }
    
    private func generateImages(for theme: String) -> some View {
        var imageNames: [String] = []
        
        switch theme {
        case "History":
            imageNames = ["H1.2", "H2.2", "H3.2", "H4.2"]
        case "Geography":
            imageNames = ["states and cities", "G2.2", "G3.2", "G4.2"]
        case "Science":
            imageNames = ["S1.2", "S2.2", "S3.2", "S4.2"]
        case "Ecosystem":
            imageNames = ["E1", "E2", "E3", "E4"]
        default:
            print("default theme")
        }
        
        return VStack(spacing: 20) {
            ForEach(imageNames, id: \.self) { imageName in
                
                NavigationLink(
                    destination: destinationView,
                    isActive: $isNavigationActive,
                    label: {
                        EmptyView()
                    }
                )
                
                
                Button(
                    action: {
                        // Handle both navigation and button actions here
                        AppData.shared.themeselected = selectedTheme
                        AppData.shared.topicselected = imageName
                        DataSocketManager.shared.theme_selection() // Trigger navigation
                        isNavigationActive = DataSocketManager.shared.shouldNavigateToLoadingGameRoom
                        print(isNavigationActive)
                        print(AppData.shared.themeselected)
                    },
                    label: {
                        Image(imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 370, height: 150)
                    })
                Spacer()
            }
            
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
