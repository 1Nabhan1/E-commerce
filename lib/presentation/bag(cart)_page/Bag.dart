import 'package:ecommerce_beginning/core/utils/dimensions.dart';
import 'package:ecommerce_beginning/core/utils/header_widget.dart';
import 'package:ecommerce_beginning/presentation/bag(cart)_page/controller/Bag_controller.dart';
import 'package:ecommerce_beginning/presentation/bag(cart)_page/widgets/Listview_builder/Listview_builder.dart';
import 'package:ecommerce_beginning/widgets/app_bar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BagPage extends GetView<BagController> {
  const BagPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbar(
          action: Padding(
        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
        child: Icon(Icons.search),
      )),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
            child: Row(
              children: [
                Headerwidget(
                    txt: 'My Bag',
                    clr: Colors.black,
                    fntwgt: FontWeight.w700,
                    size: 30),
              ],
            ),
          ),
          ListviewBag()
        ]),
      ),
    );
  }
}
