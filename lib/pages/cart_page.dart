
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/components/my_cart_tile.dart';
import 'package:food_delivery_app/models/restaurent.dart';
import 'package:food_delivery_app/pages/payment_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurent>(
      builder: (context, restaurent, child){
        //cart 
        final userCart = restaurent.cart;

        //scaffold UI
        return Scaffold(
          appBar: AppBar(
            title: Text("Cart"),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              //clear cart button
              IconButton(
                onPressed: (){
                  showDialog(
                    context: context, 
                    builder: (context) => AlertDialog(
                      title: Text("Are you sure you want to clear the cart?"),
                      actions: [
                        //cancel button
                        TextButton(
                          onPressed: () => Navigator.pop(context), 
                          child: Text("Cancel"),
                          ),

                          //yes button
                          TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            restaurent.clearCart();
                          }, 
                          child: Text("Yes"),
                          ),
                      ],
                    ),
                    );
                }, 
                icon: Icon(Icons.delete),
                )
            ],
          ),

          body: Column(
            children: [

              //list of cart
              Expanded(
                child: Column(
                  children: [
                    userCart.isEmpty 
                    ? Expanded(
                      child: Center(
                        child: Text("Cart is empty.."),
                        ),
                        )
                    : 
                    Expanded(
                      child: ListView.builder(
                        itemCount: userCart.length,
                        itemBuilder: (context, index){
                          //get individual cart item
                          final cartItem = userCart[index];
                
                          //return cart tile UI
                          return MyCartTile(cartItem: cartItem);
                        }
                      ),
                    ),
                  ],
                ),
              ),

              //button to pay
              MyButton(
                ontap: () => Navigator.push(
                  context, MaterialPageRoute(
                    builder: (context) => PaymentPage(), 
                  ),
                  ), 
                text: "Go to checkout",
                ),

                SizedBox(height: 25),
            ],
          ),
        );
      },
    );
  }
}