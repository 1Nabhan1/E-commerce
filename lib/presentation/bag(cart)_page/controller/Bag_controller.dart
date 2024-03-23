import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../home_screen/models/model_class.dart';

class BagController extends GetxController {
  final RxList<Products> cartProducts = <Products>[].obs;
  final box = GetStorage();
  var counter = 0.obs;

  void increment(Products product) {
    if (product.counter < 9) {
      product.counter++;
      update();
    }
  }

  void decrement(Products product) {
    if (product.counter > 0) {
      product.counter--;
      update();
    }
  }

  @override
  void onInit() {
    List<dynamic>? storedProducts = box.read('cartProducts');
    if (storedProducts != null) {
      cartProducts.assignAll(
          storedProducts.map((product) => Products.fromJson(product)).toList());
    }
    super.onInit();
  }

  // Method to add a product to the cart
  void addToCart(Products product) {
    if (!cartProducts.contains(product)) {
      cartProducts.add(product);
      box.write('cartProducts',
          cartProducts.map((product) => product.toJson()).toList());
      Get.snackbar(
        'Added to Cart',
        'Item added to Cart successfully',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
    }
  }

  void removefromcart(Products product) {
    if (cartProducts.contains(product)) {
      cartProducts.remove(product);
      box.write('cartProducts',
          cartProducts.map((product) => product.toJson()).toList());
      update();
      Get.snackbar(
        'Removed from Cart',
        'Item removed from Cart successfully',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
    }
  }

  bool isAddedtoCart(Products product) {
    return cartProducts.contains(product);
  }
}
