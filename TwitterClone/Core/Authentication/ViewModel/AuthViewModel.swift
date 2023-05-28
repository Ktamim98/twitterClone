//
//  AuthViewModel.swift
//  TwitterClone
//
//  Created by Tamim Khan on 28/5/23.
//

import Foundation
import Firebase
import UIKit


class AuthViewModel: ObservableObject{
    @Published var userSession: FirebaseAuth.User?
    @Published var authticateUser = false
    @Published var tempUserSession: FirebaseAuth.User?
    
    init(){
        self.userSession = Auth.auth().currentUser
        
        print("Debug: user session in \(String(describing: self.userSession?.uid))")
    }
    
    func logIn(withEmail email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password){ result, error in
            if let error = error{
                print("Debug: failed to login with \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else {return}
            self.userSession = user
            
            print("Debug: did log user in...")
        }
    }
    
    func registration(withEmail email: String, password: String, username: String, fullname: String){
        Auth.auth().createUser(withEmail: email, password: password){ result, error in
            if let error = error{
                print("Debug: failed to register with \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else {return}
            self.tempUserSession = user
            
           
            
            let data = ["email": email, "username": username.lowercased(), "fullname": fullname, "uid": user.uid]
            
            
            Firestore.firestore().collection("user")
                .document(user.uid)
                .setData(data){_ in
                    self.authticateUser = true
                    
                }
            
        }
    }
    
    func signOut(){
        userSession = nil
       try? Auth.auth().signOut()
    }
    
    func uploadProfileImage(_ image: UIImage){
        guard let uid = tempUserSession?.uid else {return}
        
        ImageUploader.uploadImage(image: image){ profileImageUrl in
            Firestore.firestore().collection("user")
            
                .document(uid)
                .updateData(["profileImageUrl": profileImageUrl]){ _ in
                    self.userSession = self.tempUserSession
                    
                }
            
        }
    }
    
}
