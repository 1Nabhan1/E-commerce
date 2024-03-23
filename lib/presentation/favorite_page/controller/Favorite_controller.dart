import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../home_screen/models/model_class.dart';

class FavoriteController extends GetxController {
  final RxList<Products> favoriteProducts = <Products>[].obs;
  final box = GetStorage();

  @override
  void onInit() {
    List<dynamic>? storedProducts = box.read('favoriteProducts');
    if (storedProducts != null) {
      favoriteProducts.assignAll(
          storedProducts.map((product) => Products.fromJson(product)).toList());
    }
    super.onInit();
  }

  void addToFavorites(Products product) {
    if (!favoriteProducts.contains(product)) {
      favoriteProducts.add(product);
      box.write('favoriteProducts',
          favoriteProducts.map((product) => product.toJson()).toList());
      Get.snackbar(
        'Added to Favorites',
        'Item added to favorites successfully',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
    }
  }

  void removeFromFavorites(Products product) {
    if (favoriteProducts.contains(product)) {
      favoriteProducts.remove(product);
      box.write('favoriteProducts',
          favoriteProducts.map((product) => product.toJson()).toList());
      update();
      Get.snackbar(
        'Removed from Favorites',
        'Item removed from favorites successfully',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
    }
  }

  bool isFavorite(Products product) {
    return favoriteProducts.contains(product);
  }
}
