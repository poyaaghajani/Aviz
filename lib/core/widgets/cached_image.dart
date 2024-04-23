import 'package:aviz/core/constants/app_colors.dart';
import 'package:aviz/core/constants/app_radius.dart';
import 'package:aviz/core/constants/assets_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CachedImage extends StatelessWidget {
  final String? imageUrl;
  final BoxFit fit;
  const CachedImage({
    super.key,
    this.imageUrl,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: AppRadius.md,
      child: (imageUrl == null ||
              (!imageUrl!.endsWith('png') && !imageUrl!.endsWith('jpg')))
          ? Container(
              decoration: BoxDecoration(
                borderRadius: AppRadius.md,
                color: AppColors.grey200,
              ),
              child: Center(
                child: Image.asset(
                  AssetsManager.logo,
                  width: 90.w,
                ),
              ),
            )
          : CachedNetworkImage(
              imageUrl: imageUrl ?? '',
              fit: fit,
              placeholder: (context, url) {
                return Shimmer.fromColors(
                  baseColor: AppColors.grey300,
                  highlightColor: Colors.white,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: AppRadius.md,
                      color: Colors.white,
                    ),
                  ),
                );
              },
              errorWidget: (context, url, error) {
                return Container(
                  color: Colors.red,
                );
              },
            ),
    );
  }
}
