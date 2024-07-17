import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/assets_manager.dart';
import 'loading_indicator_widget.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({super.key, required this.imageUrl,this.height,this.width,this.boxFit});
  final String? imageUrl;
  final double? height;
  final double? width;
  final BoxFit? boxFit ;
  @override
  Widget build(BuildContext context) {
    return imageUrl != null
        ? CachedNetworkImage(
            imageBuilder: (context, imageProvider) => ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
                child: Image(image: imageProvider,fit:boxFit ??  BoxFit.fill,matchTextDirection: true,width:width ?? 89.w ,height: height ?? 113.h,)),
            imageUrl: imageUrl ?? "",
            placeholder: (context, url) => const Center(
              child: LoadingIndicatorWidget(
                isCircular: true,
              ),
            ),
            errorWidget: (context, url, error) => const CustomImageError())
        : const CustomImageError();
  }
}

class CustomImageError extends StatelessWidget {
  const CustomImageError({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.w,
      height: 50.h,
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
      ),
      child: SvgPicture.asset(fit: BoxFit.fill,
        AssetsManager.personIcon,
        height: 50.h,
        width: 50.w,
      ),
    );
  }
}

