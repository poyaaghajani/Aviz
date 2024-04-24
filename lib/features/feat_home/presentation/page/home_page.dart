import 'package:aviz/config/route/app_route.dart';
import 'package:aviz/core/constants/app_margins.dart';
import 'package:aviz/core/widgets/app_bar/main_appbar.dart';
import 'package:aviz/core/widgets/error_state.dart';
import 'package:aviz/core/widgets/loading_state.dart';
import 'package:aviz/features/feat_home/presentation/bloc/get_home_status.dart';
import 'package:aviz/features/feat_home/presentation/bloc/manage_home_bloc.dart';
import 'package:aviz/features/feat_home/presentation/page/recent_adverts_page.dart';
import 'package:aviz/features/feat_home/presentation/widgets/hot_adverts.dart';
import 'package:aviz/features/feat_home/presentation/widgets/recent_adverts.dart';
import 'package:aviz/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    BlocProvider.of<ManageHomeBloc>(context).add(const GetHomeRequest(page: 1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTeme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: const MainAppBar(),
      body: BlocBuilder<ManageHomeBloc, ManageHomeState>(
        builder: (context, state) {
          // success
          if (state.getStatus is HomeGetSuccess) {
            final HomeGetSuccess success = (state.getStatus as HomeGetSuccess);

            final hotAdverts = success.hotAdverts.items;
            final allAdverts = success.allAdverts.items;

            return CustomScrollView(
              slivers: [
                HomeHotAdverts(hotAdverts: hotAdverts!),
                recentRow(textTeme),
                HomeRecentAdverts(allAdverts: allAdverts!),
              ],
            );
          }

          // error
          if (state.getStatus is HomeGetError) {
            final HomeGetError error = (state.getStatus as HomeGetError);

            return ErrorState(
              message: error.errorMsg,
              onPressed: () {
                BlocProvider.of<ManageHomeBloc>(context)
                    .add(const GetHomeRequest(page: 1));
              },
            );
          } else {
            return const LoadingState();
          }
        },
      ),
    );
  }

  SliverToBoxAdapter recentRow(TextTheme textTeme) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: 12.h,
          right: AppMargins.bodyMd,
          left: AppMargins.bodyMd,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'آویز های اخیر',
              style: textTeme.bodyLarge,
            ),
            TextButton(
              onPressed: () {
                context.push(BlocProvider.value(
                  value: locator.get<ManageHomeBloc>()
                    ..add(const GetHomeRequest(page: 1)),
                  child: const RecentAdvertsPage(),
                ));
              },
              child: const Text(
                'مشاهده همه',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
