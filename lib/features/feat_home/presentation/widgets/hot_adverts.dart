import 'package:aviz/core/constants/app_colors.dart';
import 'package:aviz/core/constants/app_margins.dart';
import 'package:aviz/core/constants/app_radius.dart';
import 'package:aviz/core/constants/app_shadows.dart';
import 'package:aviz/core/extensions/price_formatter.dart';
import 'package:aviz/core/widgets/cached_image.dart';
import 'package:aviz/features/feat_home/data/models/advert_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeHotAdverts extends StatelessWidget {
  const HomeHotAdverts({
    super.key,
    required this.hotAdverts,
  });

  final List<Advert> hotAdverts;

  @override
  Widget build(BuildContext context) {
    final textTeme = Theme.of(context).textTheme;

    return SliverPadding(
      padding: EdgeInsets.symmetric(vertical: 32.h),
      sliver: SliverToBoxAdapter(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                bottom: 12.h,
                right: AppMargins.md,
                left: AppMargins.md,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'آویز های داغ',
                    style: textTeme.bodyLarge,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'مشاهده همه',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 294.h,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(
                  horizontal: AppMargins.md,
                  vertical: 8.h,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: hotAdverts.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(16),
                    width: 224.w,
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
                              imageUrl: hotAdverts[index].baseImage,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 8.h),
                          child: Text(
                            hotAdverts[index].title ?? '- - -',
                            style: textTeme.bodySmall,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          hotAdverts[index].description ?? '- - -',
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
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: AppRadius.sm,
                                color: AppColors.grey100,
                              ),
                              child: Text(
                                hotAdverts[index].price!.priceFormatter(),
                                style: textTeme.titleSmall!.apply(
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: 16.w);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
