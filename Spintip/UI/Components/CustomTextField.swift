//
//  CustomTextField.swift
//  Spintip
//
//  Created by Igor Zgonnik on 19.04.2024.
//

import SwiftUI

/// Custom text Field for registation screen
struct CustomTextField: View {
    
    /// indicate that textField available multiLine
    let multiLineSupport: Bool
    /// Hint text for text field
    let hintText: String?
    /// icon image name
    let icon: String
    /// Text for textField placeholder
    let placeHolder: String
    /// Name of textField
    let name: String
    
    /// Text in the textfield
    @Binding var text: String
    
    /// indicated show hist string present ot not
    @State private var showHint = false
    
    var body: some View {
        VStack {
            TextFieldNameAndHint(hintText: hintText, name: name, showHint: $showHint) {
                showHint.toggle()
            }
            
            ZStack {
                HStack {
                    if multiLineSupport {
                        VStack {
                            Image(icon)
                            Spacer()
                        }
                    } else {
                        Image(icon)
                    }
                    
                    
                    if multiLineSupport {
                        
                        ZStack(alignment: .leading) {
                            if text.isEmpty {
                                VStack {
                                    Text(placeHolder).foregroundStyle(ColorConstants.placeholderTextFieldColor)
                                        .padding(.top, 3)
                                        .padding(.leading, 6)
                                    
                                    Spacer()
                                }
                            }
                            
                            VStack {
                                TextEditor(text: $text)
                                    .frame(minHeight: 150, maxHeight: 300)
                                    .foregroundColor(.white)
                                    .font(.custom("Poppins", size: 14))
                                    .opacity(text.isEmpty ? 0.85 : 1)
                                
                                Spacer()
                            }
                        }
                    } else {
                        
                        TextField("", text: $text, prompt: Text(placeHolder).foregroundStyle(ColorConstants.placeholderTextFieldColor))
                            .foregroundColor(.white)
                            .font(.custom("Poppins", size: 14))
                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                        
                            .onTapGesture {
                                if showHint {
                                    showHint.toggle()
                                }
                            }
                    }
                    
                    Spacer()
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(ColorConstants.backgroundTextFieldColor)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(ColorConstants.borderTextFieldColor, lineWidth: 1)
            )
        }
        .padding(.bottom, 10)
    }
}

/// Skip button, top right location
struct TextFieldNameAndHint: View {
    
    /// /// Hint text for text field
    var hintText: String?
    /// Name of textField
    var name: String
    @Binding var showHint: Bool
    
    /// Called when user tap on the button
    var onAction: () -> Void
    
    var body: some View {
        HStack {
            Text(name).foregroundStyle(.white)
            if let hintText = hintText {
                Image("helpIcon").onTapGesture {
                    showHint.toggle()
                }
                if showHint {
                    Text(hintText).foregroundStyle(.white).animation(.default)
                        .font(.custom("Poppins", size: 13))
                }
            }
            Spacer()
        }
    }
}
