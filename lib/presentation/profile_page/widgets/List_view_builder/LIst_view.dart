import 'package:flutter/material.dart';

import '../../../../core/utils/dimensions.dart';
import '../../../../data/models/datas.dart';

class Listviewpro extends StatelessWidget {
  const Listviewpro({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: Models().profilelist.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        final Lists = Models().profilelist[index];
        return ListTile(
          contentPadding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
          leading: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(Lists.maintxt,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              Text(
                Lists.subtxt,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          trailing: Icon(Icons.arrow_forward_ios),
        );
      },
    );
  }
}
