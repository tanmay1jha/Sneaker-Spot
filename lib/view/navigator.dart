import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sneaker_spot/utils/constants.dart';
import 'package:sneaker_spot/view/bag/bag_screen.dart';
import 'package:sneaker_spot/view/home/home_screen.dart';
import 'package:sneaker_spot/view/profile/profile_screen.dart';

class MainNavigator extends StatefulWidget {
  const MainNavigator({super.key});

  @override
  _MainNavigatorState createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  final PageController _pageController = PageController();

  int _selectedIndex = 0;
  final List<Widget> _screen = [
    const HomeScreen(),
    const MyBagScreen(),
    const Profile(),
  ];

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screen,
        onPageChanged: _onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: CustomNavigationBar(
        iconSize: 27.0,
        bubbleCurve: Curves.linear,
        selectedColor: AppConstantsColor.materialButtonColor,
        strokeColor: AppConstantsColor.materialButtonColor,
        unSelectedColor: const Color(0xffacacac),
        backgroundColor: Colors.white,
        scaleFactor: 0.1,
        items: [
          CustomNavigationBarItem(
            icon: const Icon(CupertinoIcons.home),
          ),
          CustomNavigationBarItem(
            icon: const Icon(CupertinoIcons.shopping_cart),
          ),
          CustomNavigationBarItem(
            icon: const Icon(CupertinoIcons.person),
          ),
        ],
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
      ),
    );
  }
}
