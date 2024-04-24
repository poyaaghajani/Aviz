import 'package:aviz/core/constants/app_colors.dart';
import 'package:aviz/core/constants/app_margins.dart';
import 'package:aviz/core/constants/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchTextFiled extends SliverPersistentHeaderDelegate {
  final TextEditingController query;
  final void Function(String)? onChanged;

  SearchTextFiled({
    required this.query,
    required this.onChanged,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    var textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppMargins.bodyMd,
      ),
      child: SizedBox(
        height: maxExtent,
        child: TextField(
          style: textTheme.titleMedium,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          textInputAction: TextInputAction.search,
          controller: query,
          decoration: InputDecoration(
            hintText: 'جستجو...',
            hintStyle: const TextStyle(
              color: AppColors.grey400,
            ),
            prefixIcon: Container(
              padding: const EdgeInsets.all(10),
              child: SvgPicture.asset(
                AssetsManager.search,
              ),
            ),
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }

  @override
  double get maxExtent => 64.h;

  @override
  double get minExtent => 64.h;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
