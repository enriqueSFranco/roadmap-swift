//: [Previous](@previous)

var someInts: [Int] = []
print("someInts is of type [Int] with \(someInts.count) items.")

var daysOfWeek: [String] = ["domingo", "lunes", "martes", "miercoles", "jueves", "viernes", "sabado"]

// Accediendo a atraves del indice
let firstDayOfWeek = daysOfWeek[0]
let sunday = daysOfWeek.first

let lastDay = daysOfWeek.last
let friday = daysOfWeek[5]

// Agregando un nuevo dia a la lista
daysOfWeek.append("Christmas")

for day in daysOfWeek {
    print("El dia de hoy es \(day)")
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


// ENUMS
enum Command: String {
    case up = "w", down = "s", left = "a", right = "d", exit = "e"
}

func runCommand() {
    print("Introduce un comando: ", terminator: "")
    if let choice = readLine() {
        print("Entrada recibida: \(choice)") // Para verificar la entrada
        let posibleCommand = Command(rawValue: choice.lowercased())
        if let command = posibleCommand {
            print("Comando recibido: \(command)")
        } else {
            print("Comando no válido.")
        }
    } else {
        print("No se recibió ninguna entrada.")
    }
}

// Llama a la función para probarla
runCommand()

//: [Next](@next)
