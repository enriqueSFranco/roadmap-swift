import Foundation

// STRUCTS
struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

// Instanciando un objeto de la clase VideoMode
let someVideoMade = VideoMode()
let someResolution = Resolution(width: 680, height: 480)


// EJERCICIOS
class Twitter {
    
    // clase privada
    private class Tweet {
        private var tweetId: Int
        private var timestamp: Int
        
        init(tweetId: Int, timestamp: Int) {
            self.tweetId = tweetId
            self.timestamp = timestamp
        }
    }
    
    // propiedades de clase
    private var tweets: [Int: [Tweet]]
    private var followers: [Int: Set<Int>]
    private var timestamp: Int
    
    init () {
        self.tweets = [Int: [Tweet]]()
        self.followers = [Int: Set<Int>]()
        self.timestamp = 0
    }
    
    func postTweet(_ userId: Int, _ tweetId: Int) {
        if tweets[userId] == nil {
            self.tweets[userId] = [Tweet]()
        }
        self.tweets[userId]?.append(Tweet(tweetId: tweetId, timestamp: self.timestamp))
        self.timestamp += 1
    }
    
    func getNewsFeed(_ userId: Int) -> [Int] {
        
    }
    
    func follow(_ followerId: Int, _ followeeId: Int) {
        if self.followers[followerId] == nil {
            self.followers[followerId] = Set<Int>()
        }
        
        if followeeId != followeeId {
            self.followers[followeeId]?.insert(followeeId)
        }
    }
    
    func unfollow(_ followerId: Int, _ followeeId: Int) {
        followers[followerId]?.remove(followeeId)
    }
}
