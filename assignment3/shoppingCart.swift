import Foundation
//copy reference, both variable point to the same object
class ShoppingCart{
    private(set) var items: [CartItem]=[]
    var discountCode: String? = nil
    
    init(){
        
    }
    
    func addItem(product: Product, quantity: Int=1){
        guard quantity>0 else{
            return
        }
        if let index=items.firstIndex(where:{$0.product.id==product.id}){
            items[index].increaseQuantity(by: quantity)
        }
        else{
            items.append(CartItem(product: product, quantity: quantity))
        }
    }
    
    func removeItem(productId: String){
        items.removeAll{$0.product.id==productId}
    }
    
    func updateItemQuantity(productId: String, quantity: Int) {
        if quantity<0{
            removeItem(productId: productId)
            return
        }
        if let idx=items.firstIndex(where: {$0.product.id==productId}){
            items[idx].updateQuantity(quantity)
        }
        
    }
    
    func clearCart(){
        items.removeAll()
    }
    //combine all elements of sequence into one element
    var subTotal: Double{
        return items.reduce(0){$0+$1.subtotal}
        
    }
    var discountAmount: Double {
        guard let code = discountCode else{
            return 0
        }
        switch code{
        case "Save10" : return subTotal*0.1
        case "Save20" : return subTotal*0.2
        default: return 0
        }
    }
    
    var total: Double {
        return subTotal-discountAmount
    }
    
    var itemCount: Int{
        return items.reduce(0){$0+$1.quantity}
    }
    
    var isEmpty: Bool{
        return items.isEmpty
    }
}

