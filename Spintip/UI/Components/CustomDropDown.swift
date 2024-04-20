//
//  CustomDropDown.swift
//  Spintip
//
//  Created by Igor Zgonnik on 19.04.2024.
//

import SwiftUI

/// Type of view presenting
enum DropDownPickerState {
    case top
    case bottom
}

/// Custom DropDown menu
struct CustomDropDown: View {
    
    /// Selected item
    @Binding var selection: String?
    /// Name of drop dowm menu
    var name: String
    /// Placeholder text
    var placeholder: String
    var state: DropDownPickerState = .bottom
    /// Items for menu
    var options: [String]
    
    @State var showDropdown = false
    
    @SceneStorage("drop_down_zindex") private var index = 1000.0
    @State var zindex = 1000.0
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            VStack {
                HStack {
                    Text(name).foregroundStyle(.white)
                    Spacer()
                }
                
                VStack(spacing: 0) {
                    if state == .top && showDropdown {
                        OptionsView()
                    }
                    
                    HStack {
                        Text(selection == nil ? placeholder : selection!)
                            .foregroundColor(selection != nil ? .white : ColorConstants.placeholderTextFieldColor)
                        
                        
                        Spacer(minLength: 0)
                        
                        Image(state == .top ? "chevron-up" : "chevron-down")
                            .font(.custom("Poppins", size: 14))
                            .foregroundColor(.gray)
                            .rotationEffect(.degrees((showDropdown ? -180 : 0)))
                    }
                    .padding(.horizontal, 15)
                    .frame(height: 50)
                    .background(ColorConstants.backgroundTextFieldColor)
                    .contentShape(.rect)
                    .onTapGesture {
                        index += 1
                        zindex = index
                        withAnimation(.snappy) {
                            showDropdown.toggle()
                        }
                    }
                    .zIndex(10)
                    
                    if state == .bottom && showDropdown {
                        OptionsView()
                    }
                }
                .clipped()
                .background(ColorConstants.backgroundTextFieldColor)
                
                .cornerRadius(8)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(ColorConstants.borderTextFieldColor)
                }
                .frame(height: size.height, alignment: state == .top ? .bottom : .top)
                Spacer()
            }
        }
        .frame(height: 50)
        
        .padding(.bottom, showDropdown ? CGFloat(50 * (options.count)) : 50)
        .zIndex(zindex)
    }
    
    func OptionsView() -> some View {
        VStack(spacing: 0) {
            ForEach(options, id: \.self) { option in
                HStack {
                    Text(option)
                        .font(.custom("Poppins", size: 14))
                    Spacer()
                    Image(systemName: "checkmark")
                        .opacity(selection == option ? 1 : 0)
                }
                .foregroundStyle(selection == option ? .white : ColorConstants.placeholderTextFieldColor)
                .animation(.none, value: selection)
                .frame(height: 40)
                .contentShape(.rect)
                .padding(.horizontal, 15)
                .onTapGesture {
                    withAnimation(.snappy) {
                        selection = option
                        showDropdown.toggle()
                    }
                }
            }
        }
        .transition(.move(edge: state == .top ? .bottom : .top))
        .zIndex(1)
    }
}
