//
//  FeedViewModel.swift
//  TwitterClone
//
//  Created by Tamim Khan on 30/5/23.
//

import Foundation


class FeedViewModel: ObservableObject{
    @Published var tweets = [Tweet]()
    let service = TweetService()
    let userService = UserService()
    
    init(){
        fetchTweet()
    }
    
    
    func fetchTweet(){
        service.fetchTweets{ tweets in
            self.tweets = tweets
            
                
                for i in 0 ..< tweets.count{
                    let uid = tweets[i].uid
                    
                    
                    self.userService.fetchUser(withUid: uid){ user in
                        self.tweets[i].user = user
                        
                    }
                }
                
                
                
                
            }
            
        }
    }

