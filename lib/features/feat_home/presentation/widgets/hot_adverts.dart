import 'package:aviz/config/route/app_route.dart';
import 'package:aviz/core/constants/app_margins.dart';
import 'package:aviz/core/widgets/square_advert.dart';
import 'package:aviz/features/feat_home/data/models/advert_model.dart';
import 'package:aviz/features/feat_home/presentation/bloc/manage_home_bloc.dart';
import 'package:aviz/features/feat_home/presentation/page/hot_adverts_page.dart';
import 'package:aviz/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                right: AppMargins.bodyMd,
                left: AppMargins.bodyMd,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'آویز های داغ',
                    style: textTeme.bodyLarge,
                  ),
                  TextButton(
                    onPressed: () {
                      context.push(
                        BlocProvider.value(
                          value: locator.get<ManageHomeBloc>()
                            ..add(const GetHomeRequest(page: 1)),
                          child: const HotAdvertsPage(),
                        ),
                      );
                    },
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
                  horizontal: AppMargins.bodyMd,
                  vertical: 8.h,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: hotAdverts.length,
                itemBuilder: (context, index) {
                  return SquareAdvert(
                    advert: hotAdverts[index],
                    width: 224.w,
                    onTap: () {},
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
