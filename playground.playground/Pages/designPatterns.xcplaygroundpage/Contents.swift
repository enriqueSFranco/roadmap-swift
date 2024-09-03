//: [Previous](@previous)

import Foundation

protocol Strategy {
    associatedtype Element: Comparable
    func doAlgorithm(_ data: [Element]) -> [Element]
}

// Estrategia de ordenamiento ascendente
class ConcreteStrategyA<T: Comparable>: Strategy {
    func doAlgorithm(_ data: [T]) -> [T] {
        return data.sorted()
    }
}

// Estrategia de ordenamiento descendente
class ConcreteStrategyB<T: Comparable>: Strategy {
    func doAlgorithm(_ data: [T]) -> [T] {
        return data.sorted(by: >)
    }
}

// Contexto que utiliza una estrategia de ordenamiento genérica
class Context<T: Comparable> {
    private var strategy: AnyStrategy<T>
    
    init(strategy: AnyStrategy<T>) {
        self.strategy = strategy
    }
    
    func update(strategy: AnyStrategy<T>) {
        self.strategy = strategy
    }
    
    func doSomeBusinessLogic(_ data: [T]) -> [T] {
        print("Context: Sorting data using the strategy (not sure how it'll do it)\n")
        let result = strategy.doAlgorithm(data)
        return result
    }
}

// Wrapper para usar tipos genéricos con `any`
struct AnyStrategy<Element: Comparable>: Strategy {
    private let _doAlgorithm: ([Element]) -> [Element]

    init<S: Strategy>(_ strategy: S) where S.Element == Element {
        _doAlgorithm = strategy.doAlgorithm
    }
    
    func doAlgorithm(_ data: [Element]) -> [Element] {
        return _doAlgorithm(data)
    }
}

func main() {
    let strategyA = ConcreteStrategyA<String>()
    let strategyB = ConcreteStrategyB<String>()
    
    let ctx = Context(strategy: AnyStrategy(strategyA))
    print(ctx.doSomeBusinessLogic(["a", "z", "c", "f", "t"]))
    
    ctx.update(strategy: AnyStrategy(strategyB))
    print(ctx.doSomeBusinessLogic(["a", "z", "c", "f", "t"]))
}

// Llamada a la función principal
main()


//: [Next](@next)
