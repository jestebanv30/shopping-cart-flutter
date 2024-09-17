import 'package:carrito_2024/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/cart_controller.dart';
import '../controllers/product_controller.dart';
import 'add_product_page.dart';

class ShoppingPage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping'),
        backgroundColor: Colors.teal,
        actions: [
          Obx(() {
            return IconButton(
              icon: Row(
                children: [
                  Icon(Icons.shopping_bag),
                  SizedBox(width: 5),
                  Text(cartController.itemCount.toString()),
                ],
              ),
              onPressed: () {
                Get.to(() => CartPage());
              },
            );
          }),
        ],
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: productController.products.length,
          itemBuilder: (context, index) {
            final product = productController.products[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundImage:
                    NetworkImage(product.url), // Muestra la imagen del producto
              ),
              title: Text(product.name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Price: \$${product.price.toStringAsFixed(2)}"),
                  Text("Quantity: ${product.quantity}"),
                ],
              ),
              trailing: IconButton(
                icon: Icon(Icons.add_shopping_cart),
                onPressed: () {
                  cartController.addToCart(product);
                },
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        child: Icon(Icons.add),
        onPressed: () {
          Get.to(() =>
              AddProductPage()); // Navega a la página para agregar productos
        },
      ),
    );
  }
}
