import 'package:flutter/material.dart';
import 'package:shoppingmall/utility/my_constant.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  // bool statusRedEye = true;
  // final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController detailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MyConstant.whColor,
      appBar: AppBar(
        backgroundColor: MyConstant.primaryColor,
        title: Text('Add product', style: MyConstant().h5NmWCl()),
        iconTheme: IconThemeData(color: MyConstant.whColor),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          behavior: HitTestBehavior.opaque,
          child: Center(
            child: Column(
              children: [
                buildProductName(constraints),
                buildProductPrice(constraints),
                buildProductDetail(constraints),
                buildImage(constraints),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column buildImage(BoxConstraints constraints) {
    return Column(
      children: [
        Container(
          width: constraints.maxWidth * 0.52,
          height: constraints.maxHeight * 0.52,
          child: Image.asset(MyConstant.img5),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 42,
              height: 42,
              child: Image.asset(MyConstant.img5),
            ),
            Container(
              width: 42,
              height: 42,
              child: Image.asset(MyConstant.img5),
            ),
            Container(
              width: 42,
              height: 42,
              child: Image.asset(MyConstant.img5),
            ),
            Container(
              width: 42,
              height: 42,
              child: Image.asset(MyConstant.img5),
            ),
          ],
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
                borderSide: BorderSide(color: MyConstant.darkColor),
                borderRadius: BorderRadius.circular(9.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.lightColor, width: 1),
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
                borderSide: BorderSide(color: MyConstant.darkColor),
                borderRadius: BorderRadius.circular(9.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.lightColor, width: 1),
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
                borderSide: BorderSide(color: MyConstant.darkColor),
                borderRadius: BorderRadius.circular(9.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.lightColor, width: 1),
                borderRadius: BorderRadius.circular(9.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
