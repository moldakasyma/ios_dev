
import Foundation

var studentScore: [String:Int]=[:]

print("Enter number of students:")
if let input=readLine(), let count=Int(input){
    for i in 1...count{
        print("Enter student name:")
        guard let name=readLine(), !name.isEmpty else{
                print("Invalid name, try again")
                continue
        }
        print("Enter score of the Student:")
        guard let score=readLine(), let inputScore=Int(score) else{
                print("Invalud score, try again")
                continue
        }
        studentScore[name]=inputScore
    }

                
    }
if !studentScore.isEmpty{
    let total=studentScore.values.reduce(0,+)
    let average=Double(total)/Double(studentScore.count)
    
    
    if let highest = studentScore.max(by: { $0.value < $1.value }),
       let lowest = studentScore.min(by: { $0.value < $1.value }) {
        print("\nHighest: \(highest.key) with \(highest.value)")
        print("Lowest: \(lowest.key) with \(lowest.value)")
    }
        
    print("\nStudent Results:")
    for (name, score) in studentScore {
    if Double(score) >= average {
    print("\(name): \(score) (above or equal to average)")
    } else {
    print("\(name): \(score) (below average)")
    }
}
                                          
print("\nClass average: \(average)")
} else {
print("No student data entered.")
}
    


    


