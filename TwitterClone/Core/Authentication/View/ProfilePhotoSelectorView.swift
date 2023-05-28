//
//  ProfilePhotoSelectorView.swift
//  TwitterClone
//
//  Created by Tamim Khan on 28/5/23.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack{
            AuthHeaderView(title1: "Setup Account", title2: "Add Profile Photo")
           
            
            Button{
                showImagePicker.toggle()
            }label: {
                if let profileImage = profileImage{
                    profileImage
                        .resizable()
                        .modifier(profileImageModifier())
                        .clipShape(Circle())
                }else{
                    Image(systemName: "square.and.arrow.up")
                        .resizable()
                        .modifier(profileImageModifier())
                }
            }
            .sheet(isPresented: $showImagePicker, onDismiss: loadImage){
                ImagePicker(selectedImage: $selectedImage)
            }
            .padding(.top, 44)
            
            if let selectedImage = selectedImage{
                Button{
                    viewModel.uploadProfileImage(selectedImage)
                }label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
                
            }else{
                Text("Select Photo")
                    .font(.subheadline).bold()
            }
            
            
            Spacer()
        }
        .ignoresSafeArea()
        
    }
    func loadImage(){
        guard let selectedImage = selectedImage else {return}
        profileImage = Image(uiImage: selectedImage)
    }
}




private struct profileImageModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(width: 180, height: 180)
            
    }
}


struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
