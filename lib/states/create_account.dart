import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shoppingmall/utility/my_constant.dart';
import 'package:shoppingmall/widgets/show_image.dart';
import 'package:shoppingmall/widgets/show_title.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  String? typeUser;
  File? file;
  Row buildName(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 0.0),
          width: size * 0.91,
          child: TextFormField(
            decoration: InputDecoration(
              labelText: "name :",
              labelStyle: MyConstant().h4NmPmrCl(),
              prefixIcon: Icon(
                Icons.fingerprint,
                color: MyConstant.primaryColor,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.primaryColor),
                borderRadius: BorderRadius.circular(32.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.lightColor, width: 3),
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buildAddress(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 0.0),
          width: size * 0.91,
          child: TextFormField(
            maxLines: 4,
            decoration: InputDecoration(
              hintText: 'address :',
              hintStyle: MyConstant().h4NmPmrCl(),
              prefixIcon: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 78),
                child: Icon(Icons.home, color: MyConstant.primaryColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.primaryColor),
                borderRadius: BorderRadius.circular(32.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.lightColor, width: 3),
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buildPhone(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 15.0),
          width: size * 0.91,
          child: TextFormField(
            decoration: InputDecoration(
              labelText: "phone :",
              labelStyle: MyConstant().h4NmPmrCl(),
              prefixIcon: Icon(Icons.phone, color: MyConstant.primaryColor),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.primaryColor),
                borderRadius: BorderRadius.circular(32.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.lightColor, width: 3),
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buildUser(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 15.0),
          width: size * 0.91,
          child: TextFormField(
            decoration: InputDecoration(
              labelText: "user :",
              labelStyle: MyConstant().h4NmPmrCl(),
              prefixIcon: Icon(
                Icons.supervised_user_circle,
                color: MyConstant.primaryColor,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.primaryColor),
                borderRadius: BorderRadius.circular(32.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.lightColor, width: 3),
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buildPassword(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 15.0),
          width: size * 0.91,
          child: TextFormField(
            decoration: InputDecoration(
              labelText: "password :",
              labelStyle: MyConstant().h4NmPmrCl(),
              prefixIcon: Icon(Icons.key, color: MyConstant.primaryColor),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.primaryColor),
                borderRadius: BorderRadius.circular(32.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.lightColor, width: 3),
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: MyConstant.whColor,
        title: Padding(
          padding: const EdgeInsets.all(78.0),
          child: Text('Register', style: TextStyle(color: MyConstant.whColor)),
        ),
        backgroundColor: MyConstant.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: ListView(
            children: [
              buildTitlle('Information'),
              buildName(size),
              buildTitlle('Type user'),
              buildRadioBuyer(size),
              buildRadioSeller(size),
              buildRadioRider(size),
              buildTitlle('Information'),
              buildAddress(size),
              buildPhone(size),
              buildUser(size),
              buildPassword(size),
              buildTitlle('Image'),
              buildSubTitle(),
              buildAvatar(size),
            ],
          ),
        ),
      ),
    );
  }

  Future<Null> chooseImage(ImageSource source) async {
    try {
      var result = await ImagePicker().pickImage(
        source: source,
        maxHeight: 800,
        maxWidth: 800,
      );
      setState(() {
        file = File(result!.path);
      });
    } catch (e) {}
  }

  Row buildAvatar(double size) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => chooseImage(ImageSource.camera),
          icon: Icon(
            Icons.add_a_photo_outlined,
            size: 36,
            color: MyConstant.lightColor,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 24),
          width: size * 0.5,
          child: file == null
              ? ShowImage(path: MyConstant.imgAvatar)
              : Image.file(file!),
        ),
        IconButton(
          onPressed: () => chooseImage(ImageSource.gallery),
          icon: Icon(
            Icons.add_photo_alternate_outlined,
            size: 36,
            color: MyConstant.primaryColor,
          ),
        ),
      ],
    );
  }

  ShowTitle buildSubTitle() {
    return ShowTitle(
      title:
          '    You must show your picture to create a user, but you do not to show picture, (defule Avatar).',
      textStyle: MyConstant().h3NmPmrCl(),
    );
  }

  Row buildRadioBuyer(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size * 0.6,
          child: RadioListTile(
            value: "buyer",
            groupValue: typeUser,
            onChanged: (value) {
              setState(() {
                typeUser = value;
              });
            },
            title: ShowTitle(
              title: 'ຜູ້ຊື້ (Buyer)',
              textStyle: MyConstant().h4NmPmrCl(),
            ),
          ),
        ),
      ],
    );
  }

  Row buildRadioSeller(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size * 0.6,
          child: RadioListTile(
            value: "seller",
            groupValue: typeUser,
            onChanged: (value) {
              setState(() {
                typeUser = value;
              });
            },
            title: ShowTitle(
              title: 'ຜູ້ຂາຍ (Seller)',
              textStyle: MyConstant().h4NmPmrCl(),
            ),
          ),
        ),
      ],
    );
  }

  Row buildRadioRider(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size * 0.6,
          child: RadioListTile(
            value: "Rider",
            groupValue: typeUser,
            onChanged: (value) {
              setState(() {
                typeUser = value;
              });
            },
            title: ShowTitle(
              title: 'ຜູ້ສົ່ງ (Rider)',
              textStyle: MyConstant().h4NmPmrCl(),
            ),
          ),
        ),
      ],
    );
  }

  Container buildTitlle(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.0),
      child: ShowTitle(title: title, textStyle: MyConstant().h5BPmrCl()),
    );
  }
}
