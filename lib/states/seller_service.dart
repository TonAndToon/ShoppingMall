import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoppingmall/bodys/shop_manage_seller.dart';
import 'package:shoppingmall/bodys/show_order_seller.dart';
import 'package:shoppingmall/bodys/show_product_seller.dart';
import 'package:shoppingmall/models/user_model.dart';
import 'package:shoppingmall/utility/my_constant.dart';
import 'package:shoppingmall/widgets/show_progress.dart';
import 'package:shoppingmall/widgets/show_signout.dart';
import 'package:shoppingmall/widgets/show_title.dart';

class SellerService extends StatefulWidget {
  const SellerService({super.key});

  @override
  State<SellerService> createState() => _SellerServiceState();
}

class _SellerServiceState extends State<SellerService> {
  List<Widget> widgets = [];

  int indexWidget = 0;
  UserModel? userModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findUserModel();
  }

  Future<Null> findUserModel() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String id = preferences.getString('id')!;
    print('id Logined ==>> $id');
    String apiGetUserWhereId =
        '${MyConstant.domain}/shoppingmall/getUserWhereId.php?isAdd=true&id=$id';
    await Dio().get(apiGetUserWhereId).then((value) {
      print('#### value ==>> $value');

      for (var item in json.decode(value.data)) {
        setState(() {
          userModel = UserModel.fromMap(item);
          // print('#### name logined = ${userModel!.name}');
          widgets.add(ShowOrderSeller());
          widgets.add(ShopManageSeller(userModel: userModel!));
          widgets.add(ShowProductSeller());
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyConstant.primaryColor,
        title: Text('Seller', style: MyConstant().h5NmWCl()),
        iconTheme: IconThemeData(color: MyConstant.whColor),
      ),
      drawer: widgets.length == 0
          ? SizedBox()
          : Drawer(
              child: Stack(
                children: [
                  ShowSignout(),
                  Column(
                    children: [
                      buildHead(),
                      menuShowOrder(),
                      menuShopManage(),
                      menuShowProduct(),
                    ],
                  ),
                ],
              ),
            ),
      body: widgets.length == 0 ? ShowProgress() : widgets[indexWidget],
    );
  }

  UserAccountsDrawerHeader buildHead() {
    return UserAccountsDrawerHeader(
      otherAccountsPictures: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.person, color: MyConstant.whColor, size: 32),
          tooltip: 'Edit shop',
        ),
      ],
      currentAccountPicture: Container(
        margin: EdgeInsets.all(4),
        child: CircleAvatar(
          backgroundImage: NetworkImage(
            '${MyConstant.domain}${userModel?.avatar}',
          ),
        ),
      ),
      accountName: Text(userModel == null ? 'Name ?' : userModel!.name),
      accountEmail: Text(userModel == null ? 'Type ?' : userModel!.type),
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [MyConstant.whColor, MyConstant.primaryColor],
          center: Alignment(-0.65, -0.15),
          radius: 0.28,
        ),
      ),
    );
  }

  ListTile menuShowOrder() {
    return ListTile(
      onTap: () {
        setState(() {
          indexWidget = 0;
          Navigator.pop(context);
        });
      },
      leading: Icon(Icons.filter_1_outlined),
      title: ShowTitle(title: 'Show order', textStyle: MyConstant().h4NmBkCl()),
      subtitle: ShowTitle(
        title: 'Show order details....',
        textStyle: MyConstant().h3NmGrey2Cl(),
      ),
    );
  }

  ListTile menuShopManage() {
    return ListTile(
      onTap: () {
        setState(() {
          setState(() {
            indexWidget = 1;
            Navigator.pop(context);
          });
        });
      },
      leading: Icon(Icons.filter_2_outlined),
      title: ShowTitle(
        title: 'Shop management',
        textStyle: MyConstant().h4NmBkCl(),
      ),
      subtitle: ShowTitle(
        title: 'Shop management details for customer....',
        textStyle: MyConstant().h3NmGrey2Cl(),
      ),
    );
  }

  ListTile menuShowProduct() {
    return ListTile(
      onTap: () {
        setState(() {
          setState(() {
            indexWidget = 2;
            Navigator.pop(context);
          });
        });
      },
      leading: Icon(Icons.filter_3_outlined),
      title: ShowTitle(
        title: 'Show product',
        textStyle: MyConstant().h4NmBkCl(),
      ),
      subtitle: ShowTitle(
        title: 'Show product details for sale out....',
        textStyle: MyConstant().h3NmGrey2Cl(),
      ),
    );
  }
}
