import 'package:flutter/material.dart';
import 'package:petpix/Components/post_model.dart';
import 'package:petpix/pages/add_post.dart';
import 'package:petpix/pages/home_screen.dart';
import 'package:petpix/pages/profilescreen.dart';
import 'package:petpix/pages/searchpage.dart';

class FullScreen extends StatefulWidget {
  const FullScreen({super.key});

  @override
  State<FullScreen> createState() => _FullScreenState();
}

int _currentIndex = 0;

class _FullScreenState extends State<FullScreen> {
  late PageController pageController;
    @override
  void initState() {
    super.initState();
    pageController = PageController();
  }
  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }
   onPageChanged(int page) {
    setState(() {
      _currentIndex = page;
    });
  }
  navigationTapped(int page) {
    pageController.jumpToPage(page);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          currentIndex: _currentIndex,
          onTap: navigationTapped,
          items: [
            const BottomNavigationBarItem(icon: Icon(Icons.home),
            label: '',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.search),
            label: '',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.add_a_photo),
            label: '',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person),
            label: '',
            ),
          ]),
      ),
   body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: [
          HomeScreen(),
          SearchPage(),
          AddPostScreen(),
          ProfileScreen()
          
        ],
      ),
    );
  }
}
