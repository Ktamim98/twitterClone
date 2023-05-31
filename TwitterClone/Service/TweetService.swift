//
//  TweetService.swift
//  TwitterClone
//
//  Created by Tamim Khan on 30/5/23.
//

import Firebase


struct TweetService{
    func uploadTweet(caption: String, completion: @escaping(Bool) -> Void){
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        let data = ["uid": uid, "caption": caption, "likes": 0, "timestamp": Timestamp(date: Date()) ] as [String : Any]
        
        
        Firestore.firestore().collection("tweets").document()
            .setData(data){ error in
                if let error = error{
                    print("debug: faild to upload tweet \(error.localizedDescription)")
                    completion(false)
                    return
                }
                completion(true)
            }
    }
    
    
    func fetchTweets(completion: @escaping([Tweet]) -> Void){
        Firestore.firestore().collection("tweets")
            .order(by: "timestamp", descending: true)
            .getDocuments { snapshot, _ in
            guard let documenst = snapshot?.documents else {return}
            
            let tweets = documenst.compactMap({try? $0.data(as: Tweet.self)})
            completion(tweets)
        }
    }
    
    
    func fetchTweets(forUid uid: String,completion: @escaping([Tweet]) -> Void){
        Firestore.firestore().collection("tweets")
            .whereField("uid", isEqualTo: uid)
            .getDocuments { snapshot, _ in
            guard let documenst = snapshot?.documents else {return}
            
          let tweets = documenst.compactMap({try? $0.data(as: Tweet.self)})
                completion(tweets.sorted(by: {$0.timestamp.dateValue() > $1.timestamp.dateValue()}))
        }
    }
    func likeTweet(_ tweet: Tweet, completion: @escaping() -> Void){
        guard let uid = Auth.auth().currentUser?.uid else {return}
        guard let tweetId = tweet.id else {return}
        
        
        let userRefLike = Firestore.firestore().collection("user").document(uid).collection("user-likes")
        
        Firestore.firestore().collection("tweets").document(tweetId)
            .updateData(["likes": tweet.likes + 1]){ _ in
                userRefLike.document(tweetId).setData([:]){ _ in
                    completion()
                    
                }
                
            }
    }
    
    
    func unlikeTweet(_ tweet: Tweet, completion: @escaping() -> Void){
        guard let uid = Auth.auth().currentUser?.uid else {return}
        guard let tweetId = tweet.id else {return}
        guard tweet.likes > 0 else {return}
        
        
        let userRefLike = Firestore.firestore().collection("user").document(uid).collection("user-likes")
        
        Firestore.firestore().collection("tweets").document(tweetId)
            .updateData(["likes": tweet.likes - 1]){ _ in
                userRefLike.document(tweetId).delete(){ _ in
                    completion()
                    
                    
                }
                
            }
            
    }
    
    
    func checkifUserLike(_ tweet: Tweet, completion: @escaping(Bool) -> Void){
        guard let uid = Auth.auth().currentUser?.uid else {return}
        guard let tweetId = tweet.id else {return}
        
        
        Firestore.firestore().collection("user").document(uid).collection("user-likes")
            .document(tweetId).getDocument { snapshot, _ in
                guard let snapshot = snapshot else {return}
                completion(snapshot.exists)
            }
    }
    
    func fetchLikedTweets(forUid uid: String, completion: @escaping([Tweet]) -> Void){
      var tweets = [Tweet]()
        
        
        Firestore.firestore().collection("user").document(uid).collection("user-likes").getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else {return}
            
            documents.forEach { doc in
                let tweetId = doc.documentID
                
                Firestore.firestore().collection("tweets").document(tweetId).getDocument { snapshot, _ in
                    guard let tweet = try? snapshot?.data(as: Tweet.self) else {return}
                    tweets.append(tweet)
                    completion(tweets)
                }
            }
        }
    }
    
}
