# ios_dev
Assignment 3-the assignment let's us understand difference between Struct and Class
1. **Why did you choose class for ShoppingCart?**
   Shopping Cart was implemented as **class** because it has shared mutable state. In real cases, app need access to update the same cart multiple times. If one function add a item, the changes should be seen immeadiately. Class created copy of reference and refer to the same object. Therefore, changes will affect all references.
2. **Why did you choose struct for Product and Order?**
   **Product** represent a name, price and description. Since, they are copyable, copy should not affect other products. Therefore, by using struct we will not accidently share changes.
   **Order** should not be changes once it is made. Using *let* properties ensures the order cannot be nutated after creation.
3. **Explain one example where reference semantics matter in your code**
   ```let cart1 = ShoppingCart()
      let cart2 = cart1
      cart2.addItem(product: laptop, quantity: 1)
      print(cart1.itemCount) // 1, because both point to the same object
   ```
4. **Explain one example where value semantics matter in your code**

   ```
   var item1 = CartItem(product: book, quantity: 1)
   var item2 = item1 // copy
   item2.updateQuantity(5)
   print(item1.quantity) // 1
   print(item2.quantity) // 5
   ```
5. **What challenges did you face and how did you solve them?**
   Updating CartItem quantities inside the ShoppingCart array required accessing items by index, because structs are value types. 
