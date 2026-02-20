import 'package:flutter/material.dart';

class Subject {
  final String id;
  final String title;

  final String teacher;
  final IconData icon;

  const Subject({
    required this.id,
    required this.title,
    required this.teacher,
    required this.icon,
  });
}

const List<Subject> subjectsData = [
  Subject(
    id: 'Networks',
    title: 'Computer Networks',
    teacher: 'Maks',
    icon: Icons.router,
  ),
  Subject(
    id: 'web',
    title: 'Web Development',
    teacher: 'Kira',
    icon: Icons.language,
  ),
  Subject(
    id: 'ai',
    title: 'AI Methods',
    teacher: 'Maks',
    icon: Icons.psychology,
  ),
  Subject(
    id: 'analysis',
    title: 'System Analysis',
    teacher: 'Kira',
    icon: Icons.analytics,
  ),
];
