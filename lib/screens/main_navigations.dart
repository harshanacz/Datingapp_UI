import 'package:flutter/material.dart';
import '../const/colors.dart';
import './home.dart';

class MainNavigations extends StatefulWidget {
  const MainNavigations({super.key});

  @override
  State<MainNavigations> createState() => _MainNavigationsState();
}

class _MainNavigationsState extends State<MainNavigations> {
  int _selectedPageIndex = 0;

  List<Widget>? _pages;
  bool _isLoaded = false;

  @override
  void didChangeDependencies() {
    if (!_isLoaded) {
      _pages = [
        const Home(),
        const Home(),
        const Home(),
        const Home(),
        /*
        Likes page goes here
        Chat page goes here
        Profile page goes here
        */
      ];
      _isLoaded = true;
    }

    super.didChangeDependencies();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages![_selectedPageIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: Theme(
          data: Theme.of(context)
              .copyWith(canvasColor: const Color.fromARGB(255, 249, 234, 245)),
          child: BottomNavigationBar(
            onTap: _selectPage,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: _selectedPageIndex,
            unselectedItemColor: Colors.black,
            selectedItemColor: pinkColor,
            iconSize: 28,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_outline),
                  activeIcon: Icon(Icons.favorite),
                  label: 'Likes'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.chat_outlined),
                  activeIcon: Icon(Icons.chat),
                  label: 'Chats'),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outlined),
                activeIcon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
