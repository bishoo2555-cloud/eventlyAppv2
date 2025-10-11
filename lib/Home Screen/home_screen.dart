import 'package:eventlyapp/Home%20Screen/tabs/favorite_tab/favorite_tab.dart';
import 'package:eventlyapp/Home%20Screen/tabs/home_tab/home_tab.dart';
import 'package:eventlyapp/Home%20Screen/tabs/map_tab/map_tab.dart';
import 'package:eventlyapp/Home%20Screen/tabs/profile%20tab/profile_screen.dart';
import 'package:eventlyapp/generated/l10n.dart';
import 'package:eventlyapp/utils/app_color.dart';
import 'package:eventlyapp/utils/app_routes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = [
    HomeTab(),
    MapTab(),
    FavoriteTab(),
    ProfileScreen(),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        shape: StadiumBorder(
          side: BorderSide(
            width: 4,
            color: AppColor.primaryLightbgColor,
          ),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.addevent);
        },
        child: Icon(
          Icons.add,
          color: AppColor.primaryLightbgColor,
          size: 52,
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  void _onTab(int newIndex) {
    setState(() {
      selectedIndex = newIndex;
    });
  }

  Theme _buildBottomNavBar() {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          currentIndex: selectedIndex,
          onTap: _onTab,
          items: [
            BottomNavigationBarItem(
                icon:
                    Icon(selectedIndex == 0 ? Icons.home : Icons.home_outlined),
                label: S.of(context).home),
            BottomNavigationBarItem(
                icon: Icon(selectedIndex == 1
                    ? Icons.location_on
                    : Icons.location_on_outlined),
                label: S.of(context).map),
            BottomNavigationBarItem(
                icon: Icon(selectedIndex == 2
                    ? Icons.favorite
                    : Icons.favorite_border_outlined),
                label: S.of(context).favorite),
            BottomNavigationBarItem(
                icon: Icon(
                    selectedIndex == 3 ? Icons.person : Icons.person_outline),
                label: S.of(context).profile)
          ]),
    );
  }
}
