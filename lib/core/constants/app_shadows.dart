import 'package:aviz/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppShadows {
  AppShadows._();

  static List<BoxShadow> xs = [
    BoxShadow(
      offset: const Offset(0, 1),
      blurRadius: 2,
      spreadRadius: 0,
      color: const Color(0xff101828).withOpacity(0.5),
    ),
  ];

  static List<BoxShadow> sm = [
    BoxShadow(
      offset: const Offset(0, 1),
      blurRadius: 2,
      spreadRadius: 0,
      color: const Color(0xff101828).withOpacity(0.6),
    ),
    BoxShadow(
      offset: const Offset(0, 1),
      blurRadius: 3,
      spreadRadius: 0,
      color: const Color(0xff101828).withOpacity(0.10),
    ),
  ];

  static List<BoxShadow> md = [
    const BoxShadow(
      offset: Offset(0, 4),
      blurRadius: 8,
      spreadRadius: 2,
      color: AppColors.grey200,
    ),
  ];

  static List<BoxShadow> lg = [
    BoxShadow(
      offset: const Offset(0, 4),
      blurRadius: 10,
      spreadRadius: 0,
      color: const Color(0xff000000).withOpacity(0.3),
    ),
    BoxShadow(
      offset: const Offset(0, 18),
      blurRadius: 18,
      spreadRadius: 0,
      color: const Color(0xff000000).withOpacity(0.3),
    ),
    BoxShadow(
      offset: const Offset(0, 40),
      blurRadius: 24,
      spreadRadius: 0,
      color: const Color(0xff000000).withOpacity(0.2),
    ),
    BoxShadow(
      offset: const Offset(0, 70),
      blurRadius: 24,
      spreadRadius: 0,
      color: const Color(0xff000000).withOpacity(0.0),
    ),
    BoxShadow(
      offset: const Offset(0, 110),
      blurRadius: 30,
      spreadRadius: 0,
      color: const Color(0xff000000).withOpacity(0.0),
    ),
  ];

  static List<BoxShadow> xl = [
    BoxShadow(
      offset: const Offset(0, 8),
      blurRadius: 8,
      spreadRadius: -4,
      color: const Color(0xff101828).withOpacity(0.3),
    ),
    BoxShadow(
      offset: const Offset(0, 20),
      blurRadius: 24,
      spreadRadius: -4,
      color: const Color(0xff101828).withOpacity(0.8),
    ),
  ];

  static List<BoxShadow> xl2 = [
    BoxShadow(
      offset: const Offset(0, 24),
      blurRadius: 48,
      spreadRadius: -12,
      color: const Color(0xff101828).withOpacity(0.18),
    ),
  ];

  static List<BoxShadow> xl3 = [
    BoxShadow(
      offset: const Offset(0, 32),
      blurRadius: 64,
      spreadRadius: -12,
      color: const Color(0xff101828).withOpacity(0.14),
    ),
  ];
}
