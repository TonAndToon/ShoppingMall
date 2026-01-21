import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoppingmall/models/sqlite_model.dart';
import 'package:shoppingmall/models/user_model.dart';
import 'package:shoppingmall/utility/my_constant.dart';
import 'package:shoppingmall/utility/my_dialog.dart';
import 'package:shoppingmall/utility/sqlite_helper.dart';
import 'package:shoppingmall/widgets/show_image.dart';
import 'package:shoppingmall/widgets/show_no_data.dart';
import 'package:shoppingmall/widgets/show_progress.dart';
import 'package:shoppingmall/widgets/show_title.dart';

class ShowCart extends StatefulWidget {
  const ShowCart({super.key});

  @override
  State<ShowCart> createState() => _ShowCartState();
}

class _ShowCartState extends State<ShowCart> {
  List<SQLiteModel> sqliteModels = [];

  bool load = true;
  UserModel? userModel;
  int? total;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    processReadSQLite();
  }

  Future<Null> processReadSQLite() async {
    if (sqliteModels.isNotEmpty) {
      sqliteModels.clear();
    }

    await SQLiteHelper().readSQLite().then((value) {
      // print('### value on processReadSQLite ==>> $value');
      setState(() {
        load = false;
        sqliteModels = value;
        findDetailSeller();
        calculateTotal();
      });
    });
  }

  void calculateTotal() async {
    total = 0;
    for (var item in sqliteModels) {
      int sumInt = int.parse(item.sum.trim());
      setState(() {
        total = total! + sumInt;
      });
    }
  }

  Future<void> findDetailSeller() async {
    String idSeller = sqliteModels[0].idSeller;
    print('### idSeller ==>> $idSeller');
    String apiGetUserWhereId =
        '${MyConstant.domain}/shoppingmall/getUserWhereId.php?isAdd=true&id=$idSeller';
    await Dio().get(apiGetUserWhereId).then((value) {
      for (var item in json.decode(value.data)) {
        setState(() {
          userModel = UserModel.fromMap(item);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Show Cart')),
      body: load
          ? ShowProgress()
          : sqliteModels.isEmpty
          ? ShowNoData(title: 'Empty Cart', pathImage: MyConstant.img3)
          : buildContent(),
    );
  }

  Container buildContent() {
    return Container(
      decoration: MyConstant().gradintLinearBackground(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          showSeller(),
          buildHead(),
          listProduct(),
          buildDivider(),
          buildTotal(),
          buildDivider(),
          buttonController(),
        ],
      ),
    );
  }

  Future<void> confirmEmptyCart() async {
    // print('### confirmEmptyCart Work');
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: ListTile(
          leading: ShowImage(path: MyConstant.img4),
          title: ShowTitle(
            title: 'ທ່ານຕ້ອງການລົບຫຼືບໍ່ ?',
            textStyle: MyConstant().h6BPmrCl(),
          ),
          subtitle: ShowTitle(
            title: 'ສີນຄ້າທັງໝົດໃນກະຕ້າແມ່ນບໍ່ ?',
            textStyle: MyConstant().h4BPmrCl(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              await SQLiteHelper().emptySQLite().then((value) {
                Navigator.pop(context);
                processReadSQLite();
              });
            },
            child: Text('Delete'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
        ],
      ),
    );
  }

  Row buttonController() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () async {
            MyDialog().showProgressDialog(context);

            SharedPreferences preferences =
                await SharedPreferences.getInstance();
            String idBuyer = preferences.getString('id')!;

            var path =
                '${MyConstant.domain}/shoppingmall/getWalletWhereIdBuyer.php?isAdd=true&idBuyer=$idBuyer';
            await Dio().get(path).then((value) {
              Navigator.pop(context);
              print('#### value == $value');
              if (value.toString() == 'null') {
                print('#### action Alert add Wallet');
                // MyDialog(
                //   funcAction: () {
                //     Navigator.pop(context);
                //     Navigator.pushNamed(context, MyConstant.routeAddWallet);
                //   },
                // ).actionDialog(context, 'No Wallet', 'Please Add Waller');
              } else {
                print('#12feb check Wallet can Payment');

                int approveWallet = 0;
                for (var item in json.decode(value.data)) {
                  // WalletModel walletModel = WalletModel.fromMap(item);
                  // if (walletModel.status == 'Approve') {
                  //   approveWallet =
                  //       approveWallet + int.parse(walletModel.money.trim());
                  // }
                }
                print('#12feb approveWallet ==> $approveWallet');
                if (approveWallet - total! >= 0) {
                  print('#12feb Can Order');
                  // MyDialog(funcAction: orderFunc).actionDialog(
                  //   context,
                  //   'Confirm Order ?',
                  //   'Order Total : $total thb \n Please Confirm Order',
                  // );
                } else {
                  print('#12feb Cannot Order');
                  MyDialog().normalDialog(
                    context,
                    'Cannot Order ?',
                    'Approve Money : $approveWallet THB \n Total : $total THB \n ຈຳນວນເງິນບໍ່ພຽງພໍ. ກະລຸນາລໍຖ້າການອະນຸມັດຈາກແອັດມີ້ນ ຫຼື ເພີ່ມກະເປົາເງິນ.',
                  );
                }
              }
            });
          },
          child: Text('Order'),
        ),
        Container(
          margin: EdgeInsets.only(left: 4, right: 8),
          child: ElevatedButton(
            onPressed: () => confirmEmptyCart(),
            child: Text('Empty Cart'),
          ),
        ),
      ],
    );
  }

  Row buildTotal() {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ShowTitle(title: 'Total :', textStyle: MyConstant().h5BDrkCl()),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShowTitle(
                title: total == null ? '' : total.toString(),
                textStyle: MyConstant().h5BDrkCl(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Divider buildDivider() {
    return Divider(color: MyConstant.darkColor);
  }

  ListView listProduct() {
    return ListView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: sqliteModels.length,
      itemBuilder: (context, index) => Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: ShowTitle(
                title: sqliteModels[index].name,
                textStyle: MyConstant().h4BDrkCl(),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: ShowTitle(
              title: sqliteModels[index].price,
              textStyle: MyConstant().h4BDrkCl(),
            ),
          ),
          Expanded(
            flex: 1,
            child: ShowTitle(
              title: sqliteModels[index].amount,
              textStyle: MyConstant().h4BDrkCl(),
            ),
          ),
          Expanded(
            flex: 1,
            child: ShowTitle(
              title: sqliteModels[index].sum,
              textStyle: MyConstant().h4BDrkCl(),
            ),
          ),
          Expanded(
            flex: 1,
            child: IconButton(
              onPressed: () async {
                int idSQLite = sqliteModels[index].id!;
                print('### Delete idSQLite ==>> $idSQLite');
                await SQLiteHelper()
                    .deleteSQLiteWhereId(idSQLite)
                    .then((value) => processReadSQLite());
              },
              icon: Icon(
                Icons.delete_forever_outlined,
                color: Colors.red.shade700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildHead() {
    return Container(
      decoration: BoxDecoration(color: MyConstant.lightColor),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: ShowTitle(
                  title: 'Produce',
                  textStyle: MyConstant().h4BDrkCl(),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ShowTitle(
                title: 'Price',
                textStyle: MyConstant().h4BDrkCl(),
              ),
            ),
            Expanded(
              flex: 1,
              child: ShowTitle(
                title: 'Amt',
                textStyle: MyConstant().h4BDrkCl(),
              ),
            ),
            Expanded(
              flex: 1,
              child: ShowTitle(
                title: 'Sum',
                textStyle: MyConstant().h4BDrkCl(),
              ),
            ),
            Expanded(flex: 1, child: SizedBox()),
          ],
        ),
      ),
    );
  }

  Padding showSeller() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ShowTitle(
        title: userModel == null ? '' : 'ຮ້ານ: ${userModel!.name}',
        textStyle: MyConstant().h6BDrkCl(),
      ),
    );
  }

  Future<void> orderFunc() async {
    Navigator.pop(context);
    print('orderFucntion work');
  }
}
