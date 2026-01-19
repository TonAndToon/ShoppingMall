import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shoppingmall/models/product_model.dart';
import 'package:shoppingmall/models/user_model.dart';
import 'package:shoppingmall/utility/my_constant.dart';
import 'package:shoppingmall/widgets/show_image.dart';
import 'package:shoppingmall/widgets/show_progress.dart';
import 'package:shoppingmall/widgets/show_title.dart';

class ShowProductBuyer extends StatefulWidget {
  final UserModel userModel;

  const ShowProductBuyer({super.key, required this.userModel});

  @override
  State<ShowProductBuyer> createState() => _ShowProductBuyerState();
}

class _ShowProductBuyerState extends State<ShowProductBuyer> {
  UserModel? userModel;
  bool load = true;
  bool? haveProduct;
  List<ProductModel> productModels = [];
  List<List<String>> listImages = [];
  int indexImage = 0;
  int amountInt = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userModel = widget.userModel;
    readAPI();
  }

  Future<void> readAPI() async {
    String urlAPI =
        '${MyConstant.domain}/shoppingmall/getProductWhereIdSeller.php?isAdd=true&idSeller=${userModel!.id}';
    await Dio().get(urlAPI).then((value) {
      // print('#### value = $value');

      if (value.toString() == 'null') {
        setState(() {
          haveProduct = false;
          load = false;
        });
      } else {
        for (var item in json.decode(value.data)) {
          ProductModel model = ProductModel.fromMap(item);

          String string = model.images;
          string = string.substring(1, string.length - 1);
          List<String> strings = string.split(',');
          int i = 0;
          for (var item in strings) {
            strings[i] = item.trim();
            i++;
          }

          listImages.add(strings);

          setState(() {
            haveProduct = true;
            load = false;
            productModels.add(model);
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyConstant.whColor,
      appBar: AppBar(
        title: Text(userModel!.name, style: MyConstant().h5BWCl()),
        backgroundColor: MyConstant.primaryColor,
        iconTheme: IconThemeData(color: MyConstant.whColor),
      ),
      body: load
          ? ShowProgress()
          : haveProduct!
          ? listProduct()
          : Center(
              child: ShowTitle(
                title: 'No product',
                textStyle: MyConstant().h5BPmrCl(),
              ),
            ),
    );
  }

  LayoutBuilder listProduct() {
    return LayoutBuilder(
      builder: (context, constraints) => ListView.builder(
        itemCount: productModels.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            print('#### You Click Index ==>> $index');
            showAlertDailog(productModels[index], listImages[index]);
          },
          child: Card(
            color: MyConstant.grey3Color,
            child: Row(
              children: [
                Container(
                  width: constraints.maxWidth * 0.32,
                  height: constraints.maxWidth * 0.42,
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: findUrlImage(productModels[index].images),
                      placeholder: (context, url) => ShowProgress(),
                      errorWidget: (context, url, error) =>
                          ShowImage(path: MyConstant.img1),
                    ),
                  ),
                ),
                Container(
                  width: constraints.maxWidth * 0.5,
                  height: constraints.maxWidth * 0.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShowTitle(
                        title: productModels[index].name,
                        textStyle: MyConstant().h4BPmrCl(),
                      ),
                      ShowTitle(
                        title: 'Price: ${productModels[index].price} THB',
                        textStyle: MyConstant().h4NmRdCl(),
                      ),
                      ShowTitle(
                        title: cutWord(
                          'Detail: ${productModels[index].detail}',
                        ),
                        textStyle: MyConstant().h3NmBkCl(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String findUrlImage(String arrayImage) {
    String string = arrayImage.substring(1, arrayImage.length - 1);
    List<String> strings = string.split(',');
    int index = 0;
    for (var item in strings) {
      strings[index] = item.trim();
      index++;
    }
    String result = '${MyConstant.domain}/shoppingmall${strings[0]}';
    // print('#### result = $result');
    return result;
  }

  Future<Null> showAlertDailog(
    ProductModel productModel,
    List<String> images,
  ) async {
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          backgroundColor: MyConstant.whColor,
          title: ListTile(
            leading: ShowImage(path: MyConstant.img2),
            title: ShowTitle(
              title: productModel.name,
              textStyle: MyConstant().h5BPmrCl(),
            ),
            subtitle: ShowTitle(
              title: 'Price: ${productModel.price}',
              textStyle: MyConstant().h5NmLCl(),
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CachedNetworkImage(
                  imageUrl:
                      '${MyConstant.domain}/shoppingmall${images[indexImage]}',
                  placeholder: (context, url) => ShowProgress(),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            indexImage = 0;
                            print('#### indexImage = $indexImage');
                          });
                        },
                        icon: Icon(
                          Icons.filter_1_outlined,
                          color: MyConstant.lightColor,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            indexImage = 1;
                            print('#### indexImage = $indexImage');
                          });
                        },
                        icon: Icon(
                          Icons.filter_2_outlined,
                          color: MyConstant.primaryColor,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            indexImage = 2;
                            print('#### indexImage = $indexImage');
                          });
                        },
                        icon: Icon(
                          Icons.filter_3_outlined,
                          color: MyConstant.darkColor,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            indexImage = 3;
                            print('#### indexImage = $indexImage');
                          });
                        },
                        icon: Icon(
                          Icons.filter_4_outlined,
                          color: MyConstant.bkColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    ShowTitle(
                      title: 'Details:',
                      textStyle: MyConstant().h4BBkCl(),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        width: 240,
                        child: ShowTitle(
                          title: productModel.detail,
                          textStyle: MyConstant().h3NmBkCl(),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {
                          if (amountInt != 1) {
                            setState(() {
                              amountInt--;
                            });
                          }
                        },
                        icon: Icon(
                          Icons.remove_circle_outline,
                          size: 32,
                          color: MyConstant.lightColor,
                        ),
                      ),
                      ShowTitle(
                        title: amountInt.toString(),
                        textStyle: MyConstant().h6BBkCl(),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            amountInt++;
                          });
                        },
                        icon: Icon(
                          Icons.add_circle_outline,
                          size: 32,
                          color: MyConstant.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Add cart', style: MyConstant().h5NmPmrCl()),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancle', style: MyConstant().h5NmDrkCl()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String cutWord(String string) {
    String result = string;
    if (result.length >= 68) {
      result = result.substring(0, 68);
      result = '$result ...';
    }
    return result;
  }
}
