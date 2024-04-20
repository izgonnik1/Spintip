//
//  LoginView.swift
//  Spintip
//
//  Created by Igor Zgonnik on 19.04.2024.
//

import SwiftUI
import AuthenticationServices

/// Login screen
struct LoginView: View {
    
    var body: some View {
        NavigationSplitView {
            ZStack {
                Image("LoginBackgroundView")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                Color.black.opacity(0.1)
                
                ZStack {
                    VStack {
                        LogoView().padding(.top, 20)
                        
                        NavigationLink {
                            RegistrationView()
                        } label: {
                            Text("Register")
                                .frame(width: 255, height: 44)
                                .foregroundColor(.black)
                                .font(.custom("Poppins", size: 16))
                                .background(
                                    RoundedRectangle(
                                        cornerRadius: 25,
                                        style: .continuous
                                    )
                                    .fill(ColorConstants.mainColor)
                                )
                        }
                        .padding(EdgeInsets(top: 25, leading: 0, bottom: 16, trailing: 0))
                        
                        NavigationLink {
                            
                        } label: {
                            Text("Log In")
                                .frame(width: 255, height: 44)
                                .foregroundColor(.white)
                                .font(.custom("Poppins", size: 16))
                                .background(
                                    ZStack {
                                        RoundedRectangle(
                                            cornerRadius: 25,
                                            style: .continuous
                                        )
                                        .fill(.clear)
                                        RoundedRectangle(
                                            cornerRadius: 25,
                                            style: .continuous
                                        )
                                        .stroke(.white, lineWidth: 1)
                                    }
                                )
                        }
                        
                        SignInWithAppleButton { request in
                            request.requestedScopes = [.fullName, .email]
                        } onCompletion: { result in
                            switch result {
                            case .success( _):
                                print("Authorization successful")
                                //                                APIService.sharedInstance.fetchUserData(id: "123") { model in
                                //
                                //                                } failure: { error in
                                //                                    print("\(error.localizedDescription)")
                                //                                }
                                
                            case .failure(let error):
                                print("Authorization failure: \(error.localizedDescription)")
                            }
                        }
                        .frame(width: 255, height: 44)
                        .signInWithAppleButtonStyle(.black)
                        .padding()
                    }
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: 550,
                        alignment: .center
                    )
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.white, lineWidth: 1)
                    )
                    .background(.ultraThinMaterial)
                }
                .padding(.horizontal, 20)
            }
            .ignoresSafeArea()
            
        } detail: {
            Text(" ")
        }
        .labelsHidden()
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    LoginView()
}
