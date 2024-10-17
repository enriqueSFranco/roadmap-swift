//: [Previous](@previous)

import Foundation

class RandomUtils {
    static func generateRandomInt64(min: Int64, max: Int64) -> Int64 {
        Int64.random(in: min...max)
    }
    
    static func generateBoolean(probability: Double) -> Bool {
        Double.random(in: 0...1) < probability
    }
}

class Superhero {
    private let _name: String
    private var health: Int64
    private let minDamage: Int64
    private let maxDamage: Int64
    private var _chanceToEvade: Double
    private var _activatingRegeneration: Bool
    
    var activatingRegeneration: Bool {
        get {
            return _activatingRegeneration
        }
        set {
            _activatingRegeneration = newValue
        }
    }
    
    var name: String {
        get {
            return _name
        }
    }
    
    var status: String {
            let healthStatus = health > 0 ? "\(health) de vida" : "0 de vida"
            return "\(name) tiene \(healthStatus)"
        }
    
    init(
        name: String = "Anonymous",
        health: Int64 = 100,
        minDamage: Int64 = 10,
        maxDamage: Int64 = 100,
        chanceToEvade: Double = 0.25,
        activatingRegeneration: Bool = false
    ) {
        self._name = name
        self.health = health
        self.minDamage = minDamage
        self.maxDamage = maxDamage
        self._chanceToEvade = chanceToEvade
        self._activatingRegeneration = activatingRegeneration
    }
    
    func attack() -> Int64 {
        RandomUtils.generateRandomInt64(min: minDamage, max: maxDamage)
    }
    
    func canEvade() -> Bool {
        RandomUtils.generateBoolean(probability: _chanceToEvade)
    }
    
    func receiveDamage(damage: Int64) {
        if damage >= self.health {
            health = 0
            _activatingRegeneration = true
            return
        }
        health -= damage
    }
    
    func isAlive() -> Bool {
        health > 0
    }
}

class Battle {
    private var turn = 1
    private let superheroOne: Superhero
    private let superheroTwo: Superhero
    
    init(superheroOne: Superhero, superheroTwo: Superhero) {
        self.superheroOne = superheroOne
        self.superheroTwo = superheroTwo
    }
    
    func simulate() {
        while superheroOne.isAlive() && superheroTwo.isAlive() {
            print("Turno \(turn)")
            
            executeTurn(attacker: superheroOne, defender: superheroTwo)
            if superheroTwo.isAlive() {
                executeTurn(attacker: superheroTwo, defender: superheroOne)
            }
            turn += 1
            sleep(1)
        }
        print(declareWinner())
    }
    
    func executeTurn(attacker: Superhero, defender: Superhero) {
        if attacker.isAlive() {
            let damage = attacker.attack()
            print("\(attacker.name) hace un ataque de \(damage) pts")
            if !defender.canEvade() {
                defender.receiveDamage(damage: damage)
                print("\(defender.name) recibe \(damage) pts de daño")
            } else {
                print("\(defender.name) ha evadido el ataque de \(attacker.name).")
            }
        } else if defender.activatingRegeneration {
            defender.activatingRegeneration = false
            print("\(attacker.name) ha terminado su regeneración y está listo para atacar nuevamente.")
        }
        print(attacker.status)
        print(defender.status)
    }
    
    func declareWinner() -> String {
        switch (superheroOne.isAlive(), superheroTwo.isAlive()) {
            case (true, false):
                return "\(superheroOne.name) ha ganado"
            case (false, true):
                return "\(superheroTwo.name) ha ganado"
            case (false, false):
                return "Ha ocurrido un empate entre \(superheroOne.name) y \(superheroTwo.name)"
            default:
                return "Resultado desconocido"
        }
    }
}

let deadpool = Superhero(name: "Deadpool")
let wolverine = Superhero(name: "Wolverine", maxDamage: 120, chanceToEvade: 0.20)

let battle = Battle(superheroOne: deadpool, superheroTwo: wolverine)
battle.simulate()

//: [Next](@next)
