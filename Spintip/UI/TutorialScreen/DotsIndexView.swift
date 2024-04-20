//
//  DotsIndexView.swift
//  Spintip
//
//  Created by Igor Zgonnik on 19.04.2024.
//

import SwiftUI

/// View displaying available and selected dots (view)
struct DotsIndexView: View {
    
    /// Total number of view
    let numberOfView: Int
    
    /// Selected index view
    let selectedView: Int
    
    private let circleSize: CGFloat = 10
    private let circleSpacing: CGFloat = 10
    
    private let primaryColor = ColorConstants.mainColor
    private let secondaryColor = Color.white.opacity(0.6)
    
    var body: some View {
        HStack(spacing: circleSpacing) {
            ForEach(0..<numberOfView, id: \.self) { index in
                if shouldShowCircle(index: index) {
                    Circle()
                        .fill(selectedView == index ? primaryColor : secondaryColor)
                        .scaleEffect(selectedView == index ? 1 : 0.6)
                        .frame(width: circleSize, height: circleSize)
                }
            }
        }
    }
    
    private func shouldShowCircle(index: Int) -> Bool {
        return ((selectedView - numberOfView)...(selectedView + numberOfView)).contains(index)
    }
}

#Preview {
    DotsIndexView(numberOfView: 4, selectedView: 0)
}
