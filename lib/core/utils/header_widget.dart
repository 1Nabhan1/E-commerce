import 'package:flutter/cupertino.dart';

class Headerwidget extends StatelessWidget {
  final String txt;
  final Color clr;
  final FontWeight fntwgt;
  final double size;

  const Headerwidget(
      {super.key,
      required this.txt,
      required this.clr,
      required this.fntwgt,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(
        color: clr,
        fontWeight: fntwgt,
        fontSize: size,
      ),
    );
  }
}
