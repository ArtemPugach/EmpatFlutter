import 'package:flutter/material.dart';
import 'package:project4/models/subject.dart';

class SubjectDetailsScreen extends StatefulWidget {
  final Subject subject;

  const SubjectDetailsScreen({
    super.key,
    required this.subject,
  });

  @override
  State<SubjectDetailsScreen> createState() => _SubjectDetailsScreenState();
}

class _SubjectDetailsScreenState extends State<SubjectDetailsScreen> {
  double _opacity = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      setState(() {
        _opacity = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.subject.title),
        centerTitle: true,
      ),
      body: AnimatedOpacity(
        opacity: _opacity,
        duration: const Duration(milliseconds: 300),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Center(
                child: Hero(
                  tag: widget.subject.id,
                  child: Icon(
                    widget.subject.icon,
                    size: 110,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                widget.subject.title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Teacher: ${widget.subject.teacher}',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}