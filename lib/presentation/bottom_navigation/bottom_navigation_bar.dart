import 'package:ecommerce_beginning/core/constants/image_constants.dart';
import 'package:ecommerce_beginning/presentation/bag(cart)_page/Bag.dart';
import 'package:ecommerce_beginning/presentation/bottom_navigation/controller/bottom_nav_controller.dart';
import 'package:ecommerce_beginning/presentation/favorite_page/Favorite.dart';
import 'package:ecommerce_beginning/presentation/home_screen/home.dart';
import 'package:ecommerce_beginning/presentation/profile_page/Profile.dart';
import 'package:ecommerce_beginning/presentation/shopping_page/Shopping.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Bottomnavigation extends GetView<BottomnavController> {
  const Bottomnavigation({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> Pages = [
      const Homepage(),
      const ShoppingPage(),
      const BagPage(),
      const FavoritePage(),
      const ProfilePage()
    ];
    return Scaffold(
        body: Obx(() => Pages[controller.selectedIndex.value]),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: true,
              unselectedItemColor: Colors.grey,
              currentIndex: controller.selectedIndex.value,
              onTap: (value) {
                controller.selectedIndex.value = value;
              },
              unselectedIconTheme: const IconThemeData(color: Colors.grey),
              selectedItemColor: Colors.deepOrange,
              selectedIconTheme: const IconThemeData(color: Colors.deepOrange),
              selectedLabelStyle: GoogleFonts.aBeeZee(
                fontWeight: FontWeight.w300,
              ),
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Image.asset(controller.selectedIndex.value == 0
                        ? Imageconstants.Homefill
                        : Imageconstants.Homeout),
                    label: 'Home'),
                BottomNavigationBarItem(
                    icon: Image.asset(controller.selectedIndex.value == 1
                        ? Imageconstants.Shopfill
                        : Imageconstants.Shopout),
                    label: 'Shop'),
                BottomNavigationBarItem(
                    icon: Image.asset(controller.selectedIndex.value == 2
                        ? Imageconstants.Bagfill
                        : Imageconstants.Bagout),
                    label: 'Bag'),
                BottomNavigationBarItem(
                    icon: Image.asset(controller.selectedIndex.value == 3
                        ? Imageconstants.Favfill
                        : Imageconstants.Favout),
                    label: 'Favorite'),
                BottomNavigationBarItem(
                    icon: Image.asset(controller.selectedIndex.value == 4
                        ? Imageconstants.Profill
                        : Imageconstants.Proout),
                    label: 'Profile')
              ]),
        ));
  }
}
