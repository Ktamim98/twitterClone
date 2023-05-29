//
//  UserService.swift
//  TwitterClone
//
//  Created by Tamim Khan on 29/5/23.
//

import Firebase
import FirebaseFirestoreSwift

struct UserService{
    func fetchUser(withUid uid: String, completion: @escaping(User) -> Void){
        Firestore.firestore().collection("user")
            .document(uid)
            .getDocument{ snapshot, _ in
                guard let snapshot = snapshot else {return}
                
                guard let user = try? snapshot.data(as: User.self) else {return}
                completion(user)
                
            }
    }
    
    func fetchUsers(completion: @escaping([User]) -> Void){
        Firestore.firestore().collection("user")
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else {return}
                
                let users = documents.compactMap({ try? $0.data(as: User.self )})
                completion(users)
            }
    }
}
