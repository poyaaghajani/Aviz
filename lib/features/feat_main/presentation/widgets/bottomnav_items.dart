import 'package:aviz/core/constants/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

List<BottomNavigationBarItem> bottomNavItems(BuildContext context) {
  final primary = Theme.of(context).colorScheme.primary;

  return [
    BottomNavigationBarItem(
      activeIcon: SvgPicture.asset(AssetsManager.homeActive),
      icon: SvgPicture.asset(AssetsManager.home),
      label: 'آویز آگهی ها',
    ),
    BottomNavigationBarItem(
      activeIcon: SvgPicture.asset(
        AssetsManager.search,
        colorFilter: ColorFilter.mode(
          primary,
          BlendMode.srcATop,
        ),
      ),
      icon: SvgPicture.asset(
        AssetsManager.search,
      ),
      label: 'جستجو',
    ),
    BottomNavigationBarItem(
      activeIcon: SvgPicture.asset(
        AssetsManager.addCircle,
        colorFilter: ColorFilter.mode(
          primary,
          BlendMode.srcATop,
        ),
      ),
      icon: SvgPicture.asset(AssetsManager.addCircle),
      label: 'افزودن آویز',
    ),
    BottomNavigationBarItem(
      activeIcon: SvgPicture.asset(
        AssetsManager.profile,
        colorFilter: ColorFilter.mode(
          primary,
          BlendMode.srcATop,
        ),
      ),
      icon: SvgPicture.asset(AssetsManager.profile),
      label: 'آویز من',
    ),
  ];
}
