import Foundation

var shoppingList: [String] = []
var isRunning=true
while true {
    print("Do you want to see the menu? (yes/no)")
    if let answer = readLine()?.lowercased() {
        if answer == "yes"{
            print("""
        === Shopping List Manager ===
        1. Add item
        2. Remove item
        3. View list
        4. Exit
        Enter your choice:
        """)
            
            if let choice = readLine() {
                switch choice {
                case "1":
                    print("Enter item to add:")
                    if let item = readLine(), !item.isEmpty {
                        shoppingList.append(item)
                        print("'\(item)' added to the list.")
                    }
                case "2":
                    print("Enter item to remove:")
                    if let item = readLine(), let index = shoppingList.firstIndex(of: item) {
                        shoppingList.remove(at: index)
                        print("'\(item)' removed from the list.")
                    } else {
                        print("Item not found in the list.")
                    }
                case "3":
                    print("=== Current Shopping List ===")
                    if shoppingList.isEmpty {
                        print("The list is empty.")
                    } else {
                        for (index, item) in shoppingList.enumerated() {
                            print("\(index + 1). \(item)")
                        }
                    }
                case "4":
                    isRunning = false
                    print("Exiting Shopping List Manager. Goodbye!")
                default:
                    print("Invalid choice, please try again.")
                }
            }
        }
        else if answer == "no" {
            print("Okay,bye.")
            break
        } else {
            print("Invalid input, please type 'yes' or 'no'.")
        }
    }
}

