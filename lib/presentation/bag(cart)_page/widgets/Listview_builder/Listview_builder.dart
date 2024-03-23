import 'package:ecommerce_beginning/presentation/bag(cart)_page/controller/Bag_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/dimensions.dart';

class ListviewBag extends StatelessWidget {
  const ListviewBag({super.key});

  @override
  Widget build(BuildContext context) {
    final BagController bagController = Get.put(BagController());
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: bagController.cartProducts.length,
      itemBuilder: (context, index) {
        final product = bagController.cartProducts[index];
        return Padding(
          padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
          child: Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade300,
                    spreadRadius: 0.5,
                    blurRadius: 0.5,
                    offset: const Offset(1, 3))
              ],
              borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT),
              color: Colors.grey.shade100,
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 130,
                    height: double.infinity,
                    child: Image.network(
                      product.img,
                      width: 130,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.txt,
                          style: GoogleFonts.aBeeZee(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        Obx(
                          () => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          spreadRadius: 1,
                                          blurStyle: BlurStyle.normal,
                                          color: Colors.grey.shade200,
                                          blurRadius: 1,
                                          offset: Offset(1, 4))
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30)),
                                child: IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () =>
                                      bagController.decrement(product),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal:
                                        Dimensions.PADDING_SIZE_DEFAULT),
                                child: Text(
                                  '${product.counter}',
                                  // Access counter value from the controller
                                  style: TextStyle(fontSize: 24.0),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          spreadRadius: 1,
                                          blurStyle: BlurStyle.normal,
                                          color: Colors.grey.shade200,
                                          blurRadius: 1,
                                          offset: Offset(1, 4))
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30)),
                                child: IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () =>
                                      bagController.increment(product),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.more_vert_outlined, color: Colors.grey),
                        Text(
                          "${product.price}\$",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        )
                      ],
                    ),
                  )
                ]),
          ),
        );
      },
    );
  }
}
