//
//  inicializadores.swift
//  
//
//  Created by Enrique SFranco on 07/10/24.
//

// INICIALIZADORES

/**
 * Inicializador Designado
 *
 * Un inicializador designado es el inicializador principal de una clase, responsable de asignar todos los valores de las propiedades del objeto
 * y de llamar a los inicializadores de la clase base (si la clase hereda de otra). Cada clase debe tener al menos un inicializador designado.
 *
 * Características Clave
 * Asignación de Propiedades: Debe inicializar todas las propiedades que no tienen valores predeterminados antes de que se pueda usar el objeto.
 * Llamada a Super: Si la clase hereda de otra clase, debe llamar al inicializador designado de la superclase.
 * Conveniencia: Los inicializadores designados pueden llamar a otros inicializadores designados de la misma clase para evitar duplicar código.
 **/
class Vehiculo {
    var marca: String
    var modelo: String
    
    // Inicializador Designado
    init(marca: String, modelo: String) {
        self.marca = marca
        self.modelo = modelo
    }
    
    var description: String {
        return "Vehiculo(marca: \(marca), modelo: \(modelo)"
    }
}

/**
 * Inicializadores de Conveniencia
 *
 * Inicializadores secundarios que pueden llamar a los inicializadores designados de la misma clase.
 * Esto es útil para proporcionar diferentes formas de inicializar un objeto sin duplicar código.
 **/

class Food {
    var name: String
    
    // Inicializador designado
    init(name: String) {
        self.name = name
    }
    
    // Inicializador de conveniencia
    convenience init() {
        self.init(name: "[Unnamed Food]")
    }
}

class RecipeIngredient: Food {
    var quantity: Int
    
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}

let oneMisteryItem = RecipeIngredient()
let oneBacon = RecipeIngredient(name: "Bacon")
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 12)

class ShoppingListItem: RecipeIngredient {
    var purchased = false
    
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? " ✔" : " ✘"
        return output
    }
}

var breakfastList: [ShoppingListItem] = [
    ShoppingListItem(),
    ShoppingListItem(name: "Bacon"),
    ShoppingListItem(name: "Eggs", quantity: 6)
]


public func updateFirstShoppingItemAndPrintList() {
    breakfastList[0].name = "Orange juice"
    breakfastList[0].purchased = true
    
    for item in breakfastList {
        print(item.description)
    }
}
// 1 x Orange juice ✔
// 1 x Bacon ✘
// 6 x Eggs ✘


// Otro ejemplo de constructor (convenience)
public class Contacto {
    var nombre: String
    var apellido: String
    var telefono: String
    
    public init(nombre: String, apellido: String, telefono: String) {
        self.nombre = nombre
        self.apellido = apellido
        self.telefono = telefono
    }
    
    convenience init(nombre: String, apellido: String) {
        self.init(nombre: nombre, apellido: apellido, telefono: "No disposible")
    }
    
    public var description: String {
        return "Contacto(nombre: \(nombre), apellido: \(apellido), telefono: \(telefono))"
    }
}

public class ContactoFavorito: Contacto {
    var esFavorito: Bool
    
    public init(nombre: String, apellido: String, telefono: String, esFavorito: Bool) {
        self.esFavorito = esFavorito
        super.init(nombre: nombre, apellido: apellido, telefono: telefono)
    }
    
    public convenience init(nombre: String, apellido: String) {
        self.init(nombre: nombre, apellido: apellido, telefono: "No disponible", esFavorito: true)
    }
    
    public override var description: String {
        return "⭐️ ContactorFavorito(nombre: \(nombre), apellido: \(apellido), telefono: \(telefono), esFavorito: \(esFavorito))"
    }
}

// Inicializadores Disponibles
// Puede definir un inicializador fallible y no disponible con los mismos tipos y nombres de parámetros.
enum TemperatureUnit {
    
    case celcius, farhenheit, kelvin
    
    init?(symbol: String) {
        switch symbol {
        case "c":
            self = .celcius
        case "f":
            self = .farhenheit
        case "k":
            self = .kelvin
        default:
            return nil
        }
    }
}

public class Person {
    public var name: String
    
    public init?(name: String) {
        if name.isEmpty {
            return nil
        }
        self.name = name
    }
}

public class Student: Person {
    public var grade: Int
    
    public init?(name: String, grade: Int) {
        
        if grade < 0 || grade > 100 {
            return nil
        }
        self.grade = grade
        super.init(name: name)
    }
    
    var description: String {
        return "Student(name: \(name), grade: \(grade)"
    }
}

/*:
 # Unwrapping Optional Values
 - Optional Binding (if let)
 - Esta es la forma más común de desenvolver opcionales. Comprueba si la opción contiene un valor y, de ser así, lo asigna a una constante o variable temporal.
 ```
    if let student = Student(name: "Jhon", grade: 85) {
        print("Student initialized successfully with name: \(student.name) and grade: \(student.grade)")
    } else {
        print("Failed to initialize Student due to invalid input.")
    }
 ```
 */


public func createStudent(name: String, grade: Int) -> Student? {
    guard let student = Student(name: name, grade: grade) else {
        print("Initialization failed due to invalid input.")
        return nil
    }
    print("Student initialized with name: \(student.name) and grade: \(student.grade)")
    return student
}


class User {
    var username: String
    var email: String
    
    init?(username: String, email: String) {
        if email.isEmpty || !email.contains("@") || username.isEmpty {
            return nil
        }
        self.username = username
        self.email = email
    }
    
    var description: String {
        return "User(username: \(username), email: \(email))"
    }
}
