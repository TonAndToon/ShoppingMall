import 'package:flutter/material.dart';
import 'package:shoppingmall/utility/my_constant.dart';

class ShowProductSeller extends StatefulWidget {
  const ShowProductSeller({super.key});

  @override
  State<ShowProductSeller> createState() => _ShowProductSellerState();
}

class _ShowProductSellerState extends State<ShowProductSeller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('This is Show product'),
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyConstant.primaryColor,
        onPressed: () =>
            Navigator.pushNamed(context, MyConstant.routeAddProduct),
        child: Text('Add', style: MyConstant().h4NmWCl()),
      ),
    );
  }
}
