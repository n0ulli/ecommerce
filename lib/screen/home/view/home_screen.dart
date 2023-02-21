import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tokoonline/constant/decoration_constant.dart';
import 'package:tokoonline/constant/image_constant.dart';
import 'package:tokoonline/constant/text_constant.dart';
import 'package:tokoonline/widget/cart/item_cart_widget.dart';
import 'package:tokoonline/widget/home/header_home_widget.dart';
import 'package:tokoonline/widget/home/list_cart_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox(height: size.height * 0.035,),
            HeaderHomeWidget(),
            ListCartWidget(title: 'Produk Baru'),
            ListCartWidget(title: 'Sepatu'),
            ListCartWidget(title: 'Tas'),

          ],
        ),
      ),
    );
  }
}
