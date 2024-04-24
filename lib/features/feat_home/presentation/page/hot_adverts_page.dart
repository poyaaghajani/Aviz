import 'package:aviz/core/constants/app_margins.dart';
import 'package:aviz/core/widgets/app_bar/main_appbar.dart';
import 'package:aviz/core/widgets/error_state.dart';
import 'package:aviz/core/widgets/loading_state.dart';
import 'package:aviz/core/widgets/pagination_button.dart';
import 'package:aviz/core/widgets/square_advert.dart';
import 'package:aviz/features/feat_home/presentation/bloc/get_home_status.dart';
import 'package:aviz/features/feat_home/presentation/bloc/manage_home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HotAdvertsPage extends StatefulWidget {
  const HotAdvertsPage({super.key});

  @override
  State<HotAdvertsPage> createState() => _HotAdvertsPageState();
}

class _HotAdvertsPageState extends State<HotAdvertsPage> {
  int _page = 1;

  @override
  Widget build(BuildContext context) {
    final bgColor = Theme.of(context).colorScheme.background;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: const MainAppBar(),
      body: BlocBuilder<ManageHomeBloc, ManageHomeState>(
        builder: (context, state) {
          if (state.getStatus is HomeGetSuccess) {
            final HomeGetSuccess success = (state.getStatus as HomeGetSuccess);

            final advert = success.hotAdverts;
            final int totalCount = advert.totalItems!;
            final int pageSize = advert.perPage!;
            final int currentPageNo = advert.page!;
            final int totalPageNo = (totalCount / pageSize).ceil();

            return Padding(
              padding: EdgeInsets.only(
                left: AppMargins.bodyMd,
                right: AppMargins.bodyMd,
                top: 16.h,
              ),
              child: CustomScrollView(
                slivers: [
                  SliverGrid.builder(
                    itemCount: advert.items!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.w,
                      mainAxisSpacing: 16.w,
                      childAspectRatio: 0.7,
                    ),
                    itemBuilder: (context, index) {
                      return SquareAdvert(
                        padding: const EdgeInsets.all(8),
                        advert: advert.items![index],
                      );
                    },
                  ),

                  // pagination
                  PaginationButton(
                    onPreviousPage: () {
                      setState(() {
                        _page--;
                      });
                      BlocProvider.of<ManageHomeBloc>(context).add(
                        GetHomeRequest(page: _page),
                      );
                    },
                    onNextPage: () {
                      setState(() {
                        _page++;
                      });
                      BlocProvider.of<ManageHomeBloc>(context).add(
                        GetHomeRequest(page: _page),
                      );
                    },
                    currentPageNo: currentPageNo,
                    totalPageNo: totalPageNo,
                    totalCount: totalCount,
                    pageSize: pageSize,
                  ),
                ],
              ),
            );
          }
          if (state.getStatus is HomeGetError) {
            final HomeGetError error = (state.getStatus as HomeGetError);

            return ErrorState(
              message: error.errorMsg,
              onPressed: () {
                BlocProvider.of<ManageHomeBloc>(context).add(
                  GetHomeRequest(page: _page),
                );
              },
            );
          } else {
            return const LoadingState();
          }
        },
      ),
    );
  }
}
