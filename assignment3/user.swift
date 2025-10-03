
import Foundation

class User{
    let name: String
    let email: String
    private(set) var orderHistory: [Order]=[]
    
    init(name:String, email:String){
        self.name=name
        self.email=email
    }
    
    func placeOrder(from cart: ShoppingCart, address: Address) -> Order {
        let order=Order(from: cart, shippingAddress: address)
        orderHistory.append(order)
        //after completing order cart is cleaned
        cart.clearCart()
        return order
    }
    
    // Computed property for total spent
    var totalSpent: Double {
        return orderHistory.reduce(0){$0+$1.total}
    }
    
}
