import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoppingmall/states/add_product.dart';
import 'package:shoppingmall/states/authen.dart';
import 'package:shoppingmall/states/buyer_service.dart';
import 'package:shoppingmall/states/create_account.dart';
import 'package:shoppingmall/states/edit_profile_seller.dart';
import 'package:shoppingmall/states/rider_service.dart';
import 'package:shoppingmall/states/seller_service.dart';
import 'package:shoppingmall/utility/my_constant.dart';

final Map<String, WidgetBuilder> map = {
  '/authen': (BuildContext context) => Authen(),
  '/createAccount': (BuildContext context) => CreateAccount(),
  '/buyerService': (BuildContext context) => BuyerService(),
  '/sellerService': (BuildContext context) => SellerService(),
  '/riderService': (BuildContext context) => RiderService(),
  '/addProduct': (BuildContext context) => AddProduct(),
  '/editProfileSeller': (BuildContext context) => EditProfileSeller(),
  // '/editProfileSeller': (BuildContext context) => EditProfileSeller(),
  // '/editProfileSeller': (BuildContext context) => EditProfileSeller(),
  // '/editProfileSeller': (BuildContext context) => EditProfileSeller(),
};

String? initlaRoute;

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String? type = preferences.getString('type');
  print('#### type ==>> $type');
  if (type?.isEmpty ?? true) {
    initlaRoute = MyConstant.routeAuthen;
    runApp(MyApp());
  } else {
    switch (type) {
      case 'buyer':
        initlaRoute = MyConstant.routeBuyerService;
        runApp(MyApp());
        break;
      case 'seller':
        initlaRoute = MyConstant.routeSellerService;
        runApp(MyApp());
        break;
      case 'rider':
        initlaRoute = MyConstant.routeRiderService;
        runApp(MyApp());
        break;
      default:
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    MaterialColor materialColor = MaterialColor(
      0xff1146a0,
      MyConstant.mapMaterialColor,
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: MyConstant.appName,
      routes: map,
      initialRoute: initlaRoute,
      theme: ThemeData(primarySwatch: materialColor),
    );
  }
}
