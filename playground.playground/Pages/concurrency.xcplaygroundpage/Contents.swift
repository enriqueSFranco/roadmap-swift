//: [Previous](@previous)

import Foundation

func executeTask(name: String, duration: Int) async {
    let start = Date()
    print("\(name) started at \(start) and will run for \(duration) seconds")
    
    await Task.sleep(for: .seconds(duration))
    
    let end = Date()
    print("\(name) ended at \(end)")
}

func runTasks() async {
    async let taskC = executeTask(name: "Función C", duration: 3)
    async let taskB = executeTask(name: "Función B", duration: 2)
    async let taskA = executeTask(name: "Función A", duration: 1)
    
    await [taskC, taskB, taskA]
    
    await executeTask(name: "Función D", duration: 1)
    
}

// MARK: Definición y Llamamiento de Funciones Asíncronas

func listPhotos(inGallery name: String) async throws -> [String] {
    try await Task.sleep(for: .seconds(2))
    return ["IMG001", "IMG99", "IMG0404"]
}

func downloadPhoto(named: String) async -> String {
    return name
}

let photoNames = try await listPhotos(inGallery: "Summer Vacation")
let sortedNames = photoNames.sorted()
let name = sortedNames[0]

func generateSlideshow(forGallery gallery: String) async throws {
    let photos = try await listPhotos(inGallery: gallery)
    
    for photo in photos {
        await Task.yield()
    }
}

let handle = FileHandle.standardInput
for try await line in handle.bytes.lines {
    print(line)
}

// MARK: Llamando Funciones Asíncronas en Paralelo

// Solo una llamada a corre a la vez
let firstPhoto1 = await downloadPhoto(named: photoNames[0])
let secondPhoto2 = await downloadPhoto(named: photoNames[1])
let thirdPhoto3 = await downloadPhoto(named: photoNames[2])

let photos = await [firstPhoto, secondPhoto, thirdPhoto]

// Para llamar a una función asíncrona y dejar que se ejecute en paralelo con el código que la rodea
// Llame a funciones asíncronas con async-let cuando no necesite el resultado hasta más tarde en su código.
async let firstPhoto = downloadPhoto(named: photoNames[0])
async let secondPhoto = downloadPhoto(named: photoNames[1])
async let thirdPhoto = downloadPhoto(named: photoNames[2])

// MARK: Tareas y Grupos de Tareas
//let photos = await withTaskGroup(of: Data.self) { group in
//    let photoNames = await listPhotos(inGallery: "Summer Vacation")
//    
//    for name in photoNames {
//        group.addTask {
//            return await downloadPhoto(named: name)
//        }
//    }
//    
//    let result: [Data] = []
//    
//    for await photo in group {
//        result.append(photo)
//    }
//    
//    return result
//}

//: [Next](@next)
