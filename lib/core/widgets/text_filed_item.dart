import 'package:aviz/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class TextFiledItem extends StatelessWidget {
  const TextFiledItem({
    super.key,
    required this.controller,
    this.hint,
    this.maxLines,
    this.textHeight,
    this.readOnly,
    this.textInputAction,
    this.actions,
    this.textDirection,
    this.scrollController,
  });

  final TextEditingController? controller;
  final String? hint;
  final int? maxLines;
  final double? textHeight;
  final bool? readOnly;
  final TextInputAction? textInputAction;
  final Widget? actions;
  final TextDirection? textDirection;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return TextField(
      style: textTheme.titleMedium,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      textInputAction: textInputAction ?? TextInputAction.done,
      controller: controller,
      textDirection: textDirection,
      readOnly: readOnly ?? false,
      scribbleEnabled: true,
      scrollController: scrollController,
      maxLines: maxLines ?? 1,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          color: AppColors.grey400,
        ),
      ),
    );
  }
}
