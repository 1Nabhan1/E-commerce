import 'package:ecommerce_beginning/core/constants/image_constants.dart';
import 'package:ecommerce_beginning/presentation/favorite_page/controller/Favorite_controller.dart';
import 'package:ecommerce_beginning/presentation/favorite_page/widgets/Gridview_buider/grid_view.dart';
import 'package:ecommerce_beginning/widgets/app_bar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritePage extends GetView<FavoriteController> {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
          title: 'Favorites',
          leading: Image.asset(Imageconstants.Apbarback),
          centertitle: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Gridviewfav(),
          ],
        ),
      ),
    );
  }
}
