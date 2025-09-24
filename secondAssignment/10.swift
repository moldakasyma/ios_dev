import Foundation

func uniqueChar(_ text: String) -> Bool{
    var checkUniq=Set<Character>()
    for i in text{
        if checkUniq.contains(i){
            return false //since there is already a char it is not unique
        }
        else{
            checkUniq.insert(i)
        }
    }
    return true
}


while true{
    print("Enter a word:")
    guard let input=readLine(),!input.isEmpty else{
        print("Invalid input, try again")
        continue
    }
    
    if uniqueChar(input){
        print("It is a unique word")
    }
    else{
        print("It's a usual word")
    }
    
    print("Do you want to try another one? (yes/no): ")
    if let tryAgain=readLine(), tryAgain != "yes"{
        print("Bye")
        break
    }
    
    
}
    
