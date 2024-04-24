import 'package:aviz/core/constants/app_margins.dart';
import 'package:aviz/core/widgets/rectangle_advert.dart';
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
    return SliverPadding(
      padding: EdgeInsets.only(
        left: AppMargins.bodyMd,
        right: AppMargins.bodyMd,
        bottom: 16.h,
      ),
      sliver: SliverList.separated(
        itemCount: allAdverts.length,
        separatorBuilder: (context, index) => SizedBox(height: 16.h),
        itemBuilder: (context, index) {
          return RectangleAdvert(
            advert: allAdverts[index],
            height: 140.h,
          );
        },
      ),
    );
  }
}
