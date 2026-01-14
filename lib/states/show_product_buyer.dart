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
      print('#### value = $value');

      if (value.toString() == 'null') {
        setState(() {
          haveProduct = false;
          load = false;
        });
      } else {
        for (var item in json.decode(value.data)) {
          ProductModel model = ProductModel.fromMap(item);
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
      appBar: AppBar(title: Text(userModel!.name)),
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
        itemBuilder: (context, index) => Row(
          children: [
            Container(
              width: constraints.maxWidth * 0.4,
              height: constraints.maxWidth * 0.6,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
              height: constraints.maxWidth * 0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShowTitle(
                    title: productModels[index].name,
                    textStyle: MyConstant().h5BPmrCl(),
                  ),
                  ShowTitle(
                    title: 'Price: ${productModels[index].price} THB',
                    textStyle: MyConstant().h5BRdCl(),
                  ),
                  ShowTitle(
                    title: 'Detail: ${productModels[index].detail}',
                    textStyle: MyConstant().h4BBkCl(),
                  ),
                ],
              ),
            ),
          ],
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
    print('#### result = $result');
    return result;
  }
}
