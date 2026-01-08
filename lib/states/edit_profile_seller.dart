import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoppingmall/models/user_model.dart';
import 'package:shoppingmall/utility/my_constant.dart';
import 'package:shoppingmall/widgets/show_image.dart';
import 'package:shoppingmall/widgets/show_progress.dart';
import 'package:shoppingmall/widgets/show_title.dart';

class EditProfileSeller extends StatefulWidget {
  const EditProfileSeller({super.key});

  @override
  State<EditProfileSeller> createState() => _EditProfileSellerState();
}

class _EditProfileSellerState extends State<EditProfileSeller> {
  UserModel? userModel;

  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  LatLng? latLng;
  File? file;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findUser();
    findLatLng();
    // findPosition();
  }

  Future<Null> findLatLng() async {
    Position? position = await findPosition();
    if (position != null) {
      setState(() {
        latLng = LatLng(position.latitude, position.longitude);
        print('lat  = ${latLng?.latitude}, lng  = ${latLng?.longitude}');
      });
    }
  }

  Future<Position?> findPosition() async {
    Position? position;
    try {
      position = await Geolocator.getCurrentPosition();
    } catch (e) {
      position = null;
    }
    return position;
  }

  Future<Null> findUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String user = preferences.getString('user')!;

    String apiGetUser =
        '${MyConstant.domain}/shoppingmall/getUserWhereUser.php?isAdd=true&user=$user';
    await Dio().get(apiGetUser).then((value) {
      print('value from API ==>> $value');
      for (var item in json.decode(value.data)) {
        setState(() {
          userModel = UserModel.fromMap(item);
          nameController.text = userModel!.name;
          addressController.text = userModel!.address;
          phoneController.text = userModel!.phone;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MyConstant.whColor,
      appBar: AppBar(
        backgroundColor: MyConstant.primaryColor,
        foregroundColor: MyConstant.whColor,
        title: Text('Edit profile Seller.'),
        actions: [
          IconButton(
            onPressed: () => processEditProfileSeller(),
            icon: Icon(Icons.edit, color: MyConstant.whColor),
            tooltip: 'Edit profile seller',
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          behavior: HitTestBehavior.opaque,
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      buildTitle('General'),
                      buildName(size),
                      buildAddress(size),
                      buildPhone(size),
                      buildTitle('Avatar'),
                      buildAvatar(size),
                      buildTitle('Location'),
                      buildMap(size),
                      buildButtonEditProfile(constraints),
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

  Future<Null> processEditProfileSeller() async {
    print('processEditProfileSeller Work');
    if (formKey.currentState!.validate()) {}
  }

  Container buildButtonEditProfile(BoxConstraints constraints) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 14),
      width: constraints.maxWidth * 0.95,
      child: ElevatedButton(
        style: MyConstant().myButtonSPmr1(),
        onPressed: () => processEditProfileSeller(),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Text('EDIT PROFILE', style: MyConstant().h4NmWCl()),
        ),
      ),
    );
  }

  Row buildMap(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: MyConstant.primaryColor),
          ),
          margin: EdgeInsets.symmetric(vertical: 16),
          width: size * 0.9,
          height: size * 0.78,
          child: latLng == null
              ? ShowProgress()
              : GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: latLng!,
                    zoom: 16,
                  ),
                  onMapCreated: (controller) {},
                  markers: <Marker>[
                    Marker(
                      markerId: MarkerId('id'),
                      position: latLng!,
                      infoWindow: InfoWindow(
                        title: 'Your Location',
                        snippet:
                            'lat  = ${latLng!.latitude}, lng  = ${latLng?.longitude}',
                      ),
                    ),
                  ].toSet(),
                ),
        ),
      ],
    );
  }

  Future<Null> createAvatar({ImageSource? source}) async {
    try {
      var result = await ImagePicker().pickImage(
        source: source!,
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Row(
            children: [
              IconButton(
                onPressed: () => createAvatar(source: ImageSource.camera),
                icon: Icon(
                  Icons.add_a_photo,
                  color: MyConstant.lightColor,
                  size: 32,
                ),
              ),
              Container(
                width: size * 0.68,
                height: size * 0.68,
                child: userModel == null
                    ? ShowProgress()
                    : Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: userModel?.avatar == null
                            ? ShowImage(path: MyConstant.imgAvatar)
                            : file == null
                            ? buildShowImageNetwork()
                            : Image.file(file!),
                      ),
              ),
              IconButton(
                onPressed: () => createAvatar(source: ImageSource.gallery),
                icon: Icon(
                  Icons.add_photo_alternate,
                  color: MyConstant.primaryColor,
                  size: 32,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  CachedNetworkImage buildShowImageNetwork() {
    return CachedNetworkImage(
      imageUrl: '${MyConstant.domain}${userModel!.avatar}',
      placeholder: (context, url) => ShowProgress(),
    );
  }

  Row buildName(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.91,
          child: TextFormField(
            controller: nameController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please Fill Name';
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              labelText: "Name",
              labelStyle: MyConstant().h4NmPmrCl(),
              prefixIcon: Icon(Icons.person, color: MyConstant.lightColor),
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

  Row buildAddress(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.91,
          child: TextFormField(
            maxLines: 4,
            controller: addressController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please Fill Address';
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              hintText: 'Address',
              hintStyle: MyConstant().h4NmPmrCl(),
              labelStyle: MyConstant().h4NmPmrCl(),
              prefixIcon: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 78),
                child: Icon(Icons.home_filled, color: MyConstant.lightColor),
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

  Row buildPhone(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 15),
          width: size * 0.91,
          child: TextFormField(
            controller: phoneController,
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please Fill Phone';
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              labelText: "Phone",
              labelStyle: MyConstant().h4NmPmrCl(),
              prefixIcon: Icon(Icons.person, color: MyConstant.lightColor),
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
}
