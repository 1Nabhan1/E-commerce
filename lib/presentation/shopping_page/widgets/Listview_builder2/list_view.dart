import 'package:flutter/material.dart';

import '../../../../core/utils/dimensions.dart';

class Listviewshop2 extends StatelessWidget {
  const Listviewshop2({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 4,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(
              right: Dimensions.PADDING_SIZE_DEFAULT,
              left: Dimensions.PADDING_SIZE_DEFAULT,
              bottom: Dimensions.PADDING_SIZE_DEFAULT),
          child: Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.red.shade900,
                  borderRadius:
                      BorderRadius.circular(Dimensions.RADIUS_DEFAULT))),
        );
      },
    );
  }
}
