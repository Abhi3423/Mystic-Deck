import SwiftUI

enum Theme: String, Identifiable, CaseIterable {
    case history = "History"
    case geography = "Geography"
    case science = "Science"
    case ecosystem = "Ecosystem"
    
    var id: String { self.rawValue }
}

struct ThemeView: View {
    @State private var selectedTheme: Theme? = .history
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                ZStack {
                    Color.clear
                        .background(
                            Image("themebk")
                                .scaledToFill()
                                .edgesIgnoringSafeArea(.all)
                                .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                        )
                    
                    VStack(spacing: 30) {
                        Text("Explore Themes")
                            .font(.system(size: 26, weight: .bold, design: .rounded))
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color(hue: 0.728, saturation: 0.953, brightness: 0.741))
                            .multilineTextAlignment(.center)
                            .lineLimit(0)
                            .padding(.top, 0)
                        
                        themeButtons
                        
                        ScrollView {
                            if let theme = selectedTheme {
                                generateImages(for: theme)
                            }
                        }
                        .padding(.bottom, -34.5)
                    }
                }
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
        }
    }
    
    private var themeButtons: some View {
        HStack(spacing: 6) {
            ForEach(Theme.allCases) { theme in
                Button(action: {
                    selectedTheme = theme
                }) {
                    Text(theme.rawValue)
                        .padding(.horizontal, 9)
                        .padding(.vertical, 7)
                        .background(
                            selectedTheme == theme ?
                            LinearGradient(gradient: Gradient(colors: [Color(hue: 0.628, saturation: 0.553, brightness: 0.841), Color(red: 75/255, green: 0/255, blue: 130/255)]), startPoint: .leading, endPoint: .trailing) :
                                LinearGradient(gradient: Gradient(colors: [Color(red: 75/255, green: 0/255, blue: 130/255).opacity(0.3), Color(red: 75/255, green: 0/255, blue: 130/255).opacity(0.2)]), startPoint: .leading, endPoint: .trailing)
                        )
                        .foregroundColor(selectedTheme == theme ? .white : Color(hue: 0.728, saturation: 0.953, brightness: 0.741))
                        .cornerRadius(20)
                }
                .padding(.bottom, 8)
            }
        }
    }
    
    private func generateImages(for theme: Theme) -> some View {
        let imageNames: [String]
        switch theme {
        case .history:
            imageNames = ["H1", "H2", "H3", "H4"]
        case .geography:
            imageNames = ["G1", "G2", "G3", "G4"]
        case .science:
            imageNames = ["S1", "S2", "S3", "S4"]
        case .ecosystem:
            imageNames = ["E1", "E2", "E3", "E4"]
        }
        
        return VStack(spacing: 20) {
            ForEach(imageNames, id: \.self) { imageName in
                NavigationLink(
                    destination: GameRoomView(theme: theme, topic: imageName),
                    label: {
                        Image(imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 350, height: 240)
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
