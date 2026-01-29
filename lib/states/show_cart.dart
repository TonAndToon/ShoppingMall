import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shoppingmall/models/sqlite_model.dart';
import 'package:shoppingmall/models/user_model.dart';
import 'package:shoppingmall/utility/my_constant.dart';
import 'package:shoppingmall/utility/sqlite_helper.dart';
import 'package:shoppingmall/widgets/show_image.dart';
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
    if (sqliteModels.isNotEmpty) {
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
    } else {
      print('### ບໍ່ມີຂໍ້ມູນໃນ sqliteModels');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyConstant.whColor,
      appBar: AppBar(
        backgroundColor: MyConstant.primaryColor,
        iconTheme: IconThemeData(color: MyConstant.whColor),
        foregroundColor: MyConstant.whColor,
        title: Text('Show Cart'),
      ),
      body: load
          ? ShowProgress()
          : sqliteModels.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 24),
                    width: 240,
                    child: ShowImage(path: MyConstant.img1),
                  ),
                  ShowTitle(
                    title: 'Empty cart...',
                    textStyle: MyConstant().h6NmPmrCl(),
                  ),
                ],
              ),
            )
          : buildContent(),
    );
  }

  Column buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        showSeller(),
        buildHand(),
        listProduct(),
        buildDiveder(),
        buildTotal(),
        buildDiveder(),
        buttonController(),
      ],
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
            title: 'ທ່ານຕ້ອງການລົບ',
            textStyle: MyConstant().h4BBkCl(),
          ),
          subtitle: ShowTitle(
            title: 'Product ທັງໝົດໃນກະຕ່າແທ້ບໍ່ ?',
            textStyle: MyConstant().h4BBkCl(),
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
          style: MyConstant().myButtonSPmr1(),
          onPressed: () {
            Navigator.pushNamed(context, MyConstant.routeAddWallet);
          },
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text('ORDER', style: MyConstant().h4NmWCl()),
          ),
        ),

        Container(
          margin: EdgeInsets.only(left: 8, right: 8),
          child: ElevatedButton(
            style: MyConstant().myButtonSPmr1(),
            onPressed: () {
              print('#### Click Empty Cart');
              confirmEmptyCart();
            },
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text('EMPTY CART', style: MyConstant().h4NmWCl()),
            ),
          ),
        ),
      ],
    );
  }

  Row buildTotal() {
    return Row(
      children: [
        Expanded(
          flex: 6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ShowTitle(title: 'Total : ', textStyle: MyConstant().h4BBkCl()),
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShowTitle(
                title: total == null ? '' : total.toString(),
                textStyle: MyConstant().h4BBkCl(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Divider buildDiveder() => Divider(color: MyConstant.bkColor);

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
              padding: const EdgeInsets.all(8.0),
              child: ShowTitle(
                title: sqliteModels[index].name,
                textStyle: MyConstant().h3NmBkCl(),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: ShowTitle(
              title: sqliteModels[index].price,
              textStyle: MyConstant().h3NmBkCl(),
            ),
          ),
          Expanded(
            flex: 1,
            child: ShowTitle(
              title: sqliteModels[index].amount,
              textStyle: MyConstant().h3NmBkCl(),
            ),
          ),
          Expanded(
            flex: 1,
            child: ShowTitle(
              title: sqliteModels[index].sum,
              textStyle: MyConstant().h3NmBkCl(),
            ),
          ),
          Expanded(
            flex: 1,
            child: IconButton(
              onPressed: () async {
                int idSQLite = sqliteModels[index].id!;
                print('#### DELETE idSQLite ==>> $idSQLite');
                await SQLiteHelper()
                    .deleteSQLiteWhereId(idSQLite)
                    .then((value) => processReadSQLite());
              },
              icon: Icon(
                Icons.delete_forever_outlined,
                color: Colors.redAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildHand() {
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
                  textStyle: MyConstant().h4BWCl(),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ShowTitle(
                title: 'Price',
                textStyle: MyConstant().h4BWCl(),
              ),
            ),
            Expanded(
              flex: 1,
              child: ShowTitle(title: 'Amt', textStyle: MyConstant().h4BWCl()),
            ),
            Expanded(
              flex: 1,
              child: ShowTitle(title: 'Sum', textStyle: MyConstant().h4BWCl()),
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
        title: userModel == null ? '' : 'Shop name: ${userModel!.name}.',
        textStyle: MyConstant().h5BPmrCl(),
      ),
    );
  }
}
