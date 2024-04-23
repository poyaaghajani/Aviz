import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppRadius {
  AppRadius._();

  static BorderRadiusGeometry sm = BorderRadius.circular(2.w);
  static BorderRadiusGeometry md = BorderRadius.circular(4.w);
  static BorderRadiusGeometry lg = BorderRadius.circular(6.w);
}
