
import Foundation

func fibonacci(_ n: Int) -> [Int]{
    if n<=0{
        return []
    }
    else if(n==1){
        return [0]
    }
    else if n==2{
        return [0,1]
    }
    
    var sequence=[0,1]
    for _ in 2..<n{
        let next=sequence[sequence.count-1]+sequence[sequence.count-2]
        sequence.append(next)
    }
    return sequence
}
print("Enter a number: ")
if let input=readLine(), let n=Int(input){
    let result=fibonacci(n)
    print("Fibonacci sequence: \(result)")
    
}
else{
    print("Invalid input")
}
    


