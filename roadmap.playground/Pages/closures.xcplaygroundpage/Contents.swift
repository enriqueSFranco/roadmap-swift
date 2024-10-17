//: [Previous](@previous)

import Foundation

enum Level {
    case info, error, warning, debug
    
    init?(symbol: String) {
        switch symbol {
            case "INFO": self = .info
            case "ERROR": self = .error
            case "WARNING": self = .warning
            case "DEBUG": self = .debug
            default: return nil
        }
    }
}

func getEmoji(for level: Level = Level.info) -> String {
    let emojis: [Level: String] = [
        .debug: "🐛",
        .info: "ℹ️",
        .warning: "⚠️",
        .error: "❗️"
    ]
    return emojis[level] ?? "ℹ️"
}


func logMessage(_ message: @autoclosure () -> String, _ level: @autoclosure () -> Level = Level.info) {
    
    let levelValue = level()
    let emoji = getEmoji(for: levelValue)
    
    print("[\(String(describing: emoji))\(level())] \(message())")
}

logMessage("User logged in")
logMessage("An error occurred", Level.error)
//: [Next](@next)
