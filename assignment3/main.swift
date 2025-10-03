import Foundation


guard let laptop = Product(id: "p1", name: "Laptop", price: 747990.99, category: .electronic, description: "MacBook Air 13 дюймов с чипом M4 отлично подходит для работы и развлечений.") else { fatalError("Product invalid") }
guard let book = Product(id: "p2", name: "Proud and Prejudiced", price: 4590.99, category: .book, description: "Pride and Prejudice is the second published novel by English author Jane Austen") else { fatalError() }
guard let headphones = Product(id: "p3", name: "Airpods 3", price: 74990.99, category: .electronic, description: "Всесторонне развитый звук") else { fatalError() }

        
let cart=ShoppingCart()
cart.addItem(product: laptop, quantity: 1)
cart.addItem(product: book, quantity: 2)
cart.addItem(product: laptop, quantity: 1)


        
print("Subtotal: \(cart.subTotal)")
print("Item count: \(cart.itemCount)")
        

cart.discountCode="Save20"
print("Total with discount: \(cart.total)")

cart.removeItem(productId: "p2")
print("After removing item from cart: \(cart.itemCount)")

func modifyCart(_ cart: ShoppingCart) {
    cart.addItem(product: headphones, quantity: 1)
}
modifyCart(cart)
print("After modifyCart call: itemCount = \(cart.itemCount)")

var item1 = CartItem(product: laptop, quantity: 1)
var item2 = item1
item2.updateQuantity(3)
print("item1 quantity = \(item1.quantity), item2 quantity = \(item2.quantity)")

let user = User(name: "Aiya", email: "aiyam@example.com")
let address=Address(street: "Abay", city: "Almaty", zipCode: "Za5200", country: "Kazakhstan")
//let order=Order(from: cart, shippingAddress: address)
let order = user.placeOrder(from: cart, address: address)
print("Order total: \(order.total)")

print("User spent so far: \(user.totalSpent)")

cart.clearCart()

print("Ordered items count:\(order.itemCount)")
print("Cart items count:\(cart.itemCount)")
