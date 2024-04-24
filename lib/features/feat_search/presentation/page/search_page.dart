import 'package:aviz/core/constants/app_margins.dart';
import 'package:aviz/core/widgets/pagination_button.dart';
import 'package:aviz/core/widgets/rectangle_advert.dart';
import 'package:aviz/core/widgets/app_bar/main_appbar.dart';
import 'package:aviz/core/widgets/error_state.dart';
import 'package:aviz/core/widgets/loading_state.dart';
import 'package:aviz/features/feat_search/presentation/bloc/get_status.dart';
import 'package:aviz/features/feat_search/presentation/bloc/manage_search_bloc.dart';
import 'package:aviz/features/feat_search/presentation/widgets/search_textfiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _page = 1;
  final TextEditingController _query = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _isPinned = true;

  // init
  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    BlocProvider.of<ManageSearchBloc>(context).add(
      const SearchGetRequest(query: '', page: 1),
    );
    super.initState();
  }

  // dispose
  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _query.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  // on user scroll
  void _onScroll() {
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      // Scrolling up
      setState(() {
        _isPinned = false;
      });
    } else if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      // Scrolling down
      setState(() {
        _isPinned = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: BlocBuilder<ManageSearchBloc, ManageSearchState>(
        builder: (context, state) {
          // success
          if (state.getStatus is SearchGetSuccess) {
            final SearchGetSuccess success =
                (state.getStatus as SearchGetSuccess);

            final advert = success.response;
            final int totalCount = advert.totalItems!;
            final int pageSize = advert.perPage!;
            final int currentPageNo = advert.page!;
            final int totalPageNo = (totalCount / pageSize).ceil();

            return CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverPersistentHeader(
                  pinned: _isPinned,
                  delegate: SearchTextFiled(
                    query: _query,
                    onChanged: (value) {
                      BlocProvider.of<ManageSearchBloc>(context).add(
                        SearchGetRequest(
                          query: _query.text,
                          page: _page,
                          needRefresh: false,
                        ),
                      );
                    },
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.only(
                    left: AppMargins.bodyMd,
                    right: AppMargins.bodyMd,
                  ),
                  sliver: SliverList.separated(
                    itemCount: advert.items!.length,
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 16.h),
                    itemBuilder: (context, index) {
                      return RectangleAdvert(
                        advert: advert.items![index],
                        height: 140.h,
                      );
                    },
                  ),
                ),

                // pagination
                PaginationButton(
                  onPreviousPage: () {
                    setState(() {
                      _page--;
                    });
                    BlocProvider.of<ManageSearchBloc>(context).add(
                      SearchGetRequest(page: _page, query: _query.text),
                    );
                  },
                  onNextPage: () {
                    setState(() {
                      _page++;
                    });
                    BlocProvider.of<ManageSearchBloc>(context).add(
                      SearchGetRequest(page: _page, query: _query.text),
                    );
                  },
                  currentPageNo: currentPageNo,
                  totalPageNo: totalPageNo,
                  totalCount: totalCount,
                  pageSize: pageSize,
                ),
              ],
            );
          }

          // error
          if (state.getStatus is SearchGetError) {
            final SearchGetError error = (state.getStatus as SearchGetError);

            return ErrorState(
              message: error.errorMsg,
              onPressed: () {
                BlocProvider.of<ManageSearchBloc>(context).add(SearchGetRequest(
                  query: _query.text,
                  page: _page,
                ));
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
