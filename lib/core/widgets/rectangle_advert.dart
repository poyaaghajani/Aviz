import 'package:aviz/core/constants/app_colors.dart';
import 'package:aviz/core/constants/app_radius.dart';
import 'package:aviz/core/constants/app_shadows.dart';
import 'package:aviz/core/extensions/price_formatter.dart';
import 'package:aviz/core/widgets/cached_image.dart';
import 'package:aviz/features/feat_home/data/models/advert_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RectangleAdvert extends StatelessWidget {
  const RectangleAdvert({
    super.key,
    required this.advert,
    required this.height,
  });

  final Advert advert;
  final double height;

  @override
  Widget build(BuildContext context) {
    final textTeme = Theme.of(context).textTheme;

    return InkWell(
      overlayColor: const MaterialStatePropertyAll(AppColors.grey300),
      borderRadius: BorderRadius.circular(4),
      onTap: () {},
      child: Ink(
        height: height,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: AppRadius.md,
          color: Colors.white,
          boxShadow: AppShadows.md,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                    maxLines: 2,
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
            const SizedBox(width: 16),
            SizedBox(
              width: 110.w,
              height: ScreenUtil().screenHeight,
              child: CachedImage(
                imageUrl: advert.baseImage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
