import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final String? title;
  final Widget? action;
  final bool? centertitle;
  final TextStyle? titlestyle;

  const CustomAppbar({
    Key? key,
    this.title,
    this.leading,
    this.action,
    this.centertitle,
    this.titlestyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: leading,
      title: Text(title ?? '', style: titlestyle),
      centerTitle: centertitle ?? true,
      actions: action != null ? [action!] : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: const CustomAppbar(
        title: 'Your Title',
        titlestyle:
            TextStyle(color: Colors.red), // Example of customizing title style
      ),
      body: Container(),
    ),
  ));
}
