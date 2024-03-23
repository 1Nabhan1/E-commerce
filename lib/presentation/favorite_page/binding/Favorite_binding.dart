import 'package:ecommerce_beginning/presentation/favorite_page/controller/Favorite_controller.dart';
import 'package:get/get.dart';

class Favoritebinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavoriteController>(() => FavoriteController());
  }
}
