import Foundation

// MARK: TIPOS DE VALOR
// En Swift, las estructuras, enumeraciones y tuplas son todos tipos de valores.
struct DocumentValue {
    var text: String
}

var myDoc = DocumentValue(text: "Great new article")
var friendDoc = myDoc
friendDoc.text = "bla bla bla"

print(friendDoc.text) // prints "Blah blah blah"
print(myDoc.text) // prints "Great new article"


// MARK: TIPOS DE REFERENCIA
// En Swift, las clases, los actores y las closures son todos tipos de referencia.
class DocumentRef {
    var text: String
    
    init(text: String) {
        self.text = text
    }
}

var myDocRef = DocumentRef(text: "Great new article")
var friendDocRef = myDocRef
friendDocRef.text = "Bla bla bla"
print(friendDocRef.text) // prints "Blah blah blah"
print(myDocRef.text) // prints "Blah blah blah"

// NOTE: En Swift las colecciones estándar son todos tipos de valores Array, Dictionary, String
