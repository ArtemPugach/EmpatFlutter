import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget{
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Home',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),

            Text(
              'Вітаю в додатку Students App, використовуйте меню, щоб переглянути предмети',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }

}