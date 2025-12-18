import 'package:flutter/material.dart';
import 'package:shoppingmall/utility/my_constant.dart';
import 'package:shoppingmall/widgets/show_image.dart';
import 'package:shoppingmall/widgets/show_title.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  // bool statusRedEye = true;
  final formKey = GlobalKey<FormState>();
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
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    buildProductName(constraints),
                    buildProductPrice(constraints),
                    buildProductDetail(constraints),
                    buildImage(constraints),
                    addProductButton(constraints),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row addProductButton(BoxConstraints constraints) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 24),
          width: constraints.maxWidth * 0.95,
          child: ElevatedButton(
            style: MyConstant().myButtonSPmr1(),
            onPressed: () {
              if (formKey.currentState!.validate()) {}
            },
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text('ADD PRODUCT', style: MyConstant().h4NmWCl()),
            ),
          ),
        ),
      ],
    );
  }

  Future<Null> chooseSourceImageDialog(int index) async {
    print('Click from index ==>> $index');
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: ListTile(
          leading: ShowImage(path: MyConstant.img4),
          title: ShowTitle(
            title: 'Source image ${index + 1}',
            textStyle: MyConstant().h4BPmrCl(),
          ),
          subtitle: ShowTitle(
            title: 'Please tab on camera or gallery 😊👇🏿',
            textStyle: MyConstant().h3NmPmrCl(),
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('camera', style: MyConstant().h4BDrkCl()),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('gallery', style: MyConstant().h4BDrkCl()),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Column buildImage(BoxConstraints constraints) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 32, bottom: 24),
          width: constraints.maxWidth * 0.78,
          height: constraints.maxWidth * 0.78,
          child: Image.asset(MyConstant.img5),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 52,
                height: 52,
                child: InkWell(
                  onTap: () => chooseSourceImageDialog(0),
                  child: Image.asset(MyConstant.img5),
                ),
              ),
              Container(
                width: 52,
                height: 52,
                child: InkWell(
                  onTap: () => chooseSourceImageDialog(1),
                  child: Image.asset(MyConstant.img5),
                ),
              ),
              Container(
                width: 52,
                height: 52,
                child: InkWell(
                  onTap: () => chooseSourceImageDialog(2),
                  child: Image.asset(MyConstant.img5),
                ),
              ),
              Container(
                width: 52,
                height: 52,
                child: InkWell(
                  onTap: () => chooseSourceImageDialog(3),
                  child: Image.asset(MyConstant.img5),
                ),
              ),
            ],
          ),
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
}
