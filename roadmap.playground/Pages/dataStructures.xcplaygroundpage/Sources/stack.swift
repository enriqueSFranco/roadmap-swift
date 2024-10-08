//
//  stack.swift
//  
//
//  Created by Enrique SFranco on 08/10/24.
//

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
