import 'package:flutter/material.dart';
import 'package:shoppingmall/models/user_model.dart';
import 'package:shoppingmall/utility/my_constant.dart';
import 'package:shoppingmall/widgets/show_title.dart';

class ShopManageSeller extends StatefulWidget {
  final UserModel userModel;
  const ShopManageSeller({super.key, required this.userModel});

  @override
  State<ShopManageSeller> createState() => _ShopManageSellerState();
}

class _ShopManageSellerState extends State<ShopManageSeller> {
  UserModel? userModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userModel = widget.userModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShowTitle(title: 'Name shop', textStyle: MyConstant().h4BPmrCl()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: constraints.maxWidth * 0.6,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ShowTitle(
                      title: userModel!.name,
                      textStyle: MyConstant().h3BPmrCl(),
                    ),
                  ),
                ),
              ],
            ),
            ShowTitle(title: 'Address', textStyle: MyConstant().h4BPmrCl()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: constraints.maxWidth * 0.6,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ShowTitle(
                      title: userModel!.address,
                      textStyle: MyConstant().h3BPmrCl(),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
