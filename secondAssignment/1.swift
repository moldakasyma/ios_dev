import Foundation
//for this problem i iterate through range from 1 to 100 and use if,else,else if to check if numbers allign with conditions
for i in 1...100{
    if(i%3==0 && i%5==0){
        print("FizzBuzz")
    }
    else if(i%3==0){
        print("Fizz")
    }
    else if(i%5==0){
        print("Buzz")
    }
    else{
        print(i)
    }
}
