import 'package:aviz/core/constants/app_colors.dart';
import 'package:aviz/core/constants/app_radius.dart';
import 'package:aviz/core/constants/app_shadows.dart';
import 'package:aviz/core/extensions/price_formatter.dart';
import 'package:aviz/core/widgets/cached_image.dart';
import 'package:aviz/features/feat_home/data/models/advert_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SquareAdvert extends StatelessWidget {
  const SquareAdvert({
    super.key,
    required this.advert,
    this.width,
    this.onTap,
    this.padding,
  });

  final Advert advert;
  final double? width;
  final void Function()? onTap;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final textTeme = Theme.of(context).textTheme;

    return InkWell(
      overlayColor: const MaterialStatePropertyAll(AppColors.grey300),
      borderRadius: BorderRadius.circular(4),
      onTap: onTap,
      child: Ink(
        padding: padding ?? const EdgeInsets.all(16),
        width: width,
        decoration: BoxDecoration(
          borderRadius: AppRadius.md,
          color: Colors.white,
          boxShadow: AppShadows.md,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: SizedBox(
                height: 112.h,
                width: ScreenUtil().screenWidth,
                child: CachedImage(
                  imageUrl: advert.baseImage,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: Text(
                advert.title ?? '- - -',
                style: textTeme.bodySmall,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              advert.description ?? '- - -',
              style: textTeme.displaySmall,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'قیمت:',
                  style: textTeme.titleSmall,
                ),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: 130.w,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: AppRadius.sm,
                    color: AppColors.grey100,
                  ),
                  child: Text(
                    advert.price!.priceFormatter(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTeme.titleSmall!.apply(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
