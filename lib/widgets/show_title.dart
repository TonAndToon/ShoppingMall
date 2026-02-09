import 'package:flutter/material.dart';
import 'package:shoppingmall/utility/my_constant.dart';

class ShowTitle extends StatelessWidget {
  final String title;
  final TextStyle textStyle;
  const ShowTitle({super.key, required this.title, required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: textStyle == null ? MyConstant().h5BBkCl() : textStyle,
    );
  }
}
