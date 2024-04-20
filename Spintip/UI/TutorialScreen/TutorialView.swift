//
//  TutorialView.swift
//  Spintip
//
//  Created by Igor Zgonnik on 19.04.2024.
//

import SwiftUI

/// Implimented Tutorial View with page style
struct TutorialView: View {
    
    /// Selected tutorial view
    @State private var selectedView = 0
    
    /// called when user tap Skip button
    var onSkip: () -> Void
    
    var body: some View {
        ZStack {
            TabView (selection: $selectedView) {
                TutorialSingleView(title: "CONNECT",
                                   description: "Connect with your students and players all over the world",
                                   backgroundImageName: "Connect")
                .tag(0)
                TutorialSingleView(title: "TEACH",
                                   description: "Teach anyone anywhere remotely. The whole world is your office",
                                   backgroundImageName: "Teach")
                .tag(1)
                TutorialSingleView(title: "EARN",
                                   description: "Get paid whenever and wherever you are. Generate income and drive business both in person and remote. ",
                                   backgroundImageName: "Earn")
                .tag(2)
                TutorialSingleView(title: "RELATE",
                                   description: "Grow your relationship with existing and new students. Provide continuous education, fun and joy!",
                                   backgroundImageName: "Relate")
                .tag(3)
            }
            .ignoresSafeArea()
            .tabViewStyle(.page(indexDisplayMode: .never))
            .background(ColorConstants.mainColor)
            .overlay {
                DotsIndexView(numberOfView: 4, selectedView: selectedView)
                    .padding(.top , 500)
            }
            .onChange(of: selectedView) { _, _ in
                withAnimation(.default) {}
            }
            
            SkipButton(onAction: {
                onSkip()
            })
        }
    }
}

/// Single Tutorial View
struct TutorialSingleView: View {
    
    /// Title on the tutorial view
    let title: String
    
    /// Description on the tutorial view
    let description: String
    
    /// Background image name for tutorial view
    let backgroundImageName: String
    
    var body: some View {
        ZStack {
            Image(backgroundImageName)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .ignoresSafeArea()
                .overlay {
                    LinearGradient(
                        gradient: Gradient(
                            colors: [
                                ColorConstants.gradientStartColor,
                                ColorConstants.gradientMiddleColor,
                                ColorConstants.gradientEndColor,
                                ColorConstants.gradientBackgroundColor
                            ]
                        ),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .ignoresSafeArea()
                }
            VStack {
                Text(title)
                    .font(.custom("Poppins", size: 40))
                    .foregroundStyle(ColorConstants.mainColor)
                    .fontWeight(.bold)
                    .lineSpacing(60)
                    .kerning(0.06)
                    .multilineTextAlignment(.center)
                    .padding(.top, 220)
                
                
                
                Text(description)
                    .font(.custom("Poppins", size: 17))
                    .fontWeight(.regular)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color.white)
                    .padding([.leading, .trailing], 50)
            }
        }
    }
}

/// Skip button, top right location
struct SkipButton: View {
    
    /// Called when user tap on the button
    var onAction: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Skip")
                    .font(.custom("Poppins", size: 17))
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color.white)
                    .onTapGesture {
                        onAction()
                    }
            }
            Spacer()
        }.padding()
    }
}

#Preview {
    TutorialView(onSkip: {})
}
