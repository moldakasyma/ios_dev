import Foundation

func isPalindrome() -> Bool {
    print("Please enter your word: ")
    if let input = readLine() {
        //lowercase
        let lowercase = input.lowercased()
        
        //remove spaces and punctuation
        let cleanedInput = lowercase.filter { $0.isLetter || $0.isNumber }
        let chars = Array(cleanedInput)
        
        //check palindrome
        for i in 0..<chars.count {
                  if chars[i] != chars[chars.count - i - 1] {
                      return false
            }
        }
        return true
    }
    return false
}

// Run the function
if isPalindrome() {
    print("This is a palindrome!")
} else {
    print("This is not a palindrome.")
}
