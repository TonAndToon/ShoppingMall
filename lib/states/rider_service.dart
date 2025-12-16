import 'package:flutter/material.dart';
import 'package:shoppingmall/utility/my_constant.dart';
import 'package:shoppingmall/widgets/show_signout.dart';

class RiderService extends StatefulWidget {
  const RiderService({super.key});

  @override
  State<RiderService> createState() => _RiderServiceState();
}

class _RiderServiceState extends State<RiderService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyConstant.primaryColor,
        title: Text('Rider', style: MyConstant().h5NmWCl()),
        iconTheme: IconThemeData(color: MyConstant.whColor),
      ),
      drawer: Drawer(child: ShowSignout()),
    );
  }
}
