import 'package:get/get.dart';

import '../models/product.dart';

class ProductController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    // Inicializar algunos productos de ejemplo
    products.addAll([
      Product(
          'Supra 1995',
          500000,
          'https://hips.hearstapps.com/hmg-prod/images/the-fast-and-the-furious-toyota-supra-subasta-1624180933.jpg',
          5),
      Product(
          'Hilux 2024',
          300000,
          'https://autoamerica.com.co/wp-content/uploads/2020/08/HILUX-DC-4X4-DIESEL-2.4-MT-SUPER-BLANCO-hotspot.jpg',
          3),
      Product(
          'Corolla 2024',
          200000,
          'https://yokomotor.com.co/toyota/wp-content/uploads/sites/2/2024/03/yokomotor-toyota-corolla-xei-hb-blanco-perlado.webp',
          10),
      Product(
          'Honda Civic 2021',
          100000,
          'https://loscoches.com/wp-content/uploads/2022/01/honda-civic-type-r-deportivo.jpg',
          1),
    ]);
    super.onInit();
  }

  void addProduct(String name, double price, String url, int quantity) {
    products.add(Product(name, price, url, quantity));
    products.refresh();
  }
}
