import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'models/post.dart';
import 'services/api_service.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatefulWidget{
  const MyApp({super.key});
  
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkTheme = false;
  List<Post> posts = [];
  bool isLoading = false;
  
  @override
  void initState(){
    super.initState();
    loadTheme();
  }
  
  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();

    bool savedValue = prefs.getBool('isDarkTheme') ?? false;

    setState(() {
      isDarkTheme = savedValue;
    });
  }

  Future<void> saveTheme(bool value) async{
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool('isDarkTheme', value);
  }

  void loadPostsWithThen() {
    setState(() {
      isLoading = true;
    });

    fetchPostsWithThen().then((loadedPosts) {
      setState(() {
        posts = loadedPosts;
        isLoading = false;
      });
    }).catchError((error) {
      setState(() {
        isLoading = false;
      });
      print(error);
    });
  }

  Future<void> loadPostsWithAwait() async {
    setState(() {
      isLoading = true;
    });

    try {
      final loadedPosts = await fetchPostsWithAwait();

      setState(() {
        posts = loadedPosts;
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      print(error);
    }
  }


  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),

      themeMode: isDarkTheme ? ThemeMode.dark : ThemeMode.light,

      home: HomeScreen(
        isDarkTheme: isDarkTheme,

        onThemeChanged: (value){
          setState(() {
            isDarkTheme = value;
          });
          saveTheme(value);
        },
        posts: posts,
        isLoading: isLoading,
        onLoadWithThen: loadPostsWithThen,
        onLoadWithAwait: loadPostsWithAwait,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget{
  final bool isDarkTheme;
  final Function(bool) onThemeChanged;
  final List<Post> posts;
  final bool isLoading;
  final VoidCallback onLoadWithThen;
  final VoidCallback onLoadWithAwait;

  const HomeScreen({
    super.key,
    required this.isDarkTheme,
    required this.onThemeChanged,
    required this.posts,
    required this.isLoading,
    required this.onLoadWithThen,
    required this.onLoadWithAwait,
  });


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Project 7'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Switch(value: isDarkTheme, onChanged: onThemeChanged),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: onLoadWithThen, child: const Text('Load with .then()')),
            ),
            const SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onLoadWithAwait,
                child: const Text('Load with await'),
              ),
            ),
            const SizedBox(height: 16),

            Expanded(
              child: isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : posts.isEmpty
                      ? const Center(
                          child: Text('Posts are not loaded'),
                        )
                      : ListView.builder(
                          itemCount: posts.length,
                          itemBuilder: (context, index) {
                            final post = posts[index];

                            return Card(
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      post.title,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(post.body),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }}
