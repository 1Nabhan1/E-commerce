import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/dimensions.dart';
import '../../../bag(cart)_page/controller/Bag_controller.dart';
import '../../controller/Favorite_controller.dart';

class Gridviewfav extends StatelessWidget {
  final BagController cartcontrol = Get.put(BagController());
  final FavoriteController favcontrol = Get.put(FavoriteController());

  Gridviewfav({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GridView.builder(
        padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
        shrinkWrap: true,
        itemCount: favcontrol.favoriteProducts.length,
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 300,
            mainAxisSpacing: 10,
            crossAxisSpacing: 20,
            crossAxisCount: 2),
        itemBuilder: (context, index) {
          final product = favcontrol.favoriteProducts[index];
          return Stack(
            children: [
              Center(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        height: 220,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(
                                Dimensions.RADIUS_DEFAULT)),
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(Dimensions.RADIUS_DEFAULT),
                          child: Image.network(
                            product.img,
                            fit: BoxFit.cover,
                            height: 220,
                            width: double.infinity,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: Dimensions.PADDING_SIZE_DEFAULT),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(product.txt),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: Dimensions.PADDING_SIZE_DEFAULT),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "\$${product.price}",
                              style: TextStyle(color: Colors.red.shade900),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: MediaQuery.of(context).size.width * -0.02,
                top: MediaQuery.of(context).size.height * -0.01,
                child: IconButton(
                    onPressed: () {
                      favcontrol.removeFromFavorites(product);
                    },
                    icon: const Icon(Icons.close)),
              ),
              Positioned(
                right: MediaQuery.of(context).size.width * 0.00,
                bottom: MediaQuery.of(context).size.height * 0.07,
                child: Obx(
                  () => Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade300,
                              blurStyle: BlurStyle.normal,
                              spreadRadius: 0.5,
                              offset: const Offset(0, 5),
                              blurRadius: 1.5)
                        ],
                        color: cartcontrol.isAddedtoCart(product)
                            ? Colors.green
                            : Colors.red,
                        borderRadius: BorderRadius.circular(30)),
                    child: Obx(
                      () => IconButton(
                        icon: Icon(
                          cartcontrol.isAddedtoCart(product)
                              ? Icons.done
                              : Icons.shopping_bag,
                          color: cartcontrol.isAddedtoCart(product)
                              ? Colors.white
                              : Colors.white,
                        ),
                        onPressed: () {
                          if (cartcontrol.isAddedtoCart(product)) {
                            cartcontrol.removefromcart(product);
                          } else {
                            cartcontrol.addToCart(product);
                          }
                        },
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
