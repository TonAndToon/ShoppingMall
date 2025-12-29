import 'package:flutter/material.dart';
import 'package:shoppingmall/models/product_model.dart';
import 'package:shoppingmall/utility/my_constant.dart';

class EditProduct extends StatefulWidget {
  final ProductModel productModel;

  const EditProduct({super.key, required this.productModel});

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  ProductModel? productModel;
  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productModel = widget.productModel;
    print('#### name Edit ==>> ${productModel!.name}');
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MyConstant.whColor,
      appBar: AppBar(
        backgroundColor: MyConstant.primaryColor,
        iconTheme: IconThemeData(color: MyConstant.whColor),
        title: Text('Edit product', style: MyConstant().h5BWCl()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: Form(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  buildProductName(size),
                  buildProductPrice(size),
                  buildProductDetail(size),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row buildProductName(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 8.0),
          width: size * 0.91,
          child: TextFormField(
            controller: nameController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter address';
              } else {}
            },
            maxLines: 1,
            decoration: InputDecoration(
              hintText: 'address',
              hintStyle: MyConstant().h4NmPmrCl(),
              prefixIcon: Icon(Icons.home, color: MyConstant.primaryColor),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.primaryColor),
                borderRadius: BorderRadius.circular(9.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.lightColor, width: 2),
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

  Row buildProductPrice(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 8.0),
          width: size * 0.91,
          child: TextFormField(
            controller: nameController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter address';
              } else {}
            },
            maxLines: 1,
            decoration: InputDecoration(
              hintText: 'address',
              hintStyle: MyConstant().h4NmPmrCl(),
              prefixIcon: Icon(Icons.home, color: MyConstant.primaryColor),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.primaryColor),
                borderRadius: BorderRadius.circular(9.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.lightColor, width: 2),
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

  Row buildProductDetail(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 8.0),
          width: size * 0.91,
          child: TextFormField(
            controller: nameController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter address';
              } else {}
            },
            maxLines: 4,
            decoration: InputDecoration(
              hintText: 'address',
              hintStyle: MyConstant().h4NmPmrCl(),
              prefixIcon: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 78),
                child: Icon(Icons.home, color: MyConstant.primaryColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.primaryColor),
                borderRadius: BorderRadius.circular(9.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.lightColor, width: 2),
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
}
