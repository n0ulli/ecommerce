import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageOnlineWidget extends StatelessWidget {
  double? height;
  double? width;
  ImageOnlineWidget({Key? key, this.height, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CachedNetworkImage(
        // placeholder: (context, url) => Center(
        //   child: Image.asset(ImageConstant.cart_logo),
        // ),
        imageUrl: 'https://mmc.tirto.id/image/otf/500x0/2020/12/11/orangtuan-jungle_ratio-16x9.jpg',
        imageBuilder: (context, imageProvider) => Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            // borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          ),
        ),
        // errorWidget: (context, url, error)=>Image.asset(ImageConstant.placeHolderElsimil),
        fit: BoxFit.cover,
      ),
    );
  }
}
