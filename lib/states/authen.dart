import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoppingmall/models/user_model.dart';
import 'package:shoppingmall/utility/my_constant.dart';
import 'package:shoppingmall/utility/my_dialog.dart';
import 'package:shoppingmall/widgets/show_image.dart';
import 'package:shoppingmall/widgets/show_title.dart';

class Authen extends StatefulWidget {
  const Authen({super.key});

  @override
  State<Authen> createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  bool statusRedEye = true;
  final formKey = GlobalKey<FormState>();
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          behavior: HitTestBehavior.opaque,
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                buildImage(size),
                buildAppName(),
                buildUser(size),
                buildPassword(size),
                buildLogin(size),
                buildCreateAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildCreateAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShowTitle(title: 'Non Account ? ', textStyle: MyConstant().h4NmLCl()),
        TextButton(
          onPressed: () =>
              Navigator.pushNamed(context, MyConstant.routeCreateAccount),
          child: Text("Create Account", style: MyConstant().h4BPmrCl()),
        ),
      ],
    );
  }

  Row buildLogin(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 15),
          width: size * 0.9,
          child: ElevatedButton(
            style: MyConstant().myButtonSPmr1(),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                String user = userController.text;
                String password = passwordController.text;
                print('#### User = $user, password = $password');
                checkAuthen(user, password);
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text('LOGIN'),
            ),
          ),
        ),
      ],
    );
  }

  Future<Null> checkAuthen(String user, String password) async {
    String apiCheckAuthen =
        '${MyConstant.domain}/shoppingmall/getUserWhereUser.php?isAdd=true&user=$user';
    await Dio().get(apiCheckAuthen).then((value) async {
      print('#### Value for API ==>> $value');
      if (value.toString() == 'null') {
        MyDialog().normalDialog(
          context,
          'User False',
          'No $user in Application',
        );
      } else {
        for (var item in json.decode(value.data)) {
          UserModel model = UserModel.fromMap(item);
          if (password == model.password) {
            //Success Authen
            String type = model.type;
            print(' Authen success in tpye ==>> $type');

            SharedPreferences preferences =
                await SharedPreferences.getInstance();
            preferences.setString('type', type);
            preferences.setString('user', model.user);
            switch (type) {
              case 'buyer':
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  MyConstant.routeBuyerService,
                  (route) => false,
                );
                break;
              case 'seller':
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  MyConstant.routeSellerService,
                  (route) => false,
                );
                break;
              case 'rider':
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  MyConstant.routeRiderService,
                  (route) => false,
                );
                break;
              default:
            }
          } else {
            //Authen False
            MyDialog().normalDialog(
              context,
              'Password False',
              'Password false please try again',
            );
          }
        }
      }
    });
  }

  Row buildUser(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.91,
          child: TextFormField(
            controller: userController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please Fill user in blank';
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              labelText: "User :",
              labelStyle: MyConstant().h4NmPmrCl(),
              prefixIcon: Icon(
                Icons.account_circle,
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
          margin: EdgeInsets.only(top: 16),
          width: size * 0.91,
          child: TextFormField(
            controller: passwordController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please Fill password in blank';
              } else {
                return null;
              }
            },
            obscureText: statusRedEye,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    statusRedEye = !statusRedEye;
                  });
                },
                icon: statusRedEye
                    ? Icon(Icons.remove_red_eye, color: MyConstant.primaryColor)
                    : Icon(
                        Icons.remove_red_eye_outlined,
                        color: MyConstant.primaryColor,
                      ),
              ),
              labelText: "Password :",
              labelStyle: MyConstant().h4NmPmrCl(),
              prefixIcon: Icon(
                Icons.key_outlined,
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

  Row buildAppName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShowTitle(
          title: MyConstant.appName,
          textStyle: MyConstant().h6BPmrCl(),
        ),
      ],
    );
  }

  Row buildImage(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 95),

          width: size * 0.6,
          child: ShowImage(path: MyConstant.img4),
        ),
      ],
    );
  }
}
