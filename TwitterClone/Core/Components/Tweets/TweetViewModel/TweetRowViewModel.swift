//
//  TweetRowViewModel.swift
//  TwitterClone
//
//  Created by Tamim Khan on 31/5/23.
//

import Foundation

class TweetRowViewModel: ObservableObject{
    private let service = TweetService()
    
 @Published var tweet: Tweet
    
    init(tweet: Tweet){
        self.tweet = tweet
        checkUserLikeTweet()
    }
    
    func likeTweet(){
        service.likeTweet(tweet) {
            self.tweet.didLike = true
        }
    }
    
    
    func unlikeTweet(){
        service.unlikeTweet(tweet) {
            self.tweet.didLike = false
        }
    }
    
    func checkUserLikeTweet(){
        service.checkifUserLike(tweet){ didlike in
            if didlike {
                self.tweet.didLike = true
            }
        }
    }
}
