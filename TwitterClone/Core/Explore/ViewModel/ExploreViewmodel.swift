//
//  ExploreViewmodel.swift
//  TwitterClone
//
//  Created by Tamim Khan on 29/5/23.
//

import Foundation


class ExploreViewmodel: ObservableObject{
    @Published var users = [User]()
    let service = UserService()
    @Published var searchText = ""
    
    var searchAbleUser: [User]{
        if searchText.isEmpty{
            return users
        }else{
            let lowerCased = searchText.lowercased()
            
            return users.filter({
                $0.username.contains(lowerCased) ||
                $0.fullname.lowercased().contains(lowerCased)
            })
        }
    }
    
    init(){
        fetchUsers()
    }
    
    func fetchUsers(){
        service.fetchUsers { users in
            self.users = users
            
            
        }
    }
}
