//
//  User.swift
//  TwitterClone
//
//  Created by Tamim Khan on 29/5/23.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable{
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profileImageUrl: String
    let email: String
}
