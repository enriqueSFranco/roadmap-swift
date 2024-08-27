//: [Previous](@previous)

import Foundation

// MARK: CLASES
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

// MARK: STRUCTS
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


struct Size {
    var width = 0.0
    var height = 0.0
}

struct Point {
    var x = 0.0
    var y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

// MARK: HERENCIA Y POLIMORFISMO
class PaymentGateway {
    func processPayment(amount: Double) -> Bool {
        print("Procesando el pago de \(amount) en la pasarela base.")
        return true
    }
}

class CreditCardPaymentGateway: PaymentGateway {
    override func processPayment(amount: Double) -> Bool {
        print("Procesando el pago de \(amount) con tarjeta de crédito.")
        return true
    }
}

class PaypalPaymentGateway: PaymentGateway {
    override func processPayment(amount: Double) -> Bool {
        print("Procesando el pago de \(amount) con Paypal.")
        return true
    }
}

class ApplePayPaymentGateway: PaymentGateway {
    override func processPayment(amount: Double) -> Bool {
        print("Procesando el pago de \(amount) con Apple Pay.")
        return true
    }
}

func processPayment(gateway: PaymentGateway, amount: Double) {
    gateway.processPayment(amount: amount)
}


// MARK: INICIALIZADORES
class Fahrenheit {
    var temperature: Double
    
    init() {
        temperature = 32.0
    }
}

class Celsius {
    var temperatureInCelcius: Double
    
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelcius = (fahrenheit - 32.0) / 1.8
    }
    
    init(fromKelvin kelvin: Double) {
        temperatureInCelcius = kelvin - 273.15
    }
    
    init(_ celcius: Double) {
        temperatureInCelcius = celcius
    }
}

class Color {
    let red, green, blue: Double
    
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    
    init(white: Double) {
        red = white
        green = white
        blue = white
    }
}


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
        return []
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


func main() {
    // HERENCIA Y POLIMORFISMO
    let paymentGateways: [PaymentGateway] = [
        CreditCardPaymentGateway(),
        PaypalPaymentGateway(),
        ApplePayPaymentGateway()
    ]
    let amounts = [5_000.00, 10_000.00, 45_000.00]
    
    for (index, gateway) in paymentGateways.enumerated() {
        let amount = amounts[index]
        processPayment(gateway: gateway, amount: amount)
    }
    
    
    // INICIALIZADORES
    var f = Fahrenheit()
    print("The default temperature is \(f.temperature)° Fahrenheit")
    
    let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
    let freezingPointOfWater = Celsius(fromKelvin: 273.15)
    let bodyTemperature = Celsius(37.0)
    
    let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
    let halfGray = Color(white: 0.5)
    
    let originRect = Rect(origin: Point(x: 2.0, y: 2.0),
        size: Size(width: 5.0, height: 5.0))
    
    let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
        size: Size(width: 3.0, height: 3.0))
}
//: [Next](@next)
