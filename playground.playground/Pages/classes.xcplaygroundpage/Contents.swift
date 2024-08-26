//: [Previous](@previous)

import Foundation

class StackNode {
    var data: Int32
    var next: StackNode?
    
    init(data: Int32, next: StackNode? = nil) {
        self.data = data
        self.next = next
    }
    
    var descriptipn: String {
        var currNode: StackNode? = self
        var nodes = [String]()
        
        while let node = currNode {
            nodes.append(String(node.data))
            currNode = node.next
        }
        return nodes.joined(separator: "->")
    }
}

class Stack {
    var head: StackNode? = nil
    var size: Int32 = 0
    
    func push(data: Int32) {
        var newNode = StackNode(data: data)
        newNode.next = head
        head = newNode
        size += 1
    }
    
    func pop() -> Int32? {
        guard let headNode = head else { return nil }
        head = headNode.next
        size -= 1
        return headNode.data
    }
    
    func peek() -> Int32? {
        return head?.data
    }
    
    var description: String {
        var currNode: StackNode? = head
        var nodes = [String]()
        
        while let node = currNode {
            nodes.append(String(node.data))
            currNode = currNode?.next
        }
        return nodes.isEmpty ? "Empty Stack" : nodes.joined(separator: "->")
    }
    
}

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


//: [Next](@next)
