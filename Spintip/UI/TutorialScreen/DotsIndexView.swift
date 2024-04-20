//
//  DotsIndexView.swift
//  Spintip
//
//  Created by Igor Zgonnik on 19.04.2024.
//

import SwiftUI

struct DotsIndexView: View {
    
    let numberOfView: Int
    let selectedView: Int
    
    
    private let circleSize: CGFloat = 16
    private let circleSpacing: CGFloat = 10
    
    private let primaryColor = Color.black
    private let secondaryColor = Color.white.opacity(0.6)
    
    private let smallScale: CGFloat = 0.6
    
    var body: some View {
        HStack(spacing: circleSpacing) {
            ForEach(0..<numberOfView) { index in
                if shouldShowCircle(index: index) {
                    Circle()
                        .fill(selectedView == index ? primaryColor : secondaryColor)
                        .scaleEffect(selectedView == index ? 1 : smallScale)
                        .frame(width: circleSize, height: circleSize)
                }
            }
        }
    }
    
    func shouldShowCircle(index: Int) -> Bool {
        return ((selectedView - 4)...(selectedView + 4)).contains(index)
    }
}

#Preview {
    DotsIndexView(numberOfView: 4, selectedView: 0)
}
