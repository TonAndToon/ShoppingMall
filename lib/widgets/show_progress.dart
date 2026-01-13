import 'package:flutter/material.dart';
import 'package:shoppingmall/utility/my_constant.dart';

class ShowProgress extends StatelessWidget {
  const ShowProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(color: MyConstant.lightColor),
    );
  }
}
