import 'package:flutter/material.dart';
import 'package:project4/screens/home_tab.dart';
import 'package:project4/screens/profile_tab.dart';
import 'package:project4/screens/subjects_tab.dart';
import 'package:project4/widgets/app_drawer.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  //0 - Home, 1 - Subjects, 2 - Profile
  int _currentIndex = 0;

  //метод для Drawer
  void _setTab(int index){
    Navigator.pop(context);

    setState(() {
      _currentIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Student App'), centerTitle: true),
      drawer: AppDrawer(
        onSelectTab: _setTab,
      ),

      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 350),
        transitionBuilder: (Widget child, Animation<double> animation){
          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(
              scale: Tween<double>(
                begin: 0.95,
                end: 1,
              ).animate(animation),
              child: child,
              ),
          );
        },
        child: _currentIndex == 0
          ? const HomeTab(
            key: ValueKey(0),
          )
          : _currentIndex == 1
            ? const SubjectsTab(
              key: ValueKey(1),
            )
            : const ProfileTab(
              key: ValueKey(2),
            )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Предмет додано'),
              duration: Duration(seconds: 2),
            )
          );
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,

        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.book),
          label: 'Subjects',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person),
          label: 'Profile',
          )
        ],
      ),
    );
  }
}
