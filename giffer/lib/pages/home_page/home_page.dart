import 'package:flutter/material.dart';
import 'package:giffer/pages/favorites_page/favorites_page.dart';
import 'package:giffer/pages/search_page/search_page.dart';
import 'package:giffer/utils/colors.dart';

import '../../widgets/appbar/CustomAppBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _activePage = 0;
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: PageView(
        controller: _pageController,
        onPageChanged: (value) {
          setState(() {
            _activePage = value;
          });
        },
        children: const [
          SearchPage(),
          FavoritesPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _activePage,
        selectedItemColor: AppColors().color1,
        unselectedItemColor: AppColors().color3,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
        ],
        onTap: (value) {
          setState(() {
            _activePage = value;
            _pageController?.jumpToPage(_activePage);
          });
        },
      ),
    );
  }
}
