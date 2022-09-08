import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/core/constant/colors.dart';

class AppCachImage extends StatelessWidget {
  const AppCachImage({Key? key, required this.imageUrl}) : super(key: key);

  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.fill,
            colorFilter:
                const ColorFilter.mode(Colors.white, BlendMode.colorBurn),
          ),
        ),
      ),
      fit: BoxFit.fill,
      imageUrl: imageUrl,
      progressIndicatorBuilder: (context, url, downloadProgress) => Container(
        width: 10,
        height: 10,
        margin: const EdgeInsets.all(20),
        child: CircularProgressIndicator(
          value: downloadProgress.progress,
          color: Get.theme.secondaryHeaderColor,
          backgroundColor: Get.theme.primaryColor
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
