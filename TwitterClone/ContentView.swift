//
//  ContentView.swift
//  TwitterClone
//
//  Created by Tamim Khan on 23/5/23.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    @State private var showMenu = false
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    


    var body: some View {
        Group{
            
            if viewModel.userSession == nil{
                LoginView()
            }else{
               
                    mainInterFaceView
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension ContentView{
    
    var mainInterFaceView: some View{
            ZStack(alignment: .topLeading){
                MainTabView()
                    .navigationBarHidden(showMenu)
                
                
                if showMenu{
                    ZStack{
                        Color(.black)
                            .opacity(showMenu ? 0.25: 0.0)
                        
                    }.onTapGesture {
                        withAnimation(.easeInOut){
                            showMenu = false
                        }
                    }
                    .ignoresSafeArea()
                }
                
                SideMenuView()
                    .frame(width: 300)
                    .offset(x: showMenu ? 0 : -300, y: 0)
                    .background(showMenu ? Color.white : Color.clear)
            }
        
        .navigationTitle("Home" )
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading){
                if let user = viewModel.currentUser{
                    Button{
                        withAnimation(.easeInOut){
                            showMenu.toggle()
                        }
                    }label: {
                        KFImage(URL(string: user.profileImageUrl))
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 32, height: 32)
                    }
                }
            }
        }
        .onAppear{
            showMenu = false
        }
    }
}
