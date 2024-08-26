//: [Previous](@previous)

/*
 * EJERCICIO:
 * Muestra ejemplos de todas las operaciones que puedes realizar con cadenas de caracteres
 * en tu lenguaje. Algunas de esas operaciones podrían ser (busca todas las que puedas):
 * - Acceso a caracteres específicos, subcadenas, longitud, concatenación, repetición,
 *   recorrido, conversión a mayúsculas y minúsculas, reemplazo, división, unión,
 *   interpolación, verificación...
 *
 * DIFICULTAD EXTRA (opcional):
 * Crea un programa que analice dos palabras diferentes y realice comprobaciones
 * para descubrir si son:
 * - Palíndromos
 * - Anagramas
 * - Isogramas
 */

// MARK: Strings
let someString = "Some string literal value"

let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""

let softWrappedQuotation = """
The White Rabbit put on his spectacles.  "Where shall I begin, \
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
"""

// Se puede usar indentación
let lineBreaks = """

    This string starts with a line break.
            It also ends with a line break.

"""

let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
let dollarSign = "\u{24}"        // $,  Unicode scalar U+0024
let blackHeart = "\u{2665}"      // ♥,  Unicode scalar U+2665
let sparklingHeart = "\u{1F496}" // 💖, Unicode scalar U+1F496
let eAcute: Character = "\u{E9}"                         // é
let combinedEAcute: Character = "\u{65}\u{301}"          // e followed by
let precomposed: Character = "\u{D55C}"                  // 한
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"   // ᄒ, ᅡ, ᆫ
var emptyString = ""               // empty string literal
var anotherEmptyString = String()  // initializer syntax

/*
 * MARK: Raw String Literal:
 * Raw String Literal: Los literales de cadena sin procesar en Swift se encierran entre #""" y """#.
 * Esto es útil cuando quieres incluir caracteres especiales en una cadena sin necesidad de escaparlos.
 * Esto permite que la cadena contenga caracteres especiales, como comillas dobles, sin necesidad de escaparlos.
 */

let threeMoreDoubleQuotationMarks = #"""
Here are three more double quotes: """
"""#

// MARK: Mutabiliad
var variableString = "Horse"
variableString += " and carriage"
// variableString is now "Horse and carriage"


let constantString = "Highlander"
constantString += " and another Highlander"
// this reports a compile-time error - a constant string cannot be modified

// MARK: Concatenación de strings
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2
// welcome now equals "hello there"

var instruction = "look over"
instruction += string2
// instruction now equals "look over there"

let exclamationMark: Character = "!"
welcome.append(exclamationMark)
// welcome now equals "hello there!"

// MARK: Interpolación de strings
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
print(#"6 times 7 is \#(6 * 7)."#)

// MARK: Conteo de caracteres
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.count) characters")

// MARK: Indices de strings
let greeting = "Guten Tag!"
greeting[greeting.startIndex]
// G
greeting[greeting.index(before: greeting.endIndex)]
// !
greeting[greeting.index(after: greeting.startIndex)]
// u
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]
// a

for index in greeting.indices {
    print("\(greeting[index])", terminator: "")
}

// MARK: Caracteres
let exclamationMark: Character = "!"
let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters) // Prints "Cat!🐱"


// MARK: Ejercicio
func isPalindrome(str: String) -> Bool {
    var l = 0
    var r = str.count - 1
    
    while (l <= r) {
        if (str[l] != str[r]) return false
        l += 1
        r -= 1
    }
    return true
}

func isIsogram(str: String) -> Bool {
    var seenCharacters: Set<Character> = Set()
    
    for letter in str {
        if letter != ' ' {
            if letter in seenCharacters {
                return false
            }
            seenCharacters.insert(letter)
        }
    }
    return true
}

func isAnagram(str1: String, str2: String) -> Bool {
    
    if str1.count != str2.count {
        return false
    }
    
    var str1LowerCase = str1.lowercased()
    var str2LowerCase = str2.lowercased()
    
    var charCountMap = [Character:Int]()
    for letter in str1 {
        charCountMap[char, default: 0] += 1
    }
    
    for letter in str2 {
        charCountMap[char, default: 0] -= 1
    }
    
    return charCountMap.values.allSatisfy { $0 == 0}
}


//: [Next](@next)
