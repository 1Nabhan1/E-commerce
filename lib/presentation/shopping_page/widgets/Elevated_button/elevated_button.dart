import 'package:flutter/material.dart';

class Elevated_buttonshop extends StatelessWidget {
  final void Function()? ontap;

  const Elevated_buttonshop({super.key, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(370, 60), backgroundColor: Colors.red),
        onPressed: ontap,
        child: const Text(
          'VIEW ALL ITEMS',
          style: TextStyle(color: Colors.white),
        ));
  }
}
