import 'package:africa/screens/content_view.dart';
import 'package:africa/screens/gallery_view.dart';
import 'package:africa/screens/map_view.dart';
import 'package:africa/screens/video_list_view.dart';
import 'package:flutter/material.dart';

import '../app_utils/utilities.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);
  final List<Widget> _tabs = [
    const ContentView(),
    const VideoListView(),
    const GalleryView(),
  ];

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
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: _tabs,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: colorYellowAccent,
        unselectedItemColor: colorWhite,
        backgroundColor: colorBlack.withOpacity(0.8),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_on),
            label: "Browse",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_outline),
            label: "Watch",
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.map),
          //   label: "Locations",
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo),
            label: "Gallery",
          ),
        ],
      ),
    );
  }
}