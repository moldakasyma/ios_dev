import Foundation

func add(_ a: Double, _ b: Double) -> Double{
    return a+b
}

func substract(_ a:Double, _ b:Double) -> Double{
    return b-a
}

func multiply(_ a:Double, _ b: Double) -> Double{
    return a*b
}

func divisione(_ a:Double, _ b:Double) -> Double?{
    if b==0{
        return nil
    }
    return a/b
}

var running=true

while running{
    print("Enter the first number:")
    guard let fisrtInput=readLine(), let num1=Double(fisrtInput) else{
        print("Invalid number. Try again")
        continue
    }
    
    print("Enter the second number: ")
    guard let secondInput=readLine(), let num2=Double(secondInput) else{
        print("Invalid number. Try again")
        continue
    }
    
    print("Choose an operation (+, -, *, /): ")
    guard let operation=readLine(), ["+", "-", "*", "/"].contains(operation) else{
        print("Invalid operation.Try again")
        continue
    }
    
    var result: Double?
    switch operation {
    case "+":
        result=add(num1, num2)
    case "-":
        result=substract(num1,num2)
    case "*":
        result=multiply(num1, num2)
    case "/":
        if let divisionResult = divisione(num1, num2) {
                   result = divisionResult
               } else {
                   print("Error: Division by zero!")
               }
    default:
          break
    }
    if let res=result{
        print(res)
    }
    
    print("Do you want to continue? (yes/no): ")
    if let continueInput=readLine(), continueInput.lowercased() != "yes"{
        running=false
    }

        
    
    
                                     
}
print("Goodbye!")
