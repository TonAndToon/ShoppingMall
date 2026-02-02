import 'package:flutter/material.dart';
import 'package:shoppingmall/bodys/bank.dart';
import 'package:shoppingmall/bodys/credit.dart';
import 'package:shoppingmall/bodys/prompay.dart';
import 'package:shoppingmall/utility/my_constant.dart';

class AddWallet extends StatefulWidget {
  const AddWallet({super.key});

  @override
  State<AddWallet> createState() => _AddWalletState();
}

class _AddWalletState extends State<AddWallet> {
  List<Widget> widgets = [Bank(), Prompay(), Credit()];
  List<IconData> icons = [
    Icons.money_outlined,
    Icons.book_online,
    Icons.credit_card,
  ];

  List<String> titles = ['Bank', 'Prompay', 'Credit'];

  int indexPosition = 0;

  List<BottomNavigationBarItem> bottomNavigationBarItems = [];

  @override
  void initState() {
    super.initState();

    int i = 0;
    for (var item in titles) {
      bottomNavigationBarItems.add(
        createBottomNavigationBarItem(icons[i], item),
      );
      i++;
    }
  }

  BottomNavigationBarItem createBottomNavigationBarItem(
    IconData iconData,
    String string,
  ) => BottomNavigationBarItem(icon: Icon(iconData), label: string);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyConstant.whColor,
      appBar: AppBar(
        title: Text('Add wallet'),
        backgroundColor: MyConstant.primaryColor,
        iconTheme: IconThemeData(color: MyConstant.whColor),
        foregroundColor: MyConstant.whColor,
      ),
      body: widgets[indexPosition],
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: IconThemeData(color: MyConstant.darkColor),
        unselectedIconTheme: IconThemeData(color: MyConstant.lightColor),
        selectedItemColor: MyConstant.darkColor,
        unselectedItemColor: MyConstant.lightColor,
        items: bottomNavigationBarItems,
        currentIndex: indexPosition,
        onTap: (value) {
          setState(() {
            indexPosition = value;
          });
        },
      ),
    );
  }
}
