import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shoppingmall/utility/my_constant.dart';
import 'package:shoppingmall/widgets/nav_confirm_add_wallet.dart';
import 'package:shoppingmall/widgets/show_title.dart';

class Bank extends StatefulWidget {
  const Bank({super.key});

  @override
  State<Bank> createState() => _BankState();
}

class _BankState extends State<Bank> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [buildTitle(), buildBKKbank(), buildKbank()]),
      floatingActionButton: NavConfirmAddWallet(),
    );
  }

  Widget buildBKKbank() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 0),
      height: 124,
      child: Center(
        child: Card(
          color: MyConstant.grey3Color,
          child: ListTile(
            leading: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset('assets/images/bbl.svg'),
              ),
            ),
            title: ShowTitle(
              title: 'ธนาคารกรุงเทพ สาขาบิ๊คซี บางนา',
              textStyle: MyConstant().h4BBkCl(),
            ),
            subtitle: ShowTitle(
              title: 'ชื่อบัญชี นายธหวัดชัย บุนธบันดีด เลขบัญชี 913-0-04149-5',
              textStyle: MyConstant().h4NmBkCl(),
            ),
          ),
        ),
      ),
    );
  }

  Container buildKbank() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 0),
      height: 124,
      child: Center(
        child: Card(
          color: MyConstant.grey3Color,
          child: ListTile(
            leading: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.green.shade700,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset('assets/images/kbank.svg'),
              ),
            ),
            title: ShowTitle(
              title: 'ธนาคารกสิกรไทย สาขาบางนา',
              textStyle: MyConstant().h4BBkCl(),
            ),
            subtitle: ShowTitle(
              title: 'ชื่อบัญชี นายธหวัดชัย บุนธบันดีด เลขบัญชี 056-2-32767-5',
              textStyle: MyConstant().h4NmBkCl(),
            ),
          ),
        ),
      ),
    );
  }

  Padding buildTitle() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ShowTitle(
        title: 'การโอนเงินเข้า บัญชีธนาคาร',
        textStyle: MyConstant().h5BBkCl(),
      ),
    );
  }
}
