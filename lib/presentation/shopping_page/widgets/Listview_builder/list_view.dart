import 'package:ecommerce_beginning/data/models/datas.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/dimensions.dart';

class Listviewshop extends StatelessWidget {
  const Listviewshop({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: Models().categories.length,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final categories = Models().categories[index];
        return Padding(
          padding: const EdgeInsets.only(
              right: Dimensions.PADDING_SIZE_DEFAULT,
              left: Dimensions.PADDING_SIZE_DEFAULT,
              bottom: Dimensions.PADDING_SIZE_DEFAULT),
          child: Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius:
                      BorderRadius.circular(Dimensions.RADIUS_DEFAULT)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: Dimensions.PADDING_SIZE_DEFAULT),
                      child: Text(categories.txt ?? '',
                          style: GoogleFonts.aBeeZee(
                              fontWeight: FontWeight.w600, fontSize: 18)),
                    ),
                    Image.asset(categories.img ?? ''),
                  ])),
        );
      },
    );
  }
}
