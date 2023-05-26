//
//  SideMenuViewModel.swift
//  TwitterClone
//
//  Created by Tamim Khan on 26/5/23.
//

import Foundation


enum SideMenuViewModel: Int, CaseIterable{
    case profile
    case lists
    case bookarks
    case logout
    
    var title: String{
        switch self{
        case .profile:
            return "Profile"
        case .lists:
            return "Lists"
        case .bookarks:
            return "Bookmarks"
        case .logout:
            return "Logout"
        }
        
    }
    
    var imageName: String{
        switch self{
        case .profile:
            return "person"
        case .lists:
            return "list.bullet"
        case .bookarks:
            return "bookmark"
        case .logout:
            return "arrow.left.square"
        }
    }
    
}
