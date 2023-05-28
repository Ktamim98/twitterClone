//
//  RegistationView.swift
//  TwitterClone
//
//  Created by Tamim Khan on 27/5/23.
//

import SwiftUI

struct RegistationView: View {
    @State private var email = ""
    @State private var passWord = ""
    @State private var username = ""
    @State private var fullname = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    
    
    
    var body: some View {
        
        
            VStack{
                
                NavigationLink(destination: ProfilePhotoSelectorView(), isActive: $viewModel.authticateUser, label: {})
                
                
                AuthHeaderView(title1: "Get Started.", title2: "Create Your Account")
                
                
                VStack(spacing: 40){
                   CustominputField(imageName: "envelope", placeholderText: "Email", text: $email)
                    
                   CustominputField(imageName: "lock", placeholderText: "Password", isSecureField: true, text: $passWord)
                    
                    CustominputField(imageName: "person", placeholderText: "Username", text: $username)
                     
                    CustominputField(imageName: "person", placeholderText: "Fullname", text: $fullname)
                }
                .padding(32)
                
                Button{
                    viewModel.registration(withEmail: email, password: passWord, username: username, fullname: fullname)
                }label: {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
                
                
                
                Spacer()
                
                
                
                Button{
                    presentationMode.wrappedValue.dismiss()
                }label: {
                    Text("Already have an account?")
                        .font(.footnote)
                    
                    
                    Text("Sign In")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                .padding(.bottom, 32)
                
                
                
            }
            .ignoresSafeArea()
        }
        
        
    }
    


struct RegistationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistationView()
    }
}
