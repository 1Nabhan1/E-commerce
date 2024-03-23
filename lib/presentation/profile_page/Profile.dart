import 'package:ecommerce_beginning/core/utils/dimensions.dart';
import 'package:ecommerce_beginning/core/utils/header_widget.dart';
import 'package:ecommerce_beginning/presentation/profile_page/controller/Profile_controller.dart';
import 'package:ecommerce_beginning/presentation/profile_page/widgets/List_view_builder/LIst_view.dart';
import 'package:ecommerce_beginning/presentation/profile_page/widgets/custom_row/Row.dart';
import 'package:ecommerce_beginning/widgets/app_bar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppbar(
            action: Padding(
          padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
          child: Icon(Icons.search),
        )),
        body: SingleChildScrollView(
          child: Column(children: [
            const Padding(
              padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
              child: Row(
                children: [
                  Headerwidget(
                      txt: 'My profile',
                      clr: Colors.black,
                      fntwgt: FontWeight.w700,
                      size: 30),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                child: Customrow()),
            Padding(
              padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
              child: Listviewpro(),
            )
          ]),
        ));
  }
}
