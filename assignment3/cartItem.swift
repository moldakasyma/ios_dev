import Foundation

struct CartItem{
    let product: Product
    var quantity: Int
    
    var subtotal: Double{
        return product.price*Double(quantity)
    }
    //can change value within struct
    mutating func updateQuantity(_ newQuantity: Int) {
           guard newQuantity > 0 else { return }
           quantity = newQuantity
    }
    
    mutating func increaseQuantity(by amount: Int) {
          guard amount > 0 else { return }
          quantity += amount
    }
    
}
