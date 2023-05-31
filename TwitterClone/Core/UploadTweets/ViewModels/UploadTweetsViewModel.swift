//
//  UploadTweetsViewModel.swift
//  TwitterClone
//
//  Created by Tamim Khan on 30/5/23.
//

import Foundation


class UploadTweetsViewModel: ObservableObject{
    
    let service = TweetService()
    @Published var didUploadTweet = false
    
    func uploadTweet(caption: String){
        service.uploadTweet(caption: caption){ success in
            if success{
                self.didUploadTweet = true
            }else{
                
            }
            
        }
    }
    
}
