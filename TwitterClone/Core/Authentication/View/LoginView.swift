//
//  LoginView.swift
//  TwitterClone
//
//  Created by Tamim Khan on 27/5/23.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var passWord = ""
    
    var body: some View {
       
        VStack{
            
            AuthHeaderView(title1: "Hello", title2: "Welcome back")
            
            
            VStack(spacing: 40){
               CustominputField(imageName: "envelope", placeholderText: "Email", text: $email)
                
               CustominputField(imageName: "lock", placeholderText: "Password", text: $passWord)
            }
            .padding(.horizontal, 32)
            .padding(.top, 44)
            
            HStack{
                Spacer()
                
                NavigationLink{
                    Text("Rest password view")
                }label: {
                    Text("Forgot Password?")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.systemBlue))
                        .padding(.top)
                        .padding(.trailing, 24)

                }
                
            }
            
            Button{
                print("sign in here")
            }label: {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            
            Spacer()
            
            NavigationLink{
                RegistationView()
//                navigationBarHidden(true)
            }label: {
                Text("Don't have any account?")
                    .font(.footnote)
                
                
                Text("Sign UP")
                    .font(.footnote)
                    .fontWeight(.semibold)
            }
            
            .padding(.bottom, 32)
            .foregroundColor(Color(.systemBlue))
            
            
            
           
            
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
        
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
