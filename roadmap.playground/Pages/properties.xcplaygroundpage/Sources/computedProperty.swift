//
//  computedProperty.swift
//  
//
//  Created by Enrique SFranco on 08/10/24.
//

import Foundation

/*: ## PROPIEDADES CALCULADAS
 
 Permite crear una propiedad cuyo valor se calcula dinámicamente, en lugar de almacenarse
 directamente en la memoria como una propiedad almacenada.
 
 Calcula un valor cada vez que se accede a la propiedad
 
*/


// SINTAXIS
struct Rectagle {
    var with: Double
    var height: Double
    
    var area: Double {
        // Computed property
        get { return with * height }
    }
    
    // Read-only computed property
    // Es util cuando queremos exponer un valor dinamicamente pero evitando modificaciones
    var perimeter: Double {
        return 2 * (with + height)
    }
}

struct Circle {
    var radius: Double = 5.0 // Stored property
}


// PROPIEDADES CALCULADAS CON SETTERS
struct Square {
    var sideLength: Double = 0.0
    
    var area: Double {
        get { sideLength * sideLength }
        set(newArea) {
            sideLength = sqrt(newArea)
        }
    }
}

var square = Square(sideLength: 10)
print(square.area) // 100

square.area = 100
print(square.sideLength) // 10


struct MyFile {
    var filename: String
    var extensionType: String
    
    var fullFilename: String {
        get { "\(filename).\(extendedType)" }
        
        set(newFullFilename) {
            let parts = newFullFilename.split(separator: ".")
            if part.count == 2 {
                filename = String(parts[0])
                extensionType = String(parts[1])
            }
        }
    }
}
