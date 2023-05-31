//
//  Tweet.swift
//  TwitterClone
//
//  Created by Tamim Khan on 30/5/23.
//

import FirebaseFirestoreSwift
import Firebase


struct Tweet: Identifiable, Decodable{
    @DocumentID var id: String?
    let caption: String
    let timestamp: Timestamp
    let uid: String
    var likes: Int
    
    var user: User?
    var didLike: Bool? = false
}
