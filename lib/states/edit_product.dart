import 'dart:io';
import 'dart:math';
// import 'dart:nativewrappers/_internal/vm/lib/math_patch.dart' hide Random;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shoppingmall/models/product_model.dart';
import 'package:shoppingmall/utility/my_constant.dart';
import 'package:shoppingmall/utility/my_dialog.dart';
import 'package:shoppingmall/widgets/show_progress.dart';
import 'package:shoppingmall/widgets/show_title.dart';

class EditProduct extends StatefulWidget {
  final ProductModel productModel;

  const EditProduct({super.key, required this.productModel});

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  ProductModel? productModel;
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController detailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  List<String> pathImages = [];
  List<File?> files = [];
  bool statusImage = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productModel = widget.productModel;
    // print('#### image form mySQL ==>> ${productModel!.images}');
    convertStringToArray();
    nameController.text = productModel!.name;
    priceController.text = productModel!.price;
    detailController.text = productModel!.detail;
  }

  void convertStringToArray() {
    String string = productModel!.images;
    // print('string ກ່ອນຕັດ ==>> $string');
    string = string.substring(1, string.length - 1);
    // print('string ຫລັງຕັດ ==>> $string');
    List<String> strings = string.split(',');
    for (var item in strings) {
      pathImages.add(item.trim());
      files.add(null);
    }
    print('#### pathImage ==>> $pathImages');
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MyConstant.whColor,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => processEdit(),
            icon: Icon(Icons.edit, size: 32),
            tooltip: 'Edit Product',
          ),
        ],
        backgroundColor: MyConstant.primaryColor,
        title: Text('Edit product', style: MyConstant().h5NmWCl()),
        iconTheme: IconThemeData(color: MyConstant.whColor),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          behavior: HitTestBehavior.opaque,
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      buildTitle('General'),
                      buildProductName(constraints),
                      buildProductPrice(constraints),
                      buildProductDetail(constraints),
                      buildTitle('Image product'),
                      buildImage(size, 0),
                      buildImage(size, 1),
                      buildImage(size, 2),
                      buildImage(size, 3),
                      buildEditProduct(constraints),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container buildEditProduct(BoxConstraints constraints) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 24),
      width: constraints.maxWidth * 0.95,
      child: ElevatedButton(
        style: MyConstant().myButtonSPmr1(),
        onPressed: () => processEdit(),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Text('EDIT PRODUCT', style: MyConstant().h4NmWCl()),
        ),
      ),
    );
  }

  Future<Null> chooseImage(int index, ImageSource source) async {
    try {
      var result = await ImagePicker().pickImage(
        source: source,
        maxHeight: 800,
        maxWidth: 800,
      );
      setState(() {
        files[index] = File(result!.path);
        statusImage = true;
      });
      // ignore: empty_catches
    } catch (e) {}
  }

  Row buildImage(double size, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () => chooseImage(index, ImageSource.camera),
                icon: Icon(
                  Icons.add_a_photo_outlined,
                  color: MyConstant.lightColor,
                  size: 42,
                ),
              ),
              Container(
                width: size * 0.65,
                height: size * 0.65,
                child: files[index] == null
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: CachedNetworkImage(
                          imageUrl:
                              '${MyConstant.domain}/shoppingmall/${pathImages[index]}',
                          placeholder: (context, url) => ShowProgress(),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Image.file(files[index]!),
                      ),
              ),
              IconButton(
                onPressed: () => chooseImage(index, ImageSource.gallery),
                icon: Icon(
                  Icons.add_photo_alternate_outlined,
                  color: MyConstant.primaryColor,
                  size: 42,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row buildTitle(String title) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ShowTitle(title: title, textStyle: MyConstant().h4BPmrCl()),
        ),
      ],
    );
  }

  Row buildProductName(BoxConstraints constraints) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: constraints.maxWidth * 0.95,
          child: TextFormField(
            controller: nameController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please Fill product name in blank';
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              labelText: "Product name",
              labelStyle: MyConstant().h4NmPmrCl(),
              prefixIcon: Icon(
                Icons.production_quantity_limits,
                color: MyConstant.lightColor,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.lightColor),
                borderRadius: BorderRadius.circular(9.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.darkColor, width: 1),
                borderRadius: BorderRadius.circular(9.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.redColor, width: 1),
                borderRadius: BorderRadius.circular(9.0),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buildProductPrice(BoxConstraints constraints) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: constraints.maxWidth * 0.95,
          child: TextFormField(
            keyboardType: TextInputType.number,
            controller: priceController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please Fill product price in blank';
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              labelText: "Product price",
              labelStyle: MyConstant().h4NmPmrCl(),
              prefixIcon: Icon(
                Icons.price_change_outlined,
                color: MyConstant.lightColor,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.lightColor),
                borderRadius: BorderRadius.circular(9.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.darkColor, width: 1),
                borderRadius: BorderRadius.circular(9.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.redColor, width: 1),
                borderRadius: BorderRadius.circular(9.0),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buildProductDetail(BoxConstraints constraints) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: constraints.maxWidth * 0.95,
          child: TextFormField(
            maxLines: 4,
            controller: detailController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please Fill product detail in blank';
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              hintText: 'Product detail',
              hintStyle: MyConstant().h4NmPmrCl(),
              labelStyle: MyConstant().h4NmPmrCl(),
              prefixIcon: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 78),
                child: Icon(Icons.list_alt, color: MyConstant.lightColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.lightColor),
                borderRadius: BorderRadius.circular(9.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.darkColor, width: 1),
                borderRadius: BorderRadius.circular(9.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.redColor, width: 1),
                borderRadius: BorderRadius.circular(9.0),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<Null> processEdit() async {
    if (formKey.currentState!.validate()) {
      MyDialog().showProgressDialog(context);
      String name = nameController.text;
      String price = priceController.text;
      String detail = detailController.text;
      String id = productModel!.id;
      String images;

      if (statusImage) {
        //upload image and refresh array pathImages
        int index = 0;

        for (var item in files) {
          if (item != null) {
            int i = Random().nextInt(1000000);
            String nameImage = 'productEdit$i.jpg';
            String apiUploadImage =
                '${MyConstant.domain}/shoppingmall/saveProduct.php';

            Map<String, dynamic> map = {};
            map['file'] = await MultipartFile.fromFile(
              item.path,
              filename: nameImage,
            );
            FormData formData = FormData.fromMap(map);
            await Dio().post(apiUploadImage, data: formData).then((value) {
              pathImages[index] = '/product/$nameImage';
            });
          }
          index++;
        }
        images = pathImages.toString();
        Navigator.pop(context);
      } else {
        images = pathImages.toString();
        Navigator.pop(context);
      }

      print('#### statusImage = $statusImage');
      print('#### id = $id, name = $name, price = $price, detail = $detail');
      print('#### images = $images');

      String apiEditProduct =
          '${MyConstant.domain}/shoppingmall/editProductWhereId.php?isAdd=true&id=$id&name=$name&price=$price&detail=$detail&images=$images';
      await Dio().get(apiEditProduct).then((value) => Navigator.pop(context));
    }
  }
}
