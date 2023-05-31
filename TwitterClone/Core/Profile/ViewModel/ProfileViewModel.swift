//
//  ProfileViewModel.swift
//  TwitterClone
//
//  Created by Tamim Khan on 31/5/23.
//

import Foundation


class profileViewModel: ObservableObject{
    @Published var tweets = [Tweet]()
    @Published var likedTweets = [Tweet]()
    
    private let service = TweetService()
    private let userService = UserService()
    let user: User
    
    init(user: User){
        self.user = user
        self.fetchUserTweets()
        self.fetchlikedTweets()
    }
    
    var actionButtonTitle: String{
        return user.isCurrentuser ? "Edit Profile" : "Follow"
        
       
    }
    
    func tweets(forFilter filter: TweetFilterViewModel) -> [Tweet]{
        switch filter {
        case .tweets:
            return tweets
        case .replies:
            return tweets
        case .likes:
            return likedTweets
        }
    }
    
    func fetchUserTweets(){
        guard let uid = user.id else {return}
        
        service.fetchTweets(forUid: uid) { tweets in
            self.tweets = tweets
            
            for i in 0 ..< tweets.count{
                self.tweets[i].user = self.user
            }
        }
    }
    
    func fetchlikedTweets(){
        guard let uid = user.id else {return}
        
        service.fetchLikedTweets(forUid: uid) { tweets in
            self.likedTweets = tweets
            
            
            for i in 0 ..< tweets.count{
                let uid = tweets[i].uid
                
                
                self.userService.fetchUser(withUid: uid){ user in
                    self.likedTweets[i].user = user
                    
                }
            }
            
        }
    }
    
}
