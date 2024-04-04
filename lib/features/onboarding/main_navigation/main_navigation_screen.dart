import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  final screens = [
    const Center(
      child: Text("Home"),
    ),
    const Center(
      child: Text("Search"),
    ),
    const Center(
      child: Text("Home"),
    ),
    const Center(
      child: Text("Search"),
    ),
    const Center(
      child: Text("Home"),
    ),
  ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(items: const [
        BottomNavigationBarItem(
          icon: FaIcon(CupertinoIcons.house),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: FaIcon(CupertinoIcons.search),
          label: "Search",
        ),
      ]),
      tabBuilder: (context, index) => screens[index],
    );
    // return Scaffold(
    //   body: screens[_selectedIndex],
    //   bottomNavigationBar: NavigationBar(
    //     labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
    //     onDestinationSelected: _onTap,
    //     selectedIndex: _selectedIndex,
    //     destinations: const [
    //       NavigationDestination(
    //         icon: FaIcon(
    //           FontAwesomeIcons.house,
    //           color: Colors.purple,
    //         ),
    //         label: "Home",
    //       ),
    //       NavigationDestination(
    //         icon: FaIcon(
    //           FontAwesomeIcons.magnifyingGlass,
    //           color: Colors.purple,
    //         ),
    //         label: "Search",
    //       )
    //     ],
    //   ),
    // );
  }
}
