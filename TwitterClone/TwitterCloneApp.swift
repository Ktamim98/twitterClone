//
//  TwitterCloneApp.swift
//  TwitterClone
//
//  Created by Tamim Khan on 23/5/23.
//

import SwiftUI
import Firebase

@main
struct TwitterCloneApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup{
            NavigationView{
               LoginView()
            }
        }
    }
}
