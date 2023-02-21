import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tokoonline/constant/decoration_constant.dart';
import 'package:tokoonline/constant/text_constant.dart';
import 'package:tokoonline/widget/material/button_green_widget.dart';

class DetailProductScreen extends StatelessWidget {
  const DetailProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Adidas Forum Low CL', style: TextConstant.medium.copyWith(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),),
        elevation: 0,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: 'https://assets.adidas.com/images/w_600,f_auto,q_auto/dd5856ece5894f9987e9ae890026a723_9366/Forum_Low_CL_Shoes_White_HQ6874_01_standard.jpg',
                imageBuilder: (context, imageProvider) => Container(
                  width: double.infinity,
                  height: size.height * 0.35,
                  decoration: BoxDecoration(
                    // shape: BoxShape.circle,
                    image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text('Adidas Forum Low CL', style: TextConstant.medium.copyWith(color: Colors.black87, fontSize: 18, fontWeight: FontWeight.w500),),
                    SizedBox(height: 5),
                    Text('Rp 1.000.000', style: TextConstant.medium.copyWith(color: Colors.black87, fontSize: 15, fontWeight: FontWeight.w500),),
                    SizedBox(height: 25),
                    Text('Keterangan Produk', style: TextConstant.medium.copyWith(color: Colors.black87, fontSize: 15, fontWeight: FontWeight.w500),),
                    SizedBox(height: 5),
                    Text('ini merupakan keterangan produk', style: TextConstant.medium.copyWith(color: Colors.black87,),),

                  ],
                ),
              )
              
            ],
          ),
        ),
      ),
      bottomNavigationBar: Wrap(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(CupertinoIcons.cart, size: 30,),
                SizedBox(width: size.width * 0.15),
                Container(
                  width: size.width * 0.27,
                  child: buttonBuy(),
                ),
                SizedBox(width: 10),
                Container(
                  width: size.width * 0.35,
                  child: buttonCart(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  buttonBuy(){
    return GestureDetector(
      onTap: (){},
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 12),
        decoration: DecorationConstant.boxButton(radius: 8, color: Colors.green),
        child: Center(
          child: Text('Beli Sekarang', style: TextConstant.regular.copyWith(fontSize: 12, color: Colors.white)),
        ),
      ),
    );
  }

  buttonCart(){
    return GestureDetector(
      onTap: (){},
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 12),
        decoration: DecorationConstant.boxButtonBorder(radius: 8, color: Colors.white, colorBorder: Colors.green, widthBorder: 1),
        child: Center(
          child: Text('Masukkan ke Keranjang', style: TextConstant.regular.copyWith(fontSize: 12, color: Colors.green)),
        ),
      ),
    );
  }
}
