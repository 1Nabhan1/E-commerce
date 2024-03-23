import 'package:ecommerce_beginning/core/constants/image_constants.dart';
import 'package:ecommerce_beginning/core/utils/dimensions.dart';
import 'package:ecommerce_beginning/presentation/shopping_page/controller/Shop_controller.dart';
import 'package:ecommerce_beginning/presentation/shopping_page/widgets/Elevated_button/elevated_button.dart';
import 'package:ecommerce_beginning/presentation/shopping_page/widgets/LIstview_builder_all_cat/Listview_builder.dart';
import 'package:ecommerce_beginning/presentation/shopping_page/widgets/Listview_builder/list_view.dart';
import 'package:ecommerce_beginning/presentation/shopping_page/widgets/Listview_builder1/list_view.dart';
import 'package:ecommerce_beginning/presentation/shopping_page/widgets/Listview_builder2/list_view.dart';
import 'package:ecommerce_beginning/widgets/app_bar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ShoppingPage extends GetView<ShopController> {
  const ShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
          leading: Image.asset(Imageconstants.Apbarback),
          title: 'Categories',
          titlestyle: GoogleFonts.aBeeZee(
              fontWeight: FontWeight.w500, fontSize: 22, color: Colors.black),
          centertitle: true,
          action: const Padding(
            padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
            child: Icon(Icons.search),
          )),
      body: SingleChildScrollView(
        child: Column(children: [
          DefaultTabController(
            length: 3,
            child: Column(
              children: [
                TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorWeight: 3,
                    indicatorColor: Colors.red.shade900,
                    labelStyle: GoogleFonts.aBeeZee(
                        color: Colors.black, fontWeight: FontWeight.w500),
                    tabs: const [
                      Tab(
                        text: 'Women',
                      ),
                      Tab(
                        text: 'Men',
                      ),
                      Tab(
                        text: 'Kids',
                      ),
                    ]),
                Padding(
                  padding: const EdgeInsets.only(
                      left: Dimensions.PADDING_SIZE_DEFAULT,
                      right: Dimensions.PADDING_SIZE_DEFAULT,
                      top: Dimensions.PADDING_SIZE_SMALL),
                  child: Container(
                      height: 110,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.red.shade900,
                          borderRadius: BorderRadius.circular(
                              Dimensions.RADIUS_DEFAULT)),
                      child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('SUMMER SALES',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20)),
                            Text('Up to 50% off',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15))
                          ])),
                ),
                const SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                SizedBox(
                  height: 550,
                  child: TabBarView(children: [
                    Container(
                        child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const Listviewshop(),
                          Elevated_buttonshop(
                            ontap: () {},
                          )
                        ],
                      ),
                    )),
                    Container(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const Listviewshop1(),
                            Elevated_buttonshop(
                              ontap: () {},
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const Listviewshop2(),
                            Elevated_buttonshop(
                              ontap: () {},
                            )
                          ],
                        ),
                      ),
                    )
                  ]),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                      left: Dimensions.PADDING_SIZE_DEFAULT,
                      top: Dimensions.PADDING_SIZE_SMALL),
                  child: Row(
                    children: [
                      Text('Choose category',
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
                const Listview_allcat()
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
