import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';

class CartPage extends StatelessWidget {
  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Colors.teal,
      ),
      body: Obx(() {
        return cartController.cartItems.isEmpty
            ? Center(child: Text('Your cart is empty'))
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartController.cartItems.length,
                      itemBuilder: (context, index) {
                        final cartItem = cartController.cartItems[index];
                        return ListTile(
                          leading: CircleAvatar(
                            child:
                                Image.network(cartItem.url), // Mostrar imagen
                          ),
                          title: Text(cartItem.name),
                          subtitle: Text(
                            "\$${cartItem.price} x ${cartItem.quantity} = \$${cartItem.price * cartItem.quantity}",
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.remove_shopping_cart),
                            onPressed: () {
                              cartController.removeFromCart(cartItem);
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Total: \$${cartController.totalPrice}",
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ],
              );
      }),
    );
  }
}
