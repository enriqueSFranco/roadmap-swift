//
//  enums.swift
//  
//
//  Created by Enrique SFranco on 25/09/24.
//

enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

// Inicializacion a partir de un valor bruto
let possiblePlanet = Planet(rawValue: 3) // Planet.earth


enum Command: String {
    case up = "w", dow = "s", left = "a", right = "d", exit = "e"
}

let choice = readLine()
let posisibleCommand = Command(rawValue: choice.lowercased())
