//
//  SplashView.swift
//  Mystic Deck
//
//  Created by user1 on 23/03/24.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    let bg = Image("landingwave")
    
    var body: some View {
        
        if isActive {
            ContentView2()
        } else {
            ZStack{
                
                Image("landingwave")
                    .resizable()
                    .scaledToFill()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                
                VStack {
                    Image("Kite")
                        .scaleEffect(size)
                        .opacity(opacity)
                        .onAppear {
                            withAnimation(.easeIn(duration: 2.0)){
                                self.size = 1.0
                                self.opacity = 1.0
                            }
                        }
                    
                    
                    HStack(spacing: 0) {
                        Text("Mystic")
                            .foregroundColor(.purpleColor.opacity(0.8))
                            .font(Font.custom("Hoefler Text", size: 60))
                        
                        Text("Deck")
                            .foregroundColor(.orange.opacity(0.8))
                            .font(Font.custom("Hoefler Text", size: 60))
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 2.0)){
                            self.size = 0.9
                            self.opacity = 1.0
                        }
                    }
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                            withAnimation {
                                self.isActive = true
                            }
                        }
                    }
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
