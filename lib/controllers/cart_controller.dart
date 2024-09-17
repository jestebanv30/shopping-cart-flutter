import 'package:carrito_2024/models/product.dart';
import 'package:flutter/material.dart'; // Para usar Colors y otros widgets
import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;

  // Método para añadir al carrito verificando la cantidad disponible
  void addToCart(Product product) {
    var existingProduct =
        cartItems.firstWhereOrNull((item) => item.name == product.name);

    if (existingProduct != null) {
      if (existingProduct.quantity < product.quantity) {
        existingProduct.quantity +=
            1; // Incrementa la cantidad si hay stock disponible
      } else {
        Get.snackbar(
          'Stock Limit',
          'No puedes añadir más de ${product.quantity} unidades de este producto',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } else {
      cartItems.add(Product(product.name, product.price, product.url,
          1)); // Añade 1 unidad inicialmente
    }
    cartItems.refresh();
  }

  // Método para remover del carrito
  void removeFromCart(Product product) {
    var existingProduct =
        cartItems.firstWhereOrNull((item) => item.name == product.name);

    if (existingProduct != null && existingProduct.quantity > 1) {
      existingProduct.quantity -= 1; // Decrementa la cantidad
    } else {
      cartItems.remove(existingProduct); // Remueve si la cantidad llega a 0
    }
    cartItems.refresh();
  }

  int get itemCount => cartItems.fold(
      0, (count, item) => count + item.quantity); // Contar todos los ítems

  // Calcular el precio total del carrito
  double get totalPrice =>
      cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
}
