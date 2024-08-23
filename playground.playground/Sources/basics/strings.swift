import Foundation

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
