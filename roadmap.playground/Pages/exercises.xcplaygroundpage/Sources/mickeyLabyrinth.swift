//
//  mickeyLabyrinth.swift
//  
//
//  Created by Enrique SFranco on 25/09/24.
//

import Foundation

/*
 * EJERCICIO:
 * ¡Disney ha presentado un montón de novedades en su D23!
 * Pero... ¿Dónde está Mickey?
 * Mickey Mouse ha quedado atrapado en un laberinto mágico
 * creado por Maléfica.
 * Desarrolla un programa para ayudarlo a escapar.
 * Requisitos:
 * 1. El laberinto está formado por un cuadrado de 6x6 celdas.
 * 2. Los valores de las celdas serán:
 *    - ⬜️ Vacío
 *    - ⬛️ Obstáculo
 *    - 🐭 Mickey
 *    - 🚪 Salida
 * Acciones:
 * 1. Crea una matriz que represente el laberinto (no hace falta
 * que se genere de manera automática).
 * 2. Interactúa con el usuario por consola para preguntarle hacia
 * donde se tiene que desplazar (arriba, abajo, izquierda o derecha).
 * 3. Muestra la actualización del laberinto tras cada desplazamiento.
 * 4. Valida todos los movimientos, teniendo en cuenta los límites
 * del laberinto y los obtáculos. Notifica al usuario.
 * 5. Finaliza el programa cuando Mickey llegue a la salida.
 */

enum Cell: String {
    case empty = "⬜️"
    case obstacle = "⬛️"
    case mickey = "🐭"
    case exit = "🚪"
}

enum Command {
    case UP, RIGHT, DOWN, LEFT, EXIT
    
    init?(command: String) {
        switch command.lowercased() {
            case "w":
                self = .UP
            case "r":
                self = .RIGHT
            case "s":
                self = .DOWN
            case "a":
                self = .LEFT
            case "x":
                self = .EXIT
            default:
                return nil
        }
        
    }
}

var grid: [[Cell]] = [
    [.mickey, .empty, .obstacle, .empty, .obstacle, .obstacle],
    [.empty, .empty, .obstacle, .empty, .obstacle, .empty],
    [.obstacle, .empty, .empty, .obstacle, .empty, .empty],
    [.empty, .obstacle, .empty, .empty, .empty, .obstacle],
    [.obstacle, .empty, .obstacle, .obstacle, .empty, .empty],
    [.obstacle, .empty, .obstacle, .empty, .empty, .exit],
]

let menuOptions = ["[W] Move Up", "[D] Move Rgiht", "[S] Move Down", "[A] Move Left"]

var mickeyPosition: (row: Int, col: Int) = (0, 0) // Posicion inicial de mickey

func printGrid() {
    print("\u{001B}[c")
    for row in grid {
        print(row.map { $0.rawValue }.joined())
    }
}

func initializeMickeyPosition() {
    for (rowIndex, row) in grid.enumerated() {
        if let colIndex = row.firstIndex(where: { $0 == .mickey}) {
            mickeyPosition = (rowIndex, colIndex)
            return
        }
    }
}

func isValidMove(row: Int, col: Int) -> Bool {
    return row >= 0 && row < grid.count &&
            col >= 0 && col < grid[0].count &&
            grid[row][col] != .obstacle
}

func moveMickey(command: Command) {
    let (row, col) = mickeyPosition
    var newRow = row
    var newCol = col
    
    switch command {
        case .UP:
            newRow -= 1
        case .RIGHT:
            newCol += 1
        case .DOWN:
            newRow += 1
        case .LEFT:
            newCol -= 1
        case .EXIT:
            print("Gracias por jugar")
            exit(0)
    }
    
    if isValidMove(row: newRow, col: newCol) {
        // Actualizar la posición de Mickey
        grid[row][col] = .empty // La celda anterior queda vacía
        mickeyPosition = (newRow, newCol)
    
        if grid[newRow][newCol] == .exit {
            printGrid()
            print("Has ganado!")
            exit(0)
        }
        grid[newRow][newCol] = .mickey
    } else {
        print("Movimiento fuera de los límites del laberinto.")
    }
}

public func runGame() {
    initializeMickeyPosition()

    while true {
        print("¿Hacia dónde te quieres mover? (W: Arriba, D: Derecha, S: Abajo, A: Izquierda, X: Salir)")
        if let input = readLine(), let command = Command(command: input) {
            printGrid()
            moveMickey(command: command)
        } else {
            print("Entrada no válida. Por favor, intenta de nuevo.")
        }
    }
}
