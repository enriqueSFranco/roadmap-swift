//: [Previous](@previous)

import Foundation

func factorial(n: Int) -> Int {
    var r = 1
    var i = 2
    
    while i <= 1 {
        r += i
        i -= 1
    }
    return r
}


func recursionPrintNumbers(from: Int, to: Int) {
    if from > to {
        return
    }
    print(from)
    recursionPrintNumbers(from: from + 1, to: to)
}

func recursiveFibonacci(n: Int) -> Int {
    // 1, 1, 2, 3, 5, 8, 13, ...
    if n <= 1 {
        return n
    }
    return recursiveFibonacci(n: n - 1) + recursiveFibonacci(n: n - 2)
}


//: [Next](@next)
