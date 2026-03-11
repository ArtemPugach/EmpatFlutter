import 'package:flutter/material.dart';

class SubjectScreen extends StatelessWidget {
  final String subjectName;
  final String teacher;
  final String room;

  const SubjectScreen({
    super.key,
    required this.subjectName,
    required this.teacher,
    required this.room,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subjectName),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 38,
                    backgroundColor: Colors.indigo.withOpacity(0.12),
                    child: const Icon(
                      Icons.menu_book_rounded,
                      size: 38,
                      color: Colors.indigo,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    subjectName,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ListTile(
                    leading: const Icon(Icons.person_outline),
                    title: const Text('Викладач'),
                    subtitle: Text(teacher),
                  ),
                  ListTile(
                    leading: const Icon(Icons.meeting_room_outlined),
                    title: const Text('Аудиторія'),
                    subtitle: Text(room),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(
                        context,
                        'Повернення з предмета $subjectName',
                      );
                    },
                    icon: const Icon(Icons.arrow_back_rounded),
                    label: const Text('Повернутися'),
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