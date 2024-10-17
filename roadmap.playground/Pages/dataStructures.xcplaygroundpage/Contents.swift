//: [Previous](@previous)

import Foundation

// MARK: STACK
func maxDepth(_ s: String) -> Int {
    var stack = [Character]()
    var ans = 0
    
    for char in s {
        switch char {
        case "(":
            stack.append(char)
            ans = max(ans, stack.count)
        case ")":
            guard !stack.isEmpty else {
                return -1
            }
            stack.removeLast()
        default:
            continue
        }
    }
    
    return !stack.isEmpty ? ans : -1
}

//: [Next](@next)
