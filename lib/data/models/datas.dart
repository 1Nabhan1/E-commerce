import 'package:ecommerce_beginning/core/constants/image_constants.dart';
import 'package:get/get.dart';

import '../../presentation/home_screen/models/model_class.dart';
import '../../presentation/profile_page/models/Model_class.dart';
import '../../presentation/shopping_page/models/model_class.dart';

class Models {
  final List<Products> product = [
    Products(
      img:
          'https://avatars.mds.yandex.net/i?id=51b796db05dcfdcc35454f35de93ee3c234b71da-12460761-images-thumbs&n=13',
      txt: 'Formal',
      price: 12,
      str_rat: 1,
      rew_count: 180,
      counter: 1.obs,
    ),
    Products(
      img:
          'https://avatars.mds.yandex.net/i?id=7e2875a7de07b512f6fce68e2ba3ad883f64d8e0-9070589-images-thumbs&n=13',
      txt: 'Executive',
      price: 22,
      str_rat: 4,
      rew_count: 280,
      counter: 1.obs,
    ),
    Products(
      img:
          'https://avatars.mds.yandex.net/i?id=677b3552e2bc8c8b6ab0b1839b4fef1426dd2f95-10637415-images-thumbs&n=13',
      txt: 'Casual',
      price: 18,
      str_rat: 2,
      rew_count: 140,
      counter: 1.obs,
    ),
    Products(
      img:
          'https://avatars.mds.yandex.net/i?id=817e6fb529e2ac6c0516e180308c27e7d0961035-10814708-images-thumbs&n=13',
      txt: 'Minimalist',
      price: 25,
      str_rat: 4,
      rew_count: 134,
      counter: 1.obs,
    ),
    Products(
      img:
          'https://avatars.mds.yandex.net/i?id=37f82949df12c4cd3898320b5fba437f7f997532-5220398-images-thumbs&n=13',
      txt: 'Excessive',
      price: 20,
      str_rat: 3,
      rew_count: 249,
      counter: 1.obs,
    ),
  ];
  final List<Products> product1 = [
    Products(
        rew_count: 210,
        img:
            'https://images.bewakoof.com/uploads/grid/app/maroon-t-shirt-with-blue-jeans-bewakoof-blog-2-1604989073.jpg',
        txt: 'T-shirt casual',
        price: 20,
        str_rat: 2,
        counter: 1.obs),
    Products(
        rew_count: 310,
        img:
            'https://images.bewakoof.com/uploads/grid/app/casual-outfits-for-men-bewakoof-blog-9-1615892381.jpg',
        txt: '8 Awe casual',
        price: 16,
        str_rat: 5,
        counter: 1.obs),
    Products(
        rew_count: 245,
        img:
            'https://i.pinimg.com/236x/71/f9/5e/71f95e01f37517df5f04be662f1890a1.jpg',
        txt: 'Fashion casual',
        price: 32,
        str_rat: 3,
        counter: 1.obs),
    Products(
        rew_count: 355,
        img:
            'https://images.bewakoof.com/uploads/grid/app/casual-outfits-for-men-bewakoof-blog-11-1615892382.jpg',
        txt: 'Mens wear',
        price: 13,
        str_rat: 3,
        counter: 1.obs),
    Products(
        rew_count: 655,
        img:
            'https://www.shutterstock.com/image-photo/handsome-man-classik-checked-suit-260nw-1907885584.jpg',
        txt: 'plain',
        price: 15,
        str_rat: 4,
        counter: 1.obs),
  ];
  final List<Categories> categories = [
    Categories(img: Imageconstants.category, txt: 'New'),
    Categories(img: Imageconstants.category1, txt: 'Clothes'),
    Categories(img: Imageconstants.category2, txt: 'Shoes'),
    Categories(img: Imageconstants.category3, txt: 'Accessories'),
  ];
  final List<Categories> allcategories = [
    Categories(
      txt: 'Tops',
    ),
    Categories(
      txt: 'Shirts & Blouses',
    ),
    Categories(
      txt: 'Cardigans & Sweaters',
    ),
    Categories(
      txt: 'Nightwear',
    ),
    Categories(
      txt: 'Blazers',
    ),
    Categories(
      txt: 'Outerwear',
    ),
    Categories(
      txt: 'Pants',
    ),
    Categories(
      txt: 'Jeans',
    ),
    Categories(
      txt: 'Shorts',
    ),
    Categories(
      txt: 'Skirts',
    ),
    Categories(
      txt: 'Dresses',
    ),
  ];
  final List<ProfileList> profilelist = [
    ProfileList(maintxt: 'My orders', subtxt: 'Your orders'),
    ProfileList(maintxt: 'Shipping address', subtxt: 'Add your address'),
    ProfileList(maintxt: 'Payment method', subtxt: 'Add your payment method'),
    ProfileList(maintxt: 'Promocodes', subtxt: 'You have special promocodes'),
    ProfileList(maintxt: 'My reviews', subtxt: 'Review your items'),
    ProfileList(maintxt: 'Settings', subtxt: 'Notifications,Password')
  ];
}
