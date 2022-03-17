import 'package:bottom_nav_bar_app/constants/app_color.dart';
import 'package:bottom_nav_bar_app/resources/resources.dart';
import 'package:bottom_nav_bar_app/screens/first_screen.dart';
import 'package:bottom_nav_bar_app/screens/fourth_screen.dart';
import 'package:bottom_nav_bar_app/screens/second_screen.dart';
import 'package:bottom_nav_bar_app/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentTabIndex = 0;
  List<Color> colors = List.generate(4, (i) => AppColors.unSelectedItem);
  List<Widget> screens = [
    const FirstScreen(),
    const SecondScreen(),
    const ThirdScreen(),
    const FourthScreen()
  ];

  void _onSelectedTab(index) {
    if (index == _currentTabIndex) return;
    colors = List.generate(4, (i) => AppColors.unSelectedItem);
    colors[index] = AppColors.selectedItem;
    _currentTabIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: screens[_currentTabIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTabIndex,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.selectedItem,
        unselectedItemColor: AppColors.unSelectedItem,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Svgs.subtract,
              color: colors[0],
            ),
            label: "Персонажи",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Svgs.location24px,
              color: colors[1],
            ),
            label: "Локациии",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Svgs.group4,
              color: colors[2],
            ),
            label: "Эпизоды",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Svgs.group,
              color: colors[3],
            ),
            label: "Настройки",
          ),
        ],
        onTap: _onSelectedTab,
      ),
    );
  }
}
