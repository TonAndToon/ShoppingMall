import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoppingmall/models/product_model.dart';
import 'package:shoppingmall/utility/my_constant.dart';
import 'package:shoppingmall/widgets/show_progress.dart';
import 'package:shoppingmall/widgets/show_title.dart';

class ShowProductSeller extends StatefulWidget {
  const ShowProductSeller({super.key});

  @override
  State<ShowProductSeller> createState() => _ShowProductSellerState();
}

class _ShowProductSellerState extends State<ShowProductSeller> {
  bool load = true;
  bool? haveData;
  List<ProductModel> productModels = [];
  @override
  void initState() {
    super.initState();
    loadValueFromAPI();
  }

  Future<Null> loadValueFromAPI() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String id = preferences.getString('id')!;
    String apiGetProductWhereIdSeller =
        '${MyConstant.domain}/shoppingmall/getProductWhereIdSeller.php?isAdd=true&idSeller=$id';
    await Dio().get(apiGetProductWhereIdSeller).then((value) {
      // print('value ==>> $value');

      if (value.toString() == 'null') {
        //No Data
        setState(() {
          load = false;
          haveData = false;
        });
      } else {
        // Have Data
        for (var item in json.decode(value.data)) {
          ProductModel model = ProductModel.fromMap(item);
          print('Product name ==>> ${model.name}');

          setState(() {
            load = false;
            haveData = true;
            productModels.add(model);
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: load
          ? ShowProgress()
          : haveData!
          ? LayoutBuilder(
              builder: (context, constraints) => buildListView(constraints),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ShowTitle(
                    title: 'No product',
                    textStyle: MyConstant().h6BPmrCl(),
                  ),
                  ShowTitle(
                    title: 'Please add product...',
                    textStyle: MyConstant().h4NmPmrCl(),
                  ),
                ],
              ),
            ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: MyConstant.primaryColor,
        onPressed: () =>
            Navigator.pushNamed(context, MyConstant.routeAddProduct),
        child: Text('Add', style: MyConstant().h4NmWCl()),
      ),
    );
  }

  ListView buildListView(BoxConstraints constraints) {
    return ListView.builder(
      itemCount: productModels.length,
      itemBuilder: (context, index) => Card(
        margin: EdgeInsets.all(8.0),
        color: MyConstant.grey3Color,
        child: Row(
          children: [
            Container(
              width: constraints.maxWidth * 0.4,
              child: ShowTitle(
                title: productModels[index].name,
                textStyle: MyConstant().h4BPmrCl(),
              ),
            ),
            Container(
              width: constraints.maxWidth * 0.5,
              child: Column(
                children: [
                  ShowTitle(
                    title: 'Price: ${productModels[index].price} THB',
                    textStyle: MyConstant().h4NmRdCl(),
                  ),
                  ShowTitle(
                    title: productModels[index].detail,
                    textStyle: MyConstant().h3NmPmrCl(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
