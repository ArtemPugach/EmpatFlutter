import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget{
  final void Function(int index) onSelectTab;

  const AppDrawer({
    super.key,
    required this.onSelectTab,
    });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),

          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              onSelectTab(0);
            },
          ),
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text('Subjects'),
            onTap: () {
              onSelectTab(1);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              onSelectTab(2);
            },
          ),
        ],
      ),
    );
  }
  
}