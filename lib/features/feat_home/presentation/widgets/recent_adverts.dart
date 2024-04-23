import 'package:aviz/core/constants/app_colors.dart';
import 'package:aviz/core/constants/app_margins.dart';
import 'package:aviz/core/constants/app_radius.dart';
import 'package:aviz/core/constants/app_shadows.dart';
import 'package:aviz/core/extensions/price_formatter.dart';
import 'package:aviz/core/widgets/cached_image.dart';
import 'package:aviz/features/feat_home/data/models/advert_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeRecentAdverts extends StatelessWidget {
  const HomeRecentAdverts({
    super.key,
    required this.allAdverts,
  });

  final List<Advert> allAdverts;

  @override
  Widget build(BuildContext context) {
    final textTeme = Theme.of(context).textTheme;

    return SliverPadding(
      padding: EdgeInsets.only(
        left: AppMargins.bodyManinMargin,
        right: AppMargins.bodyManinMargin,
        bottom: 16.h,
      ),
      sliver: SliverList.separated(
        itemCount: allAdverts.length,
        separatorBuilder: (context, index) => SizedBox(height: 16.h),
        itemBuilder: (context, index) {
          return Container(
            height: 140.h,
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
                          allAdverts[index].title ?? '- - -',
                          style: textTeme.bodySmall,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        allAdverts[index].description ?? '- - -',
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
                              allAdverts[index].price!.priceFormatter(),
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
                    imageUrl: allAdverts[index].baseImage,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
