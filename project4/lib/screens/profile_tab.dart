import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget{
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Profile',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              
            ),
            SizedBox(height: 12),

            Text(
              'Name: Artem\nPole: Student',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.grey),
            )

          ],
        ),
      ),
    );
  }
  
}