import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoppingmall/utility/my_constant.dart';
import 'package:shoppingmall/widgets/show_title.dart';

class ShowSignout extends StatelessWidget {
  const ShowSignout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ListTile(
          onTap: () async {
            SharedPreferences preferences =
                await SharedPreferences.getInstance();
            preferences.clear().then(
              (value) => Navigator.pushNamedAndRemoveUntil(
                context,
                MyConstant.routeAuthen,
                (route) => false,
              ),
            );
          },
          leading: Icon(Icons.exit_to_app),
          title: ShowTitle(
            title: 'Sign out',
            textStyle: MyConstant().h4NmRdCl(),
          ),
          subtitle: ShowTitle(
            title: 'sign out and go to authen',
            textStyle: MyConstant().h3NmGrey2Cl(),
          ),
        ),
      ],
    );
  }
}
