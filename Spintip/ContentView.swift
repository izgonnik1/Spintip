//
//  ContentView.swift
//  Spintip
//
//  Created by Igor Zgonnik on 19.04.2024.
//

import SwiftUI

/// Main content view
struct ContentView: View {
    
    /// indicate that splash screen was presented
    @State var showSplash: Bool = false
    /// indicate that tutorial was skipped by user
    @State var skipTutorial: Bool = false
    
    var body: some View {
        ZStack {
            if self.showSplash {
                TutorialView(onSkip: {
                    skipTutorial = true
                })
                
                if skipTutorial {
                    LoginView()
                }
            } else {
                SplashScreen()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                withAnimation {
                    self.showSplash = true
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
