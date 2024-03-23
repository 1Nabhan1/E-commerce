import 'package:ecommerce_beginning/presentation/bag(cart)_page/Bag.dart';
import 'package:ecommerce_beginning/presentation/bag(cart)_page/binding/Bag_binding.dart';
import 'package:ecommerce_beginning/presentation/bottom_navigation/binding/bottom_nav_binding.dart';
import 'package:ecommerce_beginning/presentation/favorite_page/Favorite.dart';
import 'package:ecommerce_beginning/presentation/favorite_page/binding/Favorite_binding.dart';
import 'package:ecommerce_beginning/presentation/forgot_password/binding/forgot_binding.dart';
import 'package:ecommerce_beginning/presentation/forgot_password/forgot_password.dart';
import 'package:ecommerce_beginning/presentation/home_screen/binding/home_binding.dart';
import 'package:ecommerce_beginning/presentation/home_screen/home.dart';
import 'package:ecommerce_beginning/presentation/log_in_screen/binding/log_in_binding.dart';
import 'package:ecommerce_beginning/presentation/log_in_screen/log_in.dart';
import 'package:ecommerce_beginning/presentation/log_sign_page/binding/log_sign_binding.dart';
import 'package:ecommerce_beginning/presentation/sign_up_screen/binding/sign_up_binding.dart';
import 'package:ecommerce_beginning/presentation/sign_up_screen/sign_up.dart';
import 'package:ecommerce_beginning/presentation/splash_screen/binding/splash_binnding.dart';
import 'package:ecommerce_beginning/routes/app_routes.dart';
import 'package:get/get.dart';

import '../presentation/bottom_navigation/bottom_navigation_bar.dart';
import '../presentation/log_sign_page/log_sign.dart';
import '../presentation/splash_screen/splash.dart';

class Apppages {
  static var List = [
    GetPage(
        name: AppRoutes.Splash,
        page: () => const Splash(),
        binding: Splashbinding()),
    GetPage(
      name: AppRoutes.LogSign,
      page: () => const SignLog(),
      binding: LogSignbinding(),
    ),
    GetPage(
        name: AppRoutes.SignUp,
        page: () => const SignUp(),
        binding: Signbinding()),
    GetPage(
        name: AppRoutes.LogIn,
        page: () => const LogIn(),
        binding: Logbinding()),
    GetPage(
        name: AppRoutes.Forgotpass,
        page: () => const Forgotpassword(),
        binding: ForgotBinding()),
    GetPage(
        name: AppRoutes.Bottomnav,
        page: () => const Bottomnavigation(),
        binding: Bottomnavbinding()),
    GetPage(
        name: AppRoutes.HomePage,
        page: () => const Homepage(),
        binding: Homebinding()),
    GetPage(
        name: AppRoutes.FavoritePage,
        page: () => const FavoritePage(),
        binding: Favoritebinding()),
    GetPage(
        name: AppRoutes.CartPage,
        page: () => const BagPage(),
        binding: Bagbinding()),
    // GetPage(
    //     name: AppRoutes.Otpregister,
    //     page: () => Otpscreen(
    //           verificationid: '',
    //         ),
    //     binding: otpbinding())
  ];
}
