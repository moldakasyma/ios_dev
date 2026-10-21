import Cocoa

//func greeting() -> Void {}
//func greeting() {
//    print("Hello World!")
//}

//func sayHello(to name: String = "Samantha") {
//    let message = "Hello, \(name)!"
//    print(message)
//}
//
//var name: String = "Alice"
//sayHello(to: name)
//sayHello(to: "John")
//sayHello()
//
//func divide(_ lhs: Double, _ rhs: Double) -> Double {
//    rhs / lhs
//}
//
//let result = divide(2, 100)
//print(result)
//
//let array = [1, 2, 3]
//
func minMax(array: [Int]) -> (min: Int, max: Int) {
    let min = array.min() ?? 0
    let max = array.max() ?? 0
    return (min: min, max: max)
}
//
//func increment(_ number: inout Int) {
//    number += 1
//}
//
//var counter = 5
//increment(&counter)
//
//print(counter)
//


func divide(_ lhs: Double, _ rhs: Double) throws -> Double {
    if rhs == 0 {
        throw DivisionError.divisionByZero
    }

    return lhs / rhs
}

enum DivisionError: Error {
    case divisionByZero
}

do {
    try divide(100, 0)
} catch {
    print("Error: \(error)")
}

let numbers = [1, 2, 3, 4]

let numbersTwo = numbers.map { $0 * 2 }
print(numbersTwo)

