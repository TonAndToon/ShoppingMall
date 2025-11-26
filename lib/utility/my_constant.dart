import 'package:flutter/material.dart';

class MyConstant {
  //General
  static String appName = 'Shopping Mall';

  //Route
  static String routeAuthen = '/authen';
  static String routeCreateAccount = '/createAccount';
  static String routeBuyerService = '/buyerService';
  static String routeSellerService = '/sellerService';
  static String routeRiderService = '/riderService';

  //Images
  static String img1 = 'assets/images/image1.webp';
  static String img2 = 'assets/images/image2.webp';
  static String img3 = 'assets/images/image3.webp';
  static String img4 = 'assets/images/image4.webp';

  //Colors
  static Color primaryColor = Color(0xff1E88E5);
  static Color lightColor = Color(0xff64b4f6);
  static Color darkColor = Color(0xff1146a0);
  static Color whColor = Color(0xffFFFFFF);
  static Color redColor = Colors.red;
  static Color greyColor = Colors.grey.shade300;
  static Color bkColor = Colors.black;

  static Map<int, Color> mapMaterialColor = {
    50: Color.fromRGBO(30, 136, 229, 0.1),
    100: Color.fromRGBO(30, 136, 229, 0.2),
    200: Color.fromRGBO(30, 136, 229, 0.3),
    300: Color.fromRGBO(30, 136, 229, 0.4),
    400: Color.fromRGBO(30, 136, 229, 0.5),
    500: Color.fromRGBO(30, 136, 229, 0.6),
    600: Color.fromRGBO(30, 136, 229, 0.7),
    700: Color.fromRGBO(30, 136, 229, 0.8),
    800: Color.fromRGBO(30, 136, 229, 0.9),
    900: Color.fromRGBO(30, 136, 229, 1.0),
  };
  //+++++++++++++++++++++++++++++++++++++++++++//
  //Text Style Normal
  //+++++++++++++++++++++++++++++++++++++++++++//
  //Primary Color
  //+++++++++++++++++++++++++++++++++++++++++++//

  TextStyle h1NmPmrCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 6,
    fontWeight: FontWeight.normal,
    color: MyConstant.primaryColor,
  );
  TextStyle h2NmPmrCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 8,
    fontWeight: FontWeight.normal,
    color: MyConstant.primaryColor,
  );
  TextStyle h3NmPmrCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: MyConstant.primaryColor,
  );
  TextStyle h4NmPmrCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: MyConstant.primaryColor,
  );
  TextStyle h5NmPmrCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 18,
    fontWeight: FontWeight.normal,
    color: MyConstant.primaryColor,
  );
  TextStyle h6NmPmrCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 24,
    fontWeight: FontWeight.normal,
    color: MyConstant.primaryColor,
  );
  TextStyle h7NmPmrCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 28,
    fontWeight: FontWeight.normal,
    color: MyConstant.primaryColor,
  );
  TextStyle h8NmPmrCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 32,
    fontWeight: FontWeight.normal,
    color: MyConstant.primaryColor,
  );
  TextStyle h9NmPmrCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 36,
    fontWeight: FontWeight.normal,
    color: MyConstant.primaryColor,
  );
  TextStyle h11NmPmrCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 42,
    fontWeight: FontWeight.normal,
    color: MyConstant.primaryColor,
  );
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++//

  //+++++++++++++++++++++++++++++++++++++++++++//
  //Text Style Bold
  //+++++++++++++++++++++++++++++++++++++++++++//
  //Primary Color
  //+++++++++++++++++++++++++++++++++++++++++++//

  TextStyle h1BPmrCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 6,
    fontWeight: FontWeight.bold,
    color: MyConstant.primaryColor,
  );
  TextStyle h2BPmrCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 8,
    fontWeight: FontWeight.bold,
    color: MyConstant.primaryColor,
  );
  TextStyle h3BPmrCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: MyConstant.primaryColor,
  );
  TextStyle h4BPmrCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: MyConstant.primaryColor,
  );
  TextStyle h5BPmrCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: MyConstant.primaryColor,
  );
  TextStyle h6BPmrCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: MyConstant.primaryColor,
  );
  TextStyle h7BPmrCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: MyConstant.primaryColor,
  );
  TextStyle h8BPmrCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: MyConstant.primaryColor,
  );
  TextStyle h9BPmrCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: MyConstant.primaryColor,
  );
  TextStyle h11BPmrCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 42,
    fontWeight: FontWeight.bold,
    color: MyConstant.primaryColor,
  );
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++//
  //Button style
  ButtonStyle myButtonStyle() => ElevatedButton.styleFrom(
    backgroundColor: MyConstant.primaryColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  );
}
