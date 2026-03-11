import 'package:flutter/material.dart';
import 'subject_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  Future<void> openSubject(String subjectName, String teacher, String room) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SubjectScreen(
          subjectName: subjectName,
          teacher: teacher,
          room: room,
        ),
      ),
    );
    if (!context.mounted) return;
    if (result != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result.toString())),
      );
    }
  }



  Widget homeTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.indigo.withOpacity(0.12),
                        child: const Icon(
                          Icons.person_rounded,
                          color: Colors.indigo,
                        ),
                      ),
                      const SizedBox(width: 14),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Профіль',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text('Перегляд інформації про студента'),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/profile');
                    },
                    icon: const Icon(Icons.arrow_forward_rounded),
                    label: const Text('Відкрити профіль'),
                  ),
                ],
              ),
            ),
          ),


          const SizedBox(height: 16),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.indigo.withOpacity(0.12),
                        child: const Icon(
                          Icons.menu_book_rounded,
                          color: Colors.indigo,
                        ),
                      ),
                      const SizedBox(width: 14),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Предмет',style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            SizedBox(height: 4),

                            Text('Інформація про предмет'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () {
                      openSubject('Flutter', 'Олена Коваль', 'Аудиторія 215');
                    },
                    icon: const Icon(Icons.arrow_forward_rounded),
                    label: const Text('Відкрити Flutter'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }



  Widget subjectsTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildSubjectCard(
          title: 'Flutter',
          subtitle: 'Мобільна розробка',
          teacher: 'Олена Коваль',
          room: 'Аудиторія 215',
          icon: Icons.phone_android_rounded,
        ),
        const SizedBox(height: 14),
        _buildSubjectCard(
          title: 'Web',
          subtitle: 'Веб-розробка',
          teacher: 'Іван Мельник',
          room: 'Аудиторія 308',
          icon: Icons.language_rounded,
        ),
      ],
    );
  }

  Widget _buildSubjectCard({
    required String title,
    required String subtitle,
    required String teacher,
    required String room,
    required IconData icon,
  }) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        leading: CircleAvatar(
          backgroundColor: Colors.indigo.withOpacity(0.12),
          child: Icon(
            icon,
            color: Colors.indigo,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 18),
        onTap: () {
          openSubject(title, teacher, room);
        },
      ),
    );
  }


  Widget profileTab() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                CircleAvatar(
                  radius: 38,
                  child: Icon(Icons.person, size: 38),
                ),
                SizedBox(height: 16),
                Text('Артем Пугач', style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text('Computer Science'),
                SizedBox(height: 4),
                Text('KPI'),
              ],
            ),
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    final List<Widget> tabs = [
      homeTab(),
      subjectsTab(),
      profileTab(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.school_rounded),
            SizedBox(width: 8),
            Text('Student App'),
          ],
        ),
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Головна',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_rounded),
            label: 'Предмети',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: 'Профіль',
          ),
        ],
      ),
    );
  }
}