//: [Previous](@previous)

import Foundation



/*:
 
 ## PROPIEDADES ALMACENADAS
 
 ## PROPIEDADES CALCULADAS
 
 Permite crear una propiedad cuyo valor se calcula dinámicamente, en lugar de almacenarse
 directamente en la memoria como una propiedad almacenada.
 
 Calcula un valor cada vez que se accede a la propiedad
 
*/



/*:
 
 ## PROPIEDADES ALMACENADAS
 
*/

struct Car {
    var model: String // Stored property
    var year: Int
    
    init?(model: String, year: Int) {
        if model.isEmpty || year < 1900 {
            return nil
        }
        
        self.model = model
        self.year = year
    }
    
    var description: String {
        "Car(model: \(model), year: \(year))"
    }
}

if let car = Car(model: "Ford", year: 1990) {
    print(car.description)
} else {
    print("Fallo la inicializacion")
}


//: [Next](@next)
