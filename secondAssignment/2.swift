import Foundation

func isPrime(_ number: Int) -> Bool {
    //if number<1 it is not a prime num
    if number <= 1 {
        return false
    }
    //2 is prime num
    if number == 2 {
        return true
    }
    //check divisibility from 2 up to the square root of the number.
    let limit = Int(Double(number).squareRoot())
    if limit >= 2 {
        for i in 2...limit {
            if number % i == 0 {
                return false
            }
        }
    }
    
    return true
}
//run loop to check
for i in 1...100 {
    if isPrime(i) {
        print("\(i) is prime")
    } else {
        print("\(i) is not prime")
    }
}
