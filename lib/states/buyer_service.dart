import 'package:flutter/material.dart';
import 'package:shoppingmall/bodys/my_money_buyer.dart';
import 'package:shoppingmall/bodys/my_order_buyer.dart';
import 'package:shoppingmall/bodys/show_all_shop_buyer.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoppingmall/utility/my_constant.dart';
import 'package:shoppingmall/widgets/show_progress.dart';
import 'package:shoppingmall/widgets/show_signout.dart';
import 'package:shoppingmall/widgets/show_title.dart';
// import 'package:shoppingmall/widgets/show_title.dart';

class BuyerService extends StatefulWidget {
  const BuyerService({super.key});

  @override
  State<BuyerService> createState() => _BuyerServiceState();
}

class _BuyerServiceState extends State<BuyerService> {
  List<Widget> widgets = [ShowAllShopBuyer(), MyMoneyBuyer(), MyOrderBuyer()];
  int indexWidget = 0;
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
                buildHeader(),
                menuShowAllShop(),
                menuMyMoney(),
                menuMyOrder(),
              ],
            ),
            ShowSignout(),
          ],
        ),
      ),
      body: widgets[indexWidget],
    );
  }

  ListTile menuShowAllShop() {
    return ListTile(
      leading: Icon(
        Icons.shopping_bag,
        size: 32,
        color: MyConstant.green1Color,
      ),
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
        color: MyConstant.green1Color,
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
        Icons.shopping_bag,
        size: 32,
        color: MyConstant.green1Color,
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

  UserAccountsDrawerHeader buildHeader() =>
      UserAccountsDrawerHeader(accountName: null, accountEmail: null);
}
