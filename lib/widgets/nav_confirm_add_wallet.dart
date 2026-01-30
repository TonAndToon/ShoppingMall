import 'package:flutter/material.dart';
import 'package:shoppingmall/utility/my_constant.dart';
import 'package:shoppingmall/widgets/show_title.dart';

class NavConfirmAddWallet extends StatelessWidget {
  const NavConfirmAddWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: InkWell(
        onTap: () => Navigator.pushNamedAndRemoveUntil(
          context,
          MyConstant.routeConfrimAddWallet,
          (route) => false,
        ),
        child: Card(
          color: MyConstant.primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.fingerprint_outlined,
                  color: MyConstant.whColor,
                  size: 51,
                ),
                ShowTitle(title: 'confirm', textStyle: MyConstant().h4NmWCl()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
