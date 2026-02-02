import 'package:flutter/material.dart';

class MyConstant {
  //General
  static String appName = 'Shopping Mall';
  static String domain = 'https://fd4e08e25c3d.ngrok-free.app';
  static String urlPrompay = 'https://promptpay.io/0818595309.png';
  static String publicKey = 'pkey_test_5pp9n4x6lu8v0riuskf';
  static String secreKey = 'skey_test_5pj6xiqsml00cgz0ze2';

  //Route
  static String routeAuthen = '/authen';
  static String routeCreateAccount = '/createAccount';
  static String routeBuyerService = '/buyerService';
  static String routeSellerService = '/sellerService';
  static String routeRiderService = '/riderService';
  static String routeAddProduct = '/addProduct';
  static String routeEditProfileSeller = '/editProfileSeller';
  static String routeShowCart = '/showCart';
  static String routeAddWallet = '/addWallet';
  static String routeConfrimAddWallet = '/navConfirmAddWallet';

  //Images
  static String img1 = 'assets/images/image1.webp';
  static String img2 = 'assets/images/image2.webp';
  static String img3 = 'assets/images/image3.webp';
  static String img4 = 'assets/images/image4.webp';
  static String img5 = 'assets/images/image5.png';

  static String imgAvatar = 'assets/images/user_Avatar.webp';

  //Colors
  static Color primaryColor = Color(0xff1E88E5);
  static Color lightColor = Color(0xff64b4f6);
  static Color darkColor = Color(0xff1146a0);
  static Color whColor = Color(0xffFFFFFF);
  static Color redColor = Colors.red;
  static Color greyColor = Colors.grey.shade300;
  static Color grey2Color = Colors.grey.shade500;
  static Color grey3Color = Colors.grey.shade50;
  static Color bkColor = Colors.black;
  static Color green1Color = Colors.green;
  static Color green2Color = Colors.lightGreenAccent;

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

  //Background
  BoxDecoration planBackground() =>
      BoxDecoration(color: MyConstant.lightColor.withOpacity(0.75));

  BoxDecoration gradintLinearBackground() => BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Colors.white, MyConstant.lightColor, MyConstant.lightColor],
    ),
  );

  BoxDecoration gradientRadioBackground() => BoxDecoration(
    gradient: RadialGradient(
      center: Alignment(0, -0.5),
      radius: 1.5,
      colors: [Colors.white, MyConstant.lightColor],
    ),
  );

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

  //+++++++++++++++++++++++++++++++++++++++++++//
  //Text Style Normal
  //+++++++++++++++++++++++++++++++++++++++++++//
  //light Color
  //+++++++++++++++++++++++++++++++++++++++++++//

  TextStyle h1NmLCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 6,
    fontWeight: FontWeight.normal,
    color: MyConstant.lightColor,
  );
  TextStyle h2NmLCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 8,
    fontWeight: FontWeight.normal,
    color: MyConstant.lightColor,
  );
  TextStyle h3NmLCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: MyConstant.lightColor,
  );
  TextStyle h4NmLCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: MyConstant.lightColor,
  );
  TextStyle h5NmLCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 18,
    fontWeight: FontWeight.normal,
    color: MyConstant.lightColor,
  );
  TextStyle h6NmLCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 24,
    fontWeight: FontWeight.normal,
    color: MyConstant.lightColor,
  );
  TextStyle h7NmLCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 28,
    fontWeight: FontWeight.normal,
    color: MyConstant.lightColor,
  );
  TextStyle h8NmLCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 32,
    fontWeight: FontWeight.normal,
    color: MyConstant.lightColor,
  );
  TextStyle h9NmLCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 36,
    fontWeight: FontWeight.normal,
    color: MyConstant.lightColor,
  );
  TextStyle h11NmLCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 42,
    fontWeight: FontWeight.normal,
    color: MyConstant.lightColor,
  );
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++//

  //+++++++++++++++++++++++++++++++++++++++++++//
  //Text Style Bold
  //+++++++++++++++++++++++++++++++++++++++++++//
  //light Color
  //+++++++++++++++++++++++++++++++++++++++++++//

  TextStyle h1BLCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 6,
    fontWeight: FontWeight.bold,
    color: MyConstant.lightColor,
  );
  TextStyle h2BLCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 8,
    fontWeight: FontWeight.bold,
    color: MyConstant.lightColor,
  );
  TextStyle h3BLCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: MyConstant.lightColor,
  );
  TextStyle h4BLCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: MyConstant.lightColor,
  );
  TextStyle h5BLCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: MyConstant.lightColor,
  );
  TextStyle h6BLCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: MyConstant.lightColor,
  );
  TextStyle h7BLCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: MyConstant.lightColor,
  );
  TextStyle h8BLCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: MyConstant.lightColor,
  );
  TextStyle h9BLCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: MyConstant.lightColor,
  );
  TextStyle h11BLCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 42,
    fontWeight: FontWeight.bold,
    color: MyConstant.lightColor,
  );
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++//

  //+++++++++++++++++++++++++++++++++++++++++++//
  //Text Style Normal
  //+++++++++++++++++++++++++++++++++++++++++++//
  //Dark Color
  //+++++++++++++++++++++++++++++++++++++++++++//

  TextStyle h1NmDrkCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 6,
    fontWeight: FontWeight.normal,
    color: MyConstant.darkColor,
  );
  TextStyle h2NmDrkCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 8,
    fontWeight: FontWeight.normal,
    color: MyConstant.darkColor,
  );
  TextStyle h3NmDrkCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: MyConstant.darkColor,
  );
  TextStyle h4NmDrkCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: MyConstant.darkColor,
  );
  TextStyle h5NmDrkCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 18,
    fontWeight: FontWeight.normal,
    color: MyConstant.darkColor,
  );
  TextStyle h6NmDrkCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 24,
    fontWeight: FontWeight.normal,
    color: MyConstant.darkColor,
  );
  TextStyle h7NmDrkCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 28,
    fontWeight: FontWeight.normal,
    color: MyConstant.darkColor,
  );
  TextStyle h8NmDrkCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 32,
    fontWeight: FontWeight.normal,
    color: MyConstant.darkColor,
  );
  TextStyle h9NmDrkCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 36,
    fontWeight: FontWeight.normal,
    color: MyConstant.darkColor,
  );
  TextStyle h11NmDrkCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 42,
    fontWeight: FontWeight.normal,
    color: MyConstant.darkColor,
  );
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++//

  //+++++++++++++++++++++++++++++++++++++++++++//
  //Text Style Bold
  //+++++++++++++++++++++++++++++++++++++++++++//
  //Dark Color
  //+++++++++++++++++++++++++++++++++++++++++++//

  TextStyle h1BDrkCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 6,
    fontWeight: FontWeight.bold,
    color: MyConstant.darkColor,
  );
  TextStyle h2BDrkCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 8,
    fontWeight: FontWeight.bold,
    color: MyConstant.darkColor,
  );
  TextStyle h3BDrkCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: MyConstant.darkColor,
  );
  TextStyle h4BDrkCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: MyConstant.darkColor,
  );
  TextStyle h5BDrkCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: MyConstant.darkColor,
  );
  TextStyle h6BDrkCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: MyConstant.darkColor,
  );
  TextStyle h7BDrkCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: MyConstant.darkColor,
  );
  TextStyle h8BDrkCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: MyConstant.darkColor,
  );
  TextStyle h9BDrkCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: MyConstant.darkColor,
  );
  TextStyle h11BDrkCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 42,
    fontWeight: FontWeight.bold,
    color: MyConstant.darkColor,
  );
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++//

  //+++++++++++++++++++++++++++++++++++++++++++//
  //Text Style Normal
  //+++++++++++++++++++++++++++++++++++++++++++//
  //White Color
  //+++++++++++++++++++++++++++++++++++++++++++//

  TextStyle h1NmWCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 6,
    fontWeight: FontWeight.normal,
    color: MyConstant.whColor,
  );
  TextStyle h2NmWCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 8,
    fontWeight: FontWeight.normal,
    color: MyConstant.whColor,
  );
  TextStyle h3NmWCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: MyConstant.whColor,
  );
  TextStyle h4NmWCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: MyConstant.whColor,
  );
  TextStyle h5NmWCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 18,
    fontWeight: FontWeight.normal,
    color: MyConstant.whColor,
  );
  TextStyle h6NmWCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 24,
    fontWeight: FontWeight.normal,
    color: MyConstant.whColor,
  );
  TextStyle h7NmWCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 28,
    fontWeight: FontWeight.normal,
    color: MyConstant.whColor,
  );
  TextStyle h8NmWCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 32,
    fontWeight: FontWeight.normal,
    color: MyConstant.whColor,
  );
  TextStyle h9NmWCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 36,
    fontWeight: FontWeight.normal,
    color: MyConstant.whColor,
  );
  TextStyle h11NmWCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 42,
    fontWeight: FontWeight.normal,
    color: MyConstant.whColor,
  );
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++//

  //+++++++++++++++++++++++++++++++++++++++++++//
  //Text Style Bold
  //+++++++++++++++++++++++++++++++++++++++++++//
  //White Color
  //+++++++++++++++++++++++++++++++++++++++++++//

  TextStyle h1BWCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 6,
    fontWeight: FontWeight.bold,
    color: MyConstant.whColor,
  );
  TextStyle h2BWCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 8,
    fontWeight: FontWeight.bold,
    color: MyConstant.whColor,
  );
  TextStyle h3BWCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: MyConstant.whColor,
  );
  TextStyle h4BWCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: MyConstant.whColor,
  );
  TextStyle h5BWCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: MyConstant.whColor,
  );
  TextStyle h6BWCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: MyConstant.whColor,
  );
  TextStyle h7BWCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: MyConstant.whColor,
  );
  TextStyle h8BWCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: MyConstant.whColor,
  );
  TextStyle h9BWCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: MyConstant.whColor,
  );
  TextStyle h11BWCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 42,
    fontWeight: FontWeight.bold,
    color: MyConstant.whColor,
  );
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++//

  //+++++++++++++++++++++++++++++++++++++++++++//
  //Text Style Normal
  //+++++++++++++++++++++++++++++++++++++++++++//
  //Red Color
  //+++++++++++++++++++++++++++++++++++++++++++//

  TextStyle h1NmRdCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 6,
    fontWeight: FontWeight.normal,
    color: MyConstant.redColor,
  );
  TextStyle h2NmRdCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 8,
    fontWeight: FontWeight.normal,
    color: MyConstant.redColor,
  );
  TextStyle h3NmRdCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: MyConstant.redColor,
  );
  TextStyle h4NmRdCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: MyConstant.redColor,
  );
  TextStyle h5NmRdCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 18,
    fontWeight: FontWeight.normal,
    color: MyConstant.redColor,
  );
  TextStyle h6NmRdCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 24,
    fontWeight: FontWeight.normal,
    color: MyConstant.redColor,
  );
  TextStyle h7NmRdCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 28,
    fontWeight: FontWeight.normal,
    color: MyConstant.redColor,
  );
  TextStyle h8NmRdCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 32,
    fontWeight: FontWeight.normal,
    color: MyConstant.redColor,
  );
  TextStyle h9NmRdCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 36,
    fontWeight: FontWeight.normal,
    color: MyConstant.redColor,
  );
  TextStyle h11NmRdCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 42,
    fontWeight: FontWeight.normal,
    color: MyConstant.redColor,
  );
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++//

  //+++++++++++++++++++++++++++++++++++++++++++//
  //Text Style Bold
  //+++++++++++++++++++++++++++++++++++++++++++//
  //Red Color
  //+++++++++++++++++++++++++++++++++++++++++++//

  TextStyle h1BRdCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 6,
    fontWeight: FontWeight.bold,
    color: MyConstant.redColor,
  );
  TextStyle h2BRdCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 8,
    fontWeight: FontWeight.bold,
    color: MyConstant.redColor,
  );
  TextStyle h3BRdCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: MyConstant.redColor,
  );
  TextStyle h4BRdCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: MyConstant.redColor,
  );
  TextStyle h5BRdCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: MyConstant.redColor,
  );
  TextStyle h6BRdCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: MyConstant.redColor,
  );
  TextStyle h7BRdCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: MyConstant.redColor,
  );
  TextStyle h8BRdCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: MyConstant.redColor,
  );
  TextStyle h9BRdCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: MyConstant.redColor,
  );
  TextStyle h11BRdCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 42,
    fontWeight: FontWeight.bold,
    color: MyConstant.redColor,
  );
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++//

  //+++++++++++++++++++++++++++++++++++++++++++//
  //Text Style Normal
  //+++++++++++++++++++++++++++++++++++++++++++//
  //Grey2 Color
  //+++++++++++++++++++++++++++++++++++++++++++//

  TextStyle h1NmGrey2Cl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 6,
    fontWeight: FontWeight.normal,
    color: MyConstant.grey2Color,
  );
  TextStyle h2NmGrey2Cl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 8,
    fontWeight: FontWeight.normal,
    color: MyConstant.grey2Color,
  );
  TextStyle h3NmGrey2Cl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: MyConstant.grey2Color,
  );
  TextStyle h4NmGrey2Cl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: MyConstant.grey2Color,
  );
  TextStyle h5NmGrey2Cl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 18,
    fontWeight: FontWeight.normal,
    color: MyConstant.grey2Color,
  );
  TextStyle h6NmGrey2Cl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 24,
    fontWeight: FontWeight.normal,
    color: MyConstant.grey2Color,
  );
  TextStyle h7NmGrey2Cl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 28,
    fontWeight: FontWeight.normal,
    color: MyConstant.grey2Color,
  );
  TextStyle h8NmGrey2Cl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 32,
    fontWeight: FontWeight.normal,
    color: MyConstant.grey2Color,
  );
  TextStyle h9NmGrey2Cl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 36,
    fontWeight: FontWeight.normal,
    color: MyConstant.grey2Color,
  );
  TextStyle h11NmGrey2Cl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 42,
    fontWeight: FontWeight.normal,
    color: MyConstant.grey2Color,
  );
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++//

  //+++++++++++++++++++++++++++++++++++++++++++//
  //Text Style Bold
  //+++++++++++++++++++++++++++++++++++++++++++//
  //Grey2 Color
  //+++++++++++++++++++++++++++++++++++++++++++//

  TextStyle h1BGrey2Cl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 6,
    fontWeight: FontWeight.bold,
    color: MyConstant.grey2Color,
  );
  TextStyle h2BGrey2Cl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 8,
    fontWeight: FontWeight.bold,
    color: MyConstant.grey2Color,
  );
  TextStyle h3BGrey2Cl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: MyConstant.grey2Color,
  );
  TextStyle h4BGrey2Cl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: MyConstant.grey2Color,
  );
  TextStyle h5BGrey2Cl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: MyConstant.grey2Color,
  );
  TextStyle h6BGrey2Cl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: MyConstant.grey2Color,
  );
  TextStyle h7BGrey2Cl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: MyConstant.grey2Color,
  );
  TextStyle h8BGrey2Cl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: MyConstant.grey2Color,
  );
  TextStyle h9BGrey2Cl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: MyConstant.grey2Color,
  );
  TextStyle h11BGrey2Cl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 42,
    fontWeight: FontWeight.bold,
    color: MyConstant.grey2Color,
  );
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++//

  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++//

  //+++++++++++++++++++++++++++++++++++++++++++//
  //Text Style Normal
  //+++++++++++++++++++++++++++++++++++++++++++//
  //Black Color
  //+++++++++++++++++++++++++++++++++++++++++++//

  TextStyle h1NmBkCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 6,
    fontWeight: FontWeight.normal,
    color: MyConstant.bkColor,
  );
  TextStyle h2NmBkCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 8,
    fontWeight: FontWeight.normal,
    color: MyConstant.bkColor,
  );
  TextStyle h3NmBkCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: MyConstant.bkColor,
  );
  TextStyle h4NmBkCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: MyConstant.bkColor,
  );
  TextStyle h5NmBkCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 18,
    fontWeight: FontWeight.normal,
    color: MyConstant.bkColor,
  );
  TextStyle h6NmBkCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 24,
    fontWeight: FontWeight.normal,
    color: MyConstant.bkColor,
  );
  TextStyle h7NmBkCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 28,
    fontWeight: FontWeight.normal,
    color: MyConstant.bkColor,
  );
  TextStyle h8NmBkCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 32,
    fontWeight: FontWeight.normal,
    color: MyConstant.bkColor,
  );
  TextStyle h9NmBkCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 36,
    fontWeight: FontWeight.normal,
    color: MyConstant.bkColor,
  );
  TextStyle h11NmBkCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 42,
    fontWeight: FontWeight.normal,
    color: MyConstant.bkColor,
  );
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++//

  //+++++++++++++++++++++++++++++++++++++++++++//
  //Text Style Bold
  //+++++++++++++++++++++++++++++++++++++++++++//
  //Black Color
  //+++++++++++++++++++++++++++++++++++++++++++//

  TextStyle h1BBkCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 6,
    fontWeight: FontWeight.bold,
    color: MyConstant.bkColor,
  );
  TextStyle h2BBkCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 8,
    fontWeight: FontWeight.bold,
    color: MyConstant.bkColor,
  );
  TextStyle h3BBkCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: MyConstant.bkColor,
  );
  TextStyle h4BBkCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: MyConstant.bkColor,
  );
  TextStyle h5BBkCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: MyConstant.bkColor,
  );
  TextStyle h6BBkCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: MyConstant.bkColor,
  );
  TextStyle h7BBkCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: MyConstant.bkColor,
  );
  TextStyle h8BBkCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: MyConstant.bkColor,
  );
  TextStyle h9BBkCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: MyConstant.bkColor,
  );
  TextStyle h11BBkCl() => TextStyle(
    fontFamily: 'NotoSansLao',
    fontSize: 42,
    fontWeight: FontWeight.bold,
    color: MyConstant.bkColor,
  );
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++//

  //Button style
  //Primary color
  ButtonStyle myButtonSPmr1() => ElevatedButton.styleFrom(
    backgroundColor: MyConstant.primaryColor,
    foregroundColor: MyConstant.whColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
  );
  //Button style
  //Light color
  ButtonStyle myButtonSL2() => ElevatedButton.styleFrom(
    backgroundColor: MyConstant.lightColor,
    foregroundColor: MyConstant.whColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
  );
  //Button style
  //Dark color
  ButtonStyle myButtonSDrk3() => ElevatedButton.styleFrom(
    backgroundColor: MyConstant.darkColor,
    foregroundColor: MyConstant.whColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
  );
}
