import 'package:aviz/features/feat_add_advert/presentation/page/add_advert_page.dart';
import 'package:aviz/features/feat_home/presentation/bloc/manage_home_bloc.dart';
import 'package:aviz/features/feat_home/presentation/page/home_page.dart';
import 'package:aviz/features/feat_main/presentation/widgets/bottomnav_items.dart';
import 'package:aviz/features/feat_profile/presentation/page/profile_page.dart';
import 'package:aviz/features/feat_search/presentation/page/search_page.dart';
import 'package:aviz/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    final bgColor = Theme.of(context).colorScheme.background;

    return Scaffold(
      backgroundColor: bgColor,
      body: IndexedStack(
        index: _activeIndex,
        children: [
          BlocProvider.value(
            value: locator.get<ManageHomeBloc>(),
            child: const Homepage(),
          ),
          SearchPage(),
          AddAvdertPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _activeIndex,
        onTap: (value) {
          setState(() {
            _activeIndex = value;
          });
        },
        items: bottomNavItems(context),
      ),
    );
  }
}
