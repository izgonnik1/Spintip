//
//  SplashScreen.swift
//  Spintip
//
//  Created by Igor Zgonnik on 19.04.2024.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        ZStack {
            Image("BackgroundSplashImage")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            Color.black.opacity(0.6)
                .ignoresSafeArea()
            LogoView()
        }
    }
}

#Preview {
    SplashScreen()
}
