import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:homesaaz/app.dart';
import 'package:homesaaz/common/colorres.dart';
import 'package:homesaaz/common/common_route.dart';
import 'package:homesaaz/screen/profile/profile_screen_view_model.dart';

import 'create_address_screen_view_model.dart';

class CreateAddressScreen extends StatefulWidget {
  @override
  CreateAddressScreenState createState() => CreateAddressScreenState();
}

class CreateAddressScreenState extends State<CreateAddressScreen> {
  CreateAddressScreenViewModel model;

  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    double width = media.width;
    double height = media.height;
    print("Current page --> $runtimeType");
    model ?? (model = CreateAddressScreenViewModel(this));
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: ColorRes.primaryColor,
      appBar: AppBar(
        leading: InkWell(
          child: Image.asset(App.backArrow),
          onTap: () => Navigator.pop(context),
        ),
        elevation: 0,
        backgroundColor: ColorRes.primaryColor,
        actions: [
          InkWell(child: Image.asset(App.userIcon)),
          Image.asset(App.cartIcon),
        ],
      ),
      drawer: Scaffold(
        backgroundColor: ColorRes.whisper,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                height: height * 0.8,
                width: width * width,
                color: ColorRes.primaryColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text(
                          "Home",
                          style: new TextStyle(
                            fontSize: 20,
                            color: ColorRes.dimGray,
                            fontFamily: 'NeueFrutigerWorld',
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        //        gotoSeeAllScreen(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text(
                          "Profile",
                          style: new TextStyle(
                            fontSize: 20,
                            color: ColorRes.dimGray,
                            fontFamily: 'NeueFrutigerWorld',
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text(
                          "My Cart",
                          style: new TextStyle(
                            fontSize: 20,
                            color: ColorRes.dimGray,
                            fontFamily: 'NeueFrutigerWorld',
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text(
                          "Favorite",
                          style: new TextStyle(
                            fontSize: 20,
                            color: ColorRes.dimGray,
                            fontFamily: 'NeueFrutigerWorld',
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text(
                          "My Orders",
                          style: new TextStyle(
                            fontSize: 20,
                            color: ColorRes.dimGray,
                            fontFamily: 'NeueFrutigerWorld',
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text(
                          "Help",
                          style: new TextStyle(
                            fontSize: 20,
                            color: ColorRes.dimGray,
                            fontFamily: 'NeueFrutigerWorld',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: width * 0.08, right: width * 0.1),
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Image.asset(
                    App.cencelIcon,
                    //color: Colors.black,
                    height: 30,
                    width: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text(
                "Create Address",
                style: new TextStyle(
                  fontSize: 22,
                  color: ColorRes.charcoal,
                  fontFamily: 'NeueFrutigerWorld',
                ),
              ),
              SizedBox(height: 30),
              profileDetails(),
            ],
          ),
        ),
      ),
    );
  }

  profileDetails(){
    Size media = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //name
            Text(
              'Name',
              style: TextStyle(
                fontFamily: 'NeueFrutigerWorld',
                fontSize: 15,
                color: ColorRes.dimGray,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: media.width * 0.06),
              child: TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade100),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade100),
                  ),
                  filled: true,
                  fillColor: const Color(0xFFFFFFFF),
                  hintText: 'Rakesh Patwal',
                  hintStyle: TextStyle(
                    fontFamily: 'NeueFrutigerWorld',
                    fontSize: 15,
                    color: ColorRes.charcoal,
                  ),
                  contentPadding: EdgeInsets.only(left: 0.0,bottom: 10),
                ),
              ),
            ),
            SizedBox(height: 20),

            //Address lane
            Text(
              'Address lane',
              style: TextStyle(
                fontFamily: 'NeueFrutigerWorld',
                fontSize: 15,
                color: ColorRes.dimGray,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: media.width * 0.06),
              child: TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade100),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade100),
                  ),
                  filled: true,
                  fillColor: const Color(0xFFFFFFFF),
                  hintText: 'Shewrapara 958',
                  hintStyle: TextStyle(
                    fontFamily: 'NeueFrutigerWorld',
                    fontSize: 15,
                    color: ColorRes.charcoal,
                  ),
                  contentPadding: EdgeInsets.only(left: 0.0,bottom: 10),
                ),
              ),
            ),
            SizedBox(height: 20),

            //City
            Text(
              'City',
              style: TextStyle(
                fontFamily: 'NeueFrutigerWorld',
                fontSize: 15,
                color: ColorRes.dimGray,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: media.width * 0.06),
              child: TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade100),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade100),
                  ),
                  filled: true,
                  fillColor: const Color(0xFFFFFFFF),
                  hintText: 'Delhi',
                  hintStyle: TextStyle(
                    fontFamily: 'NeueFrutigerWorld',
                    fontSize: 15,
                    color: ColorRes.charcoal,
                  ),
                  contentPadding: EdgeInsets.only(left: 0.0,bottom: 10),
                ),
              ),
            ),
            SizedBox(height: 20),

            //Gender
            Text(
              'Postal Code',
              style: TextStyle(
                fontFamily: 'NeueFrutigerWorld',
                fontSize: 15,
                color: ColorRes.dimGray,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: media.width * 0.06),
              child: TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade100),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade100),
                  ),
                  filled: true,
                  fillColor: const Color(0xFFFFFFFF),
                  hintText: '110065',
                  hintStyle: TextStyle(
                    fontFamily: 'NeueFrutigerWorld',
                    fontSize: 15,
                    color: ColorRes.charcoal,
                  ),
                  contentPadding: EdgeInsets.only(left: 0.0,bottom: 10),
                ),
              ),
            ),
            SizedBox(height: 20),



            //Phone Number
            Text(
              'Phone Number',
              style: TextStyle(
                fontFamily: 'NeueFrutigerWorld',
                fontSize: 15,
                color: ColorRes.dimGray,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: media.width * 0.06),
              child: TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade100),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade100),
                  ),
                  filled: true,
                  fillColor: const Color(0xFFFFFFFF),
                  hintText: '+91 9958 314 088',
                  hintStyle: TextStyle(
                    fontFamily: 'NeueFrutigerWorld',
                    fontSize: 15,
                    color: ColorRes.charcoal,
                  ),
                  contentPadding: EdgeInsets.only(left: 0.0,bottom: 10),
                ),
              ),
            ),
            SizedBox(height: 20),

          ],
        )
      ],
    );
  }
}
