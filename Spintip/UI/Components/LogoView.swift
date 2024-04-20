//
//  LogoView.swift
//  Spintip
//
//  Created by Igor Zgonnik on 19.04.2024.
//

import SwiftUI

/// Contain logo and app name in one view
struct LogoView: View {
    
    var body: some View {
        VStack {
            Image("Logo")
                .scaledToFill()
            
            Text(StringsConstant.appName)
                .font(.custom("Poppins", size: 54))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .lineSpacing(81)
                .kerning(0.16)
                .tracking(10)
            
            Text("COACH")
                .font(.custom("Poppins", size: 24))
                .fontWeight(.regular)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .lineSpacing(36)
                .kerning(0.8)
                .tracking(20)
        }
    }
}

#Preview {
    LogoView()
}
