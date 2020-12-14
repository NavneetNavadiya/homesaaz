import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:homesaaz/app.dart';
import 'package:homesaaz/common/colorres.dart';
import 'package:homesaaz/common/common_widget.dart';
import 'package:homesaaz/common/util.dart';
import 'package:homesaaz/screen/home/home_screen_view_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  HomeScreenViewModel model;

  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    double width = media.width;
    double height = media.height;
    print("Current page --> $runtimeType");
    model ?? (model = HomeScreenViewModel(this));

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: ColorRes.primaryColor,
      appBar: AppBar(
        leading: InkWell(
          child: Image.asset(App.menuIcon),
          onTap: () => scaffoldKey.currentState.openDrawer(),
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
                margin: EdgeInsets.only(top: width*0.08,right: width*0.1),
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Image.asset(
                    App.cencelIcon,
                    //color: Colors.black,
                    height:30,
                    width: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 5),

            search(),
            SizedBox(height: 20),

            //Top Banner
            bannerShow(App.banner_top),
            SizedBox(height: 14),

            categories(),
            SizedBox(height: 25),

            //New Products
            newTrendingAndFeaturedProducts(context, App.newProductsName, model, 1),

            //Center Banner
            bannerShow(App.banner_center),
            SizedBox(height: 30),

            //Trending Products
            newTrendingAndFeaturedProducts(context, App.trendingProductsName, model, 2),

            //Bottom Banner
            bannerShow(App.banner_bottom),
            SizedBox(height: 30),

            //Featured Products
            newTrendingAndFeaturedProducts(context, App.featuredProductsName, model, 3),
          ],
        ),
      ),
    );
  }

  //search Field
  Widget search() {
    Size media = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: CustomTextFieldShadow(
          text: "Search Your Product",
          fieldController: null,
          name: "Search",
          obscureText: false,
          keyboartType: TextInputType.text,
          media: media),
    );
  }

  //Categories Details
  Widget categories() {
    return Column(
      children: [
        //Categories Title
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  App.categoriesName,
                  style: new TextStyle(
                      fontSize: 20,
                      color: ColorRes.charcoal,
                      fontFamily: 'NeueFrutigerWorld',
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.topRight,
                padding: EdgeInsets.only(right: 20),
                child: Text(
                  "See all",
                  style: new TextStyle(
                      fontSize: 14,
                      color: ColorRes.charcoal,
                      fontFamily: 'NeueFrutigerWorld',
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 15),

        //Categories Images
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 15),
          child: GridView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: model.categoriesImage.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 6.0,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 3),
                mainAxisSpacing: 15.0),
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFFF),
                      borderRadius: BorderRadius.circular(5.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 5.5,
                          spreadRadius: 1.5,
                          offset: Offset(4.4, 9.0),
                        ),
                      ],
                    ),
                    child: Image.asset(model.categoriesImage[index],
                        fit: BoxFit.cover),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: Center(
                      child: Text(
                        model.categoriesName[index],
                        style: new TextStyle(
                            fontSize: 12,
                            color: ColorRes.whiteColor,
                            fontFamily: 'NeueFrutigerWorld',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
