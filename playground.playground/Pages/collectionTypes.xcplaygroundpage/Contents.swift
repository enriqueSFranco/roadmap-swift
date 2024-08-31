//: [Previous](@previous)

var someInts: [Int] = []
print("someInts is of type [Int] with \(someInts.count) items.")

var daysOfWeek: [String] = ["domingo", "lunes", "martes", "miercoles", "jueves", "viernes", "sabado"]

// Accediendo a atraves del indice
let firstDayOfWeek = daysOfWeek[0]
let sunday = daysOfWeek.first

let lastDay = daysOfWeek.last
let friday = daysOfWeek[5]

// Agragando un nuevo dia a la lista
daysOfWeek.append("Christmas")

for day in daysOfWeek {
    print("El dia de hoy es \(day)")
}


var count = 10
while count >= 0 {
    print("Counter: \(count)")
    count -= 1
}

// do while
repeat {
    print("Counter: \(count)")
} while count < 0


func countVowels (_ text: String) -> Int {
    var count = 0
    let vowels: [Character] = ["a", "e", "i", "o", "u"]
    let normalizedStr = text.lowercased()
    
    for char in text {
        if vowels.contains(char) {
            count += 1
        }
    }
    return count
}

// TUPLAS
let user = ("kike", 22, true, "kike@gmail.com")

// DICCIONARIO
struct UserInfo {
    var name: String
    var age: Int
    var genre: Character
    var address: String
}
var userInfo = UserInfo(name: "kike", age: 22, genre: "M", address: "Calle One")

//: [Next](@next)
