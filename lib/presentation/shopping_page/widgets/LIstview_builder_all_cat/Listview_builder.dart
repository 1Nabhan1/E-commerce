import 'package:ecommerce_beginning/core/utils/dimensions.dart';
import 'package:ecommerce_beginning/data/models/datas.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Listview_allcat extends StatelessWidget {
  const Listview_allcat({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: Models().allcategories.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        final allcategory = Models().allcategories[index];
        return Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey.shade300, width: 1))),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: Dimensions.PADDING_SIZE_DEFAULT,
                horizontal: Dimensions.PADDING_SIZE_OVER_LARGE),
            child: Text(allcategory.txt ?? '', style: GoogleFonts.aBeeZee()),
          ),
        );
      },
    );
  }
}
