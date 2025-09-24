import Foundation

print("Please enter your sentence: ")
if let input=readLine(){
    //make each word in one format
    let lowercase=input.lowercased()
    //removing any punctuation
    let cleanedInput = lowercase.components(separatedBy: CharacterSet.punctuationCharacters).joined()
    //make every word a seperated sentence
    let words=cleanedInput.split(separator: " ").map {String($0)}
    
    var dictionaryWord: [String:Int]=[:]
    
    for word in words {
        if let count=dictionaryWord[word]{
            dictionaryWord[word]=count+1
        }
        else{
            dictionaryWord[word]=1
        }
        
    }
    print("\nWord frequency:")
    for(word, count) in dictionaryWord{
        print("\(word):\(count)")
    }
}

