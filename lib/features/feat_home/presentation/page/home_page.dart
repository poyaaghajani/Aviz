import 'package:aviz/core/constants/app_margins.dart';
import 'package:aviz/core/widgets/app_bar/main_appbar.dart';
import 'package:aviz/core/widgets/error_state.dart';
import 'package:aviz/core/widgets/loading_state.dart';
import 'package:aviz/features/feat_home/presentation/bloc/get_home_status.dart';
import 'package:aviz/features/feat_home/presentation/bloc/manage_home_bloc.dart';
import 'package:aviz/features/feat_home/presentation/widgets/hot_adverts.dart';
import 'package:aviz/features/feat_home/presentation/widgets/recent_adverts.dart';
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
  Widget build(BuildContext context) {
    final bgColor = Theme.of(context).colorScheme.background;
    final textTeme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: bgColor,
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
                BlocProvider.of<ManageHomeBloc>(context).add(GetHomeRequest());
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
          right: AppMargins.bodyManinMargin,
          left: AppMargins.bodyManinMargin,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'آویز های اخیر',
              style: textTeme.bodyLarge,
            ),
            TextButton(
              onPressed: () {},
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
