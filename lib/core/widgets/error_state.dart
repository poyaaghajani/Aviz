import 'package:aviz/core/constants/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorState extends StatelessWidget {
  const ErrorState({
    super.key,
    required this.message,
    required this.onPressed,
  });

  final String message;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AssetsManager.error, width: 80.w),
          SizedBox(height: 6.h),
          Text(
            '$message..!',
            style: textTheme.headlineSmall,
          ),
          SizedBox(height: 6.h),
          ElevatedButton(
            onPressed: onPressed,
            child: const Text('تلاش مجدد'),
          ),
        ],
      ),
    );
  }
}
