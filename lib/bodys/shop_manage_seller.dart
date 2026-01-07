import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shoppingmall/models/user_model.dart';
import 'package:shoppingmall/utility/my_constant.dart';
import 'package:shoppingmall/widgets/show_progress.dart';
import 'package:shoppingmall/widgets/show_title.dart';

class ShopManageSeller extends StatefulWidget {
  final UserModel userModel;
  const ShopManageSeller({super.key, required this.userModel});

  @override
  State<ShopManageSeller> createState() => _ShopManageSellerState();
}

class _ShopManageSellerState extends State<ShopManageSeller> {
  UserModel? userModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userModel = widget.userModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            alignment: Alignment.bottomRight,
            height: 78,
            width: 78,
            child: FloatingActionButton(
              backgroundColor: MyConstant.primaryColor,
              child: Text('Edit', style: MyConstant().h4BWCl()),
              onPressed: () => Navigator.pushNamed(
                context,
                MyConstant.routeEditProfileSeller,
              ),
            ),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShowTitle(
                  title: 'Name shop',
                  textStyle: MyConstant().h5BPmrCl(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: constraints.maxWidth * 0.3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ShowTitle(
                          title: userModel!.name,
                          textStyle: MyConstant().h4NmPmrCl(),
                        ),
                      ),
                    ),
                  ],
                ),
                ShowTitle(title: 'Address', textStyle: MyConstant().h5BPmrCl()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: constraints.maxWidth * 0.3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ShowTitle(
                          title: userModel!.address,
                          textStyle: MyConstant().h4NmPmrCl(),
                        ),
                      ),
                    ),
                  ],
                ),
                ShowTitle(title: 'Phone', textStyle: MyConstant().h5BPmrCl()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: constraints.maxWidth * 0.3,
                      child: ShowTitle(
                        title: '${userModel!.phone}',
                        textStyle: MyConstant().h4NmPmrCl(),
                      ),
                    ),
                  ],
                ),
                ShowTitle(title: 'Avatar', textStyle: MyConstant().h5BPmrCl()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: constraints.maxWidth * 0.6,
                      margin: EdgeInsets.symmetric(vertical: 24),
                      child: CachedNetworkImage(
                        imageUrl: '${MyConstant.domain}${userModel!.avatar}',
                        placeholder: (context, url) => ShowProgress(),
                      ),
                    ),
                  ],
                ),
                ShowTitle(
                  title: 'Location',
                  textStyle: MyConstant().h5BPmrCl(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 15, bottom: 65),
                      width: constraints.maxWidth * 0.9,
                      height: constraints.maxWidth * 0.8,
                      child: GoogleMap(
                        initialCameraPosition: CameraPosition(
                          target: LatLng(
                            double.parse(userModel!.lat),
                            double.parse(userModel!.lng),
                          ),
                          zoom: 18,
                        ),
                        markers: <Marker>[
                          Marker(
                            markerId: MarkerId('id'),
                            position: LatLng(
                              double.parse(userModel!.lat),
                              double.parse(userModel!.lng),
                            ),
                            infoWindow: InfoWindow(
                              title: 'Your location here.',
                              snippet:
                                  'lat = ${userModel!.lat}, lng = ${userModel!.lng}',
                            ),
                          ),
                        ].toSet(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
