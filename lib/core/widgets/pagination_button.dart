import 'package:aviz/core/constants/app_colors.dart';
import 'package:aviz/core/constants/app_margins.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaginationButton extends StatelessWidget {
  const PaginationButton({
    super.key,
    required this.onPreviousPage,
    required this.onNextPage,
    required this.currentPageNo,
    required this.totalPageNo,
    required this.totalCount,
    required this.pageSize,
  });

  final void Function()? onPreviousPage;
  final void Function()? onNextPage;
  final int currentPageNo;
  final int totalPageNo;
  final int totalCount;
  final int pageSize;

  @override
  Widget build(BuildContext context) {
    final textTeme = Theme.of(context).textTheme;

    return totalCount >= pageSize
        ? SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppMargins.bodyMd,
                vertical: 20.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: currentPageNo > 1 ? onPreviousPage : null,
                    child: Ink(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primary100,
                        border: Border.all(
                          color: AppColors.primary,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.w),
                        child: Icon(
                          Icons.arrow_back,
                          size: 22.w,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Text(
                      'صفحه $currentPageNo از $totalPageNo',
                      style: textTeme.displayMedium,
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: currentPageNo != totalPageNo ? onNextPage : null,
                    child: Ink(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primary100,
                        border: Border.all(
                          color: AppColors.primary,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.w),
                        child: Icon(
                          Icons.arrow_forward,
                          size: 22.w,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
          );
  }
}
