import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shoppingmall/utility/my_constant.dart';
import 'package:shoppingmall/utility/my_dialog.dart';
import 'package:shoppingmall/widgets/show_image.dart';
import 'package:shoppingmall/widgets/show_progress.dart';
import 'package:shoppingmall/widgets/show_title.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  String? typeUser;
  String avatar = '';
  File? file;
  double? lat, lng;
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    checkPermission();
  }

  Future<Null> checkPermission() async {
    bool locationService;
    LocationPermission locationPermission;

    locationService = await Geolocator.isLocationServiceEnabled();
    if (locationService) {
      print('Service Location is open');

      locationPermission = await Geolocator.checkPermission();
      if (locationPermission == LocationPermission.denied) {
        locationPermission == await Geolocator.requestPermission();
        if (locationPermission == LocationPermission.deniedForever) {
          MyDialog().alertLocationService(
            context,
            'ບໍ່ອານຸຍາດແຊຣ Location',
            'ສະແດງ Location',
          );
        } else {
          //Find LatLng
          findLatLng();
        }
      } else {
        if (locationPermission == LocationPermission.deniedForever) {
          MyDialog().alertLocationService(
            context,
            'ບໍ່ອານຸຍາດແຊຣ Location',
            'ສະແດງ Location',
          );
        } else {
          //Find LatLng
          findLatLng();
        }
      }
    } else {
      print('Service Location is close');
      MyDialog().alertLocationService(
        context,
        'Location service ປີດຢູ່ !',
        'ກະລຸນາເປີດ Location service.',
      );
    }
  }

  Future<Null> findLatLng() async {
    print('findLatLng ==>> Work');
    Position? position = await findPosition();
    setState(() {
      lat = position!.latitude;
      lng = position.longitude;
      print('lat = $lat, lng = $lng');
    });
  }

  Future<Position?> findPosition() async {
    Position position;

    try {
      position = await Geolocator.getCurrentPosition();
      return position;
    } catch (e) {
      return null;
    }
  }

  Row buildName(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 0.0),
          width: size * 0.91,
          child: TextFormField(
            controller: nameController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter name';
              } else {}
            },
            decoration: InputDecoration(
              labelText: "name",
              labelStyle: MyConstant().h4NmPmrCl(),
              prefixIcon: Icon(
                Icons.fingerprint,
                color: MyConstant.primaryColor,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.primaryColor),
                borderRadius: BorderRadius.circular(9.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.lightColor, width: 2),
                borderRadius: BorderRadius.circular(9.0),
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
            controller: addressController,
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
            controller: phoneController,
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter phone';
              } else {}
            },
            decoration: InputDecoration(
              labelText: "phone",
              labelStyle: MyConstant().h4NmPmrCl(),
              prefixIcon: Icon(Icons.phone, color: MyConstant.primaryColor),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.primaryColor),
                borderRadius: BorderRadius.circular(9.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.lightColor, width: 2),
                borderRadius: BorderRadius.circular(9.0),
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
            controller: userController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter user';
              } else {}
            },
            decoration: InputDecoration(
              labelText: "user",
              labelStyle: MyConstant().h4NmPmrCl(),
              prefixIcon: Icon(
                Icons.supervised_user_circle,
                color: MyConstant.primaryColor,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.primaryColor),
                borderRadius: BorderRadius.circular(9.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.lightColor, width: 2),
                borderRadius: BorderRadius.circular(9.0),
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
            controller: passwordController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter password';
              } else {}
            },
            decoration: InputDecoration(
              labelText: "password",
              labelStyle: MyConstant().h4NmPmrCl(),
              prefixIcon: Icon(Icons.key, color: MyConstant.primaryColor),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.primaryColor),
                borderRadius: BorderRadius.circular(9.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.lightColor, width: 2),
                borderRadius: BorderRadius.circular(9.0),
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
        actions: [builCreateNewAccount()],
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
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  buildTitlle('General information'),
                  buildName(size),
                  buildTitlle('Type user'),
                  buildRadioBuyer(size),
                  buildRadioSeller(size),
                  buildRadioRider(size),
                  buildTitlle('Residence information'),
                  buildAddress(size),
                  buildPhone(size),
                  buildUser(size),
                  buildPassword(size),
                  buildTitlle('Image'),
                  buildSubTitle(),
                  buildAvatar(size),
                  buildTitlle('Show your location'),
                  buildMap(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  IconButton builCreateNewAccount() {
    return IconButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          if (typeUser == null) {
            print('Non choose type user');
            MyDialog().normalDialog(
              context,
              'User type not selected yet',
              'Please select a user type.',
            );
          } else {
            print('Process insert to database');
            uploadPictureAndInsertData();
          }
        }
      },
      icon: Icon(Icons.cloud_upload_outlined, size: 9.0),
    );
  }

  Future<Null> uploadPictureAndInsertData() async {
    String name = nameController.text;
    String address = addressController.text;
    String phone = phoneController.text;
    String user = userController.text;
    String password = passwordController.text;

    print(
      '## name = $name, address = $address, phone = $phone, user = $user, password = $password',
    );
    String path =
        '${MyConstant.domain}/shoppingmall/getUserWhereUser.php?isAdd=true&user=$user';
    await Dio().get(path).then((value) async {
      print('value ==>> $value');
      if (value.toString() == 'null') {
        print('## user Ok');

        if (file == null) {
          // No Avatar
          processInsertMySQL(
            name: name,
            address: address,
            phone: phone,
            user: user,
            password: password,
          );
        } else {
          // Have Avatar
          print('#### process Upload Avatar');

          String apiSaveAvatar =
              '${MyConstant.domain}/shoppingmall/saveAvatar.php';
          int i = Random().nextInt(100000);
          String nameAvatar = 'avatar$i.jpg';
          Map<String, dynamic> map = Map();
          map['file'] = await MultipartFile.fromFile(
            file!.path,
            filename: nameAvatar,
          );
          FormData data = FormData.fromMap(map);

          await Dio().post(apiSaveAvatar, data: data).then((value) {
            avatar = '/shoppingmall/avatar/$nameAvatar';
            processInsertMySQL(
              name: name,
              address: address,
              phone: phone,
              user: user,
              password: password,
            );
          });
        }
      } else {
        MyDialog().normalDialog(
          context,
          'User False !!!',
          'Please Change User',
        );
      }
    });
  }

  Future<Null> processInsertMySQL({
    String? name,
    String? address,
    String? phone,
    String? user,
    String? password,
  }) async {
    print('#### processInsertMySQL is Work and avatar ==>> $avatar');
    String apiInsertUser =
        '${MyConstant.domain}/shoppingmall/insertUser.php?isAdd=true&name=$name&type=$typeUser&address=$address&phone=$phone&user=$user&password=$password&avatar=$avatar&lat=$lat&lng=$lng';
    await Dio().get(apiInsertUser).then((value) {
      if (value.toString() == 'true') {
        Navigator.pop(context);
      } else {
        MyDialog().normalDialog(
          context,
          'Create new user false !!!!',
          'Please try again',
        );
      }
    });
  }

  Set<Marker> setMarker() => <Marker>[
    Marker(
      markerId: MarkerId('id'),
      position: LatLng(lat!, lng!),
      infoWindow: InfoWindow(
        title: 'You here',
        snippet: 'Lat = $lat, lng = $lng',
      ),
    ),
  ].toSet();

  Widget buildMap() => Container(
    width: double.infinity,
    height: 300,
    child: lat == null
        ? ShowProgress()
        : GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(lat!, lng!),
              zoom: 16,
            ),
            onMapCreated: (controller) {},
            markers: setMarker(),
          ),
  );

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
            value: "rider",
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
