import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoppingmall/models/product_model.dart';
import 'package:shoppingmall/states/edit_product.dart';
import 'package:shoppingmall/utility/my_constant.dart';
import 'package:shoppingmall/widgets/show_image.dart';
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
    if (productModels.length != 0) {
      productModels.clear();
    } else {}
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
      backgroundColor: MyConstant.grey3Color,
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

      floatingActionButton: Container(
        alignment: Alignment.bottomCenter,
        width: 56,
        child: FloatingActionButton(
          backgroundColor: MyConstant.primaryColor,
          onPressed: () => Navigator.pushNamed(
            context,
            MyConstant.routeAddProduct,
          ).then((value) => loadValueFromAPI()),
          child: Container(
            alignment: Alignment.center,
            child: Icon(Icons.add, color: MyConstant.whColor, size: 32.0),
          ),
        ),
      ),
    );
  }

  String createUrl(String string) {
    String result = string.substring(1, string.length - 1);
    List<String> strings = result.split(',');
    String url = '${MyConstant.domain}/shoppingmall${strings[0]}';
    return url;
  }

  ListView buildListView(BoxConstraints constraints) {
    return ListView.builder(
      itemCount: productModels.length,
      itemBuilder: (context, index) => Card(
        margin: EdgeInsets.all(8.0),
        color: MyConstant.whColor,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(4.0),
              width: constraints.maxWidth * 0.5 - 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ShowTitle(
                    title: productModels[index].name,
                    textStyle: MyConstant().h5BBkCl(),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    height: constraints.maxWidth * 0.6,
                    child: CachedNetworkImage(
                      imageUrl: createUrl(productModels[index].images),
                      placeholder: (context, url) => ShowProgress(),
                      errorWidget: (context, url, error) =>
                          ShowImage(path: MyConstant.img1),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(2.0),
              width: constraints.maxWidth * 0.4 - 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ShowTitle(
                    title: 'Price: ${productModels[index].price} THB',
                    textStyle: MyConstant().h4BBkCl(),
                  ),
                  ShowTitle(
                    title: productModels[index].detail,
                    textStyle: MyConstant().h3NmGrey2Cl(),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {
                          print('#### You click Edid');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditProduct(
                                productModel: productModels[index],
                              ),
                            ),
                          );
                        },
                        child: Text(
                          'EDIT',
                          style: TextStyle(color: MyConstant.green1Color),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          print('#### You click Delete from index = $index');
                          confirmDailogDelete(productModels[index]);
                        },
                        child: Text('DEL', style: MyConstant().h4BRdCl()),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<Null> confirmDailogDelete(ProductModel productModel) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: ListTile(
          leading: CachedNetworkImage(
            imageUrl: createUrl(productModel.images),
            placeholder: (context, url) => ShowProgress(),
          ),
          title: ShowTitle(
            title: 'Delete ${productModel.name} ?',
            textStyle: MyConstant().h4BPmrCl(),
          ),
          subtitle: ShowTitle(
            title: productModel.detail,
            textStyle: MyConstant().h2NmPmrCl(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              print('#### Confirm delete at id == >> ${productModel.id}');
              String apiDeleteProductWhereId =
                  '${MyConstant.domain}/shoppingmall/deleteProductWhereId.php?isAdd=true&id=${productModel.id}';
              await Dio().get(apiDeleteProductWhereId).then((value) {
                Navigator.pop(context);
                loadValueFromAPI();
              });
            },
            child: Text('Delete'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancle'),
          ),
        ],
      ),
    );
  }
}
