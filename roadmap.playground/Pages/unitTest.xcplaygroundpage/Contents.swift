//: [Previous](@previous)

import Foundation
import XCTest

// @testable import yourAppModuleName

class Calculator {
    func sum(a: Double = 0.0, b: Double = 0.0) -> Double {
        a + b
    }
    
    func subtract(a: Double = 0.0, b: Double = 0.0) -> Double {
        a - b
    }
    
    func multiply(a: Double = 0.0, b: Double = 0.0) -> Double {
        a * b
    }
    
    func division(a: Double = 0.0, b: Double = 0.0) throws -> Double {
        if (b == 0) {
            throw NSError(domain: "", code: 1, userInfo: [NSLocalizedDescriptionKey: "No se puede dividir por cero"])
        }
        return a / b
    }
}

class CalculatorTest: XCTestCase {
    private var calculator: Calculator!
    
    override func setUp() {
        super.setUp()
        calculator = Calculator()
    }
    
    override func tearDown() {
        calculator = nil
        super.tearDown()
    }
    
    func testSum() {
        XCTAssertEqual(calculator.sum(), 0.0, "Default sum should be 0.0")
        XCTAssertEqual(calculator.sum(a: 5.0, b: 3.0), 8.0, "5.0 + 3.0 should be 8.0")
        XCTAssertEqual(calculator.sum(a: -5.0, b: -3.0), -8.0, "(-5.0) + (-3.0) should be -8.0")
    }
    
    func testSubtract() {
        XCTAssertEqual(calculator.subtract(a: 10.0, b: 5.0), 5.0, "10.0 - 5.0 should be 5.0")
        XCTAssertEqual(calculator.subtract(a: 5.0, b: 3.0), 2.0, "5.0 - 3.0 should be 2.0")
        XCTAssertEqual(calculator.subtract(a: -5.0, b: -3.0), -2.0, "-5.0 - (-3.0) should be -2.0")
    }
    
    func testMultiply() {
        XCTAssertEqual(calculator.multiply(a: 10.0, b: 10.0), 100.0, "10.0 * 10.0 should be 100.0")
    }
    
    func testDivision() {
        XCTAssertEqual(try? calculator.division(a: 10.0, b: 5.0), 2.0, "10.0 / 2.0 should be 5.0")
        XCTAssertThrowsError(try calculator.division(a: 10.0, b: 0.0), "Division by zero should throw an error") { error in
            XCTAssertEqual((error as NSError).localizedDescription, "No se puede dividir por cero", "Error message should be 'No se puede dividir por cero'")
        }
        
    }
}

struct UserData {
    let name: String
    let age: Int32
    let birthDate: String
    let programmingLanguages: [String]
    
    
}

func getUserData() -> UserData {
    return UserData(name: "Enrique", age: 26, birthDate: "02/04/1998", programmingLanguages: ["javascript", "kotlin", "swift", "dart"])
}
//: [Next](@next)
