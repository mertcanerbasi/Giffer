import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({Key? key})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);
  @override
  final Size preferredSize;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Giffer',
      ),
      centerTitle: true,
      backgroundColor: Colors.black,
    );
  }
}
