import SwiftUI

enum Theme: String, Identifiable, CaseIterable {
    case history = "History"
    case geography = "Geography"
    case science = "Science"
    case ecosystem = "Ecosystem"
    
    var id: String { self.rawValue }
}

struct ThemeView: View {
    @State private var selectedTheme: String = Theme.history.rawValue
    @State private var isNavigationActive = false
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                ZStack {
                    Color.clear
                        .background(
                            Image("themenew")
                                .resizable()
                                .scaledToFill()
                                .edgesIgnoringSafeArea(.all)
                                .frame(width: geo.size.width, height: geo.size.height)
                        )
                    
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
                                Spacer(minLength: 65)
                                Text("Explore Themes")
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
                        
                        themeButtons
                        
                        ScrollView {
                            if selectedTheme != "" {
                                generateImages(for: selectedTheme)
                            }
                        }
                        .padding(.bottom, -34.5)
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
    

    
    private var themeButtons: some View {
        HStack(spacing: 8) {
            ForEach(Theme.allCases) { theme in
                Button(action: {
                    selectedTheme = theme.rawValue
                }) {
                    Text(theme.rawValue)
                        .padding(.horizontal, 9)
                        .padding(.vertical, 10)
                        .background(
                            selectedTheme == theme.rawValue ?
                                Color(hex: "7A1FA0") :
                                Color(hex: "5D0083").opacity(0.4)
                        )
                        .foregroundColor(selectedTheme == theme.rawValue ? .white : Color(hex: "7A1FA0"))
                        .cornerRadius(20)
                }
                .padding(.bottom, 8)
            }
        }
    }
    
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
            imageNames = ["G1.2", "G2.2", "G3.2", "G4.2"]
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

struct ThemeView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeView()
    }
}
