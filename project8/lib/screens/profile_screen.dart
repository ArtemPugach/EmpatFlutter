import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Профіль'),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  CircleAvatar(
                    radius: 42,
                    child: Icon(Icons.person, size: 42),
                  ),
                  SizedBox(height: 18),
                  Text(
                    'Артем Пугач',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('Computer Science'),

                  SizedBox(height: 4),
                  Text('KPI'),

                  SizedBox(height: 16),

                  Divider(),
                  SizedBox(height: 16),

                  
                  ListTile(
                    leading: Icon(Icons.email_outlined),
                    title: Text('pugacartem106@gmail.com'),
                  ),
                  ListTile(
                    leading: Icon(Icons.school_outlined),
                    title: Text('4 курс'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}