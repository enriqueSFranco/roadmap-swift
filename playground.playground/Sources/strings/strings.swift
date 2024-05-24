import Foundation

func mainStr() {
    let quotation = """
    The White Rabbit put on his spectacles.  "Where shall I begin,
    please your Majesty?" he asked.

    "Begin at the beginning," the King said gravely, "and go on
    till you come to the end; then stop."
    """

    let sparklingHeart = "\u{1F496}"

    let name = ""

    if name.isEmpty {
        print("anonymous")
    }
    
    // string mutable
    var variableString = "hello"
    variableString += "world"
    
    // characters
    let exclamationMark: Character = "!"
    
    // traversing
    for character in "Dog 🐶" {
        print(character)
    }
    
    // array of string
    let catCharacters: [Character] = ["c", "a", "t", "😺"] // se debe especificar el tipo para despues pasarlo a String
    let catString = String(catCharacters)
    
    // concatenating strings and characters
    let string1 = "hello"
    let string2 = "world"
    var welcome = string1 + string2
    
    welcome.append(exclamationMark)
    
    // string interpolation
    let multiplier = 3
    let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
    
    // raw strings
    print(#"6 times 7 is \#(6 * 7)."#) // se usa para los caracteres de escape
    
    // counting characters
    let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
    print("unusualMenagerie has \(unusualMenagerie.count) characters")
    
    var word = "coffe"
    print("the number of characters on \(word) is \(word.count)")
    
    // string indices
    let greeting = "Guten Tag!"
    let firstChatacter: Character = greeting[greeting.startIndex] // G
    let endCharacter: Character = greeting[greeting.index(before: greeting.endIndex)] // !
    let secondCharacter: Character = greeting[greeting.index(after: greeting.startIndex)] // u
    
    let index = greeting.index(greeting.startIndex, offsetBy: 7)
    print(greeting[index]) // a
    
    // inserting and removing
    welcome.insert("!", at: welcome.endIndex)
    
    
    // substring
    let idx = greeting.firstIndex(of: ",") ?? greeting.endIndex
    let beginning = greeting[..<idx]

    let newString = String(beginning)
    print(newString)


    // comparing string
    let someText = "We're a lot alike, you and I."
    let sameQuotation = "We're a lot alike, you and I."

    if someText == sameQuotation {
        print("These two strings are considered equal")
    }

    // prefijos y sufijos
    let romeoAndJuliet = [
        "Act 1 Scene 1: Verona, A public place",
        "Act 1 Scene 2: Capulet's mansion",
        "Act 1 Scene 3: A room in Capulet's mansion",
        "Act 1 Scene 4: A street outside Capulet's mansion",
        "Act 1 Scene 5: The Great Hall in Capulet's mansion",
        "Act 2 Scene 1: Outside Capulet's mansion",
        "Act 2 Scene 2: Capulet's orchard",
        "Act 2 Scene 3: Outside Friar Lawrence's cell",
        "Act 2 Scene 4: A street in Verona",
        "Act 2 Scene 5: Capulet's mansion",
        "Act 2 Scene 6: Friar Lawrence's cell"
    ]

    var mansionCount = 0
    var cellCount = 0

    for scene in romeoAndJuliet {
        if scene.hasSuffix("Capulet's mansion") {
            mansionCount += 1
        }
        else if scene.hasSuffix("cell") {
            cellCount += 1
        }
    }

    print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")

    var act1SceneCount = 0
    for scene in romeoAndJuliet {
        if scene.hasPrefix("Act 1") {
            act1SceneCount += 1
        }
    }
    print("There are \(act1SceneCount) scenes in Act 1")

}
