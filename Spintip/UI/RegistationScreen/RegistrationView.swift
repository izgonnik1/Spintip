//
//  RegistrationView.swift
//  Spintip
//
//  Created by Igor Zgonnik on 19.04.2024.
//

import SwiftUI

/// Registration view
struct RegistrationView: View {
    
    @State private var name: String = ""
    @State private var location: String = ""
    @State private var rate: String = ""
    @State private var card: String = ""
    @State private var email: String = ""
    @State private var aboutMe: String = ""
    @State private var certification: String? = nil
    @State private var selectedImage: UIImage? = nil
    @State private var isShowingImagePicker = false
    
    private let certifications = ["No","Basic","Medium","Full","Premium"]
    
    var body: some View {
        ZStack {
            Color(ColorConstants.backgroundColor).ignoresSafeArea()
            ZStack {
                VStack {
                    HStack {
                        HStack {
                            
                            NavigationLink {
                                LoginView()
                            } label: {
                                Image("backButton")
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Text("Registration")
                                .foregroundStyle(.white)
                                .font(.custom("Poppins", size: 20))
                                .fontWeight(.medium)
                                .lineLimit(nil)
                                .lineSpacing(30)
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: .infinity, alignment: .center)
                            Spacer().frame(maxWidth: .infinity, alignment: .trailing)
                        }
                    }
                    
                    Divider()
                        .overlay(Color(ColorConstants.devideColor))
                    
                    
                    ScrollView(showsIndicators: false) {
                        HStack{
                            
                            if let image = selectedImage {
                                Image(uiImage: image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 111, height: 111)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.white, lineWidth: 1))
                                    .shadow(radius: 10)
                                    .onTapGesture {
                                        self.isShowingImagePicker = true
                                    }
                                    .padding()
                            } else {
                                Image("avatarPlaceholder")
                                    .clipShape(Circle()).onTapGesture {
                                        self.isShowingImagePicker = true
                                    }
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(Color(ColorConstants.backgroundColor))
                        .frame(maxWidth: .infinity)
                        
                        CustomTextField(multiLineSupport: false,
                                        hintText: nil,
                                        icon: "nameIcon",
                                        placeHolder: "First name Last name",
                                        name: "Name",
                                        text: $name)
                        
                        CustomTextField(multiLineSupport:
                                            false, hintText:
                                            nil, icon: "locationIcon",
                                        placeHolder: "Location",
                                        name: "Location", text:
                                            $location)
                        
                        CustomTextField(multiLineSupport:
                                            false, hintText:
                                            "Select your rate please",
                                        icon: "rateIcon",
                                        placeHolder: "XX.XX",
                                        name: "Rate per min",
                                        text: $rate)
                        
                        CustomTextField(multiLineSupport: false,
                                        hintText: nil,
                                        icon: "cardIcon",
                                        placeHolder: "XXXX XXXX XXXX XXXX",
                                        name: "Card for payments",
                                        text: $card)
                        
                        CustomTextField(multiLineSupport: false,
                                        hintText: nil,
                                        icon: "emailIcon",
                                        placeHolder: "E-mail",
                                        name: "E-Mail",
                                        text: $email)
                        
                        CustomTextField(multiLineSupport: true,
                                        hintText: nil,
                                        icon: "aboutIcon",
                                        placeHolder: "About me...",
                                        name: "About you",
                                        text: $aboutMe)
                        
                        CustomDropDown(selection: $certification,
                                       name: "Certification",
                                       placeholder: "Choose",
                                       state: .bottom,
                                       options: certifications)
                    }
                    .scrollContentBackground(.hidden)
                    .background(Color(ColorConstants.backgroundColor))
                    .padding(.horizontal, 20)
                }
            }
            .sheet(isPresented: $isShowingImagePicker) {
                ImagePicker(selectedImage: self.$selectedImage)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) var presentationMode
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = context.coordinator
        imagePicker.sourceType = .photoLibrary
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker
        
        init(parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectedImage = info[.originalImage] as? UIImage {
                parent.selectedImage = selectedImage
            }
            
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}

#Preview {
    RegistrationView()
}
