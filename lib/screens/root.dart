import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/screens/cart_page.dart';
import 'package:plant_app/screens/favorite_page.dart';
import 'package:plant_app/screens/home_page.dart';
import 'package:plant_app/screens/profile_page.dart';
import 'package:plant_app/const/constants.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:plant_app/screens/scan_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int bottomIndex = 0;
  List<Widget> pages = const [
    HomePage(),
    FavoritePage(),
    CartPage(),
    ProfilePage(),
  ];
  List<IconData> iconList = [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.person,
  ];

  List<String> appBarTitle = ['خانه', 'علاقه‌مندی‌ها', 'سبد‌خرید', 'پروفایل'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(
                Icons.notifications,
                color: Constants.blackColor,
                size: 30.0,
              ),
              Text(
                appBarTitle[bottomIndex],
                style: TextStyle(
                  color: Constants.blackColor,
                  fontFamily: 'Lalezar',
                  fontSize: 25.0,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
      body: IndexedStack(index: bottomIndex, children: pages),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.bottomToTop,
              child: const ScanPage(),
            ),
          );
        },
        shape: const CircleBorder(),
        backgroundColor: Constants.primaryColor,
        child: Image.asset('assets/images/code-scan-two.png', height: 30.0),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        splashColor: Constants.primaryColor,
        activeColor: Constants.primaryColor,
        activeIndex: bottomIndex,
        inactiveColor: Colors.black.withValues(alpha: 0.5),
        gapLocation: GapLocation.center,
        icons: iconList,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) {
          setState(() {
            bottomIndex = index;
          });
        },
      ),
    );
  }
}
