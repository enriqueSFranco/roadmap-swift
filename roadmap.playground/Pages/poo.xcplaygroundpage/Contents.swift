/*:
 # Introduction
 Conceptos básicos de Progrmación Orientada a Objetos en Swift
*/

import Foundation


let contacto1 = Contacto(nombre: "Juan", apellido: "Pérez", telefono: "123-456-7890")
print(contacto1.description)  // Imprimirá: Nombre: Juan Pérez, Teléfono: 123-456-7890

let contactoFavorito = ContactoFavorito(nombre: "Ana", apellido: "García")
print(contactoFavorito.description)  // Imprimirá: ⭐ Nombre: Ana García, Teléfono: No disponible, Favorito: true

let contactoFavorito2 = ContactoFavorito(nombre: "Luis", apellido: "Martínez", telefono: "987-654-3210", esFavorito: true)
print(contactoFavorito2.description)  // Imprimirá: ⭐ Nombre: Luis Martínez, Teléfono: 987-654-3210, Favorito: true

if let student = Student(name: "Kirito", grade: 100) {
    print("Student initialized successfully with name: \(student.name) and grade: \(student.grade)")
} else {
    print("Failed to initialize Student due to invalid input.")
}

createStudent(name: "Prof. Jirafales", grade: 110)
createStudent(name: "Kiko", grade: 12)
createStudent(name: "Florinda", grade: 56)
