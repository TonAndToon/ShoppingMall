import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoppingmall/bodys/my_money_buyer.dart';
import 'package:shoppingmall/bodys/my_order_buyer.dart';
import 'package:shoppingmall/bodys/show_all_shop_buyer.dart';
import 'package:shoppingmall/models/user_model.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoppingmall/utility/my_constant.dart';
import 'package:shoppingmall/widgets/show_progress.dart';
// import 'package:shoppingmall/widgets/show_progress.dart';
import 'package:shoppingmall/widgets/show_signout.dart';
import 'package:shoppingmall/widgets/show_title.dart';
// import 'package:shoppingmall/widgets/show_title.dart';

class BuyerService extends StatefulWidget {
  const BuyerService({super.key});

  @override
  State<BuyerService> createState() => _BuyerServiceState();
}

class _BuyerServiceState extends State<BuyerService> {
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
          widgets.add(ShowAllShopBuyer());
          widgets.add(MyMoneyBuyer());
          widgets.add(MyOrderBuyer());
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyConstant.primaryColor,
        title: Text('Buyer', style: MyConstant().h5NmWCl()),
        iconTheme: IconThemeData(color: MyConstant.whColor),
      ),
      drawer: Drawer(
        child: Stack(
          children: [
            Column(
              children: [
                buildHead(),
                menuShowAllShop(),
                menuMyMoney(),
                menuMyOrder(),
              ],
            ),
            ShowSignout(),
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
      accountName: Text(
        userModel == null ? 'Name ?' : 'Name:  ${userModel!.name}',
      ),
      accountEmail: Text(
        userModel == null ? 'Type ?' : 'Type:  ${userModel!.type}',
      ),
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [MyConstant.whColor, MyConstant.primaryColor],
          center: Alignment(-0.65, -0.15),
          radius: 0.28,
        ),
      ),
    );
  }

  ListTile menuShowAllShop() {
    return ListTile(
      leading: Icon(Icons.shopping_bag, size: 32, color: MyConstant.grey2Color),
      title: ShowTitle(
        title: 'Show All shop',
        textStyle: MyConstant().h4BBkCl(),
      ),
      subtitle: ShowTitle(
        title: 'Select detail all shop',
        textStyle: MyConstant().h3NmGrey2Cl(),
      ),
      onTap: () {
        setState(() {
          indexWidget = 0;
          Navigator.pop(context);
        });
      },
    );
  }

  ListTile menuMyMoney() {
    return ListTile(
      leading: Icon(
        Icons.price_change_rounded,
        size: 32,
        color: MyConstant.grey2Color,
      ),
      title: ShowTitle(
        title: 'Show My Money ',
        textStyle: MyConstant().h4BBkCl(),
      ),
      subtitle: ShowTitle(
        title: 'Select detail my money',
        textStyle: MyConstant().h3NmGrey2Cl(),
      ),
      onTap: () {
        setState(() {
          indexWidget = 1;
          Navigator.pop(context);
        });
      },
    );
  }

  ListTile menuMyOrder() {
    return ListTile(
      leading: Icon(
        Icons.list_alt_outlined,
        size: 32,
        color: MyConstant.grey2Color,
      ),
      title: ShowTitle(
        title: 'Show My order',
        textStyle: MyConstant().h4BBkCl(),
      ),
      subtitle: ShowTitle(
        title: 'Select detail my order',
        textStyle: MyConstant().h3NmGrey2Cl(),
      ),
      onTap: () {
        setState(() {
          indexWidget = 2;
          Navigator.pop(context);
        });
      },
    );
  }

  // UserAccountsDrawerHeader buildHeader() =>
  //     UserAccountsDrawerHeader(accountName: null, accountEmail: null);
}
