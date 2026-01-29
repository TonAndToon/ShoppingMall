import 'package:flutter/material.dart';
import 'package:shoppingmall/utility/my_constant.dart';
import 'package:shoppingmall/widgets/show_title.dart';

class NavConfirmAddWallet extends StatelessWidget {
  const NavConfirmAddWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      // height: 80,
      child: InkWell(
        onTap: () => Navigator.pushNamedAndRemoveUntil(
          context,
          MyConstant.routeConfrimAddWallet,
          (route) => false,
        ),
        child: Card(
          color: MyConstant.lightColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/bill.png'),
                ShowTitle(title: 'Confirm', textStyle: MyConstant().h5NmWCl()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
