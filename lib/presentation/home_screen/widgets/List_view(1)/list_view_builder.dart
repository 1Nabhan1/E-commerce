import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/font_size.dart';
import '../../../../data/models/datas.dart';
import '../../../../widgets/Star_rating/Star_rating.dart';
import '../../../favorite_page/controller/Favorite_controller.dart';

class Listviewhome1 extends StatelessWidget {
  const Listviewhome1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final FavoriteController favoriteController = Get.put(FavoriteController());
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: Models().product1.length,
      itemBuilder: (context, index) {
        final product = Models().product1[index];
        return Padding(
          padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(Dimensions.RADIUS_DEFAULT),
                  color: Colors.white,
                ),
                width: 150.w,
                height: 225.h,
                child: Column(children: [
                  Container(
                    height: 210,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(Dimensions.RADIUS_DEFAULT),
                      color: Colors.grey.shade300,
                    ),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(Dimensions.RADIUS_DEFAULT),
                      child: Image.network(
                        product.img,
                        fit: BoxFit.cover,
                        height: 210,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                StarRating(rating: product.str_rat),
                                Text(
                                  "(${product.rew_count})",
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                )
                              ],
                            ),
                            Text(
                              product.txt,
                              style: Fontstyle.Default_txt,
                            ),
                            Text(
                              "\$${product.price}",
                              style: TextStyle(color: Colors.red.shade900),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ]),
              ),
              Positioned(
                right: MediaQuery.of(context).size.width * 0.0,
                bottom: MediaQuery.of(context).size.height * 0.07,
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade300,
                            blurStyle: BlurStyle.normal,
                            spreadRadius: 0.5,
                            offset: const Offset(0, 5),
                            blurRadius: 1.5)
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: Obx(
                    () => IconButton(
                      icon: Icon(
                          favoriteController.isFavorite(product)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: favoriteController.isFavorite(product)
                              ? Colors.red
                              : Colors.grey),
                      onPressed: () {
                        if (favoriteController.isFavorite(product)) {
                          favoriteController.removeFromFavorites(product);
                        } else {
                          favoriteController.addToFavorites(product);
                        }
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
