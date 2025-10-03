import Foundation
//With struct copy of data is created
struct Product{
    let id: String
    let name: String
    let price: Double
    let category: Category
    let description: String
    
    enum Category{
        case electronic, clothing, book, food, beauty
    }
    
    var displayPrice: String{
        let priceForm=NumberFormatter()
        priceForm.numberStyle = .currency
        priceForm.locale = Locale.current
        //format price with function if it fails(??) format price manually
        return priceForm.string(from: NSNumber(value: price)) ?? String(format: "$%.2f", price)
        
    }
    //essential for preparing data
    init?(id:String, name: String, price: Double, category: Category, description: String){
        guard price>0 else{
            return nil
            
        }
        self.id=id
        self.name=name
        self.price=price
        self.category=category
        self.description=description
    }
}

