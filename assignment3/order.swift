
import Foundation

struct Order{
    let orderId: String
    let items: [CartItem]
    let subtotal: Double
    let discountAmount: Double
    let total: Double
    let timestamp: Data
    let shippingAddress: Address
    
    init(from cart: ShoppingCart, shippingAddress: Address) {
        //random string
        self.orderId=UUID().uuidString
        self.items=cart.items
        self.subtotal=cart.subTotal
        self.discountAmount=cart.discountAmount
        self.total=cart.total
        self.timestamp=Data()
        self.shippingAddress=shippingAddress
    }
    

    var itemCount: Int {
        return items.reduce(0){$0+$1.quantity}
        
    }
}
