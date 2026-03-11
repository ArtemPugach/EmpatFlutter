import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Project 9',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const BarChartScreen(),
    );
  }
}


class BarChartScreen extends StatefulWidget {
  const BarChartScreen({super.key});

  @override
  State<BarChartScreen> createState() => _BarChartScreenState();
}

class _BarChartScreenState extends State<BarChartScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  // анімації висоти
  late Animation<double> _bar1Animation;
  late Animation<double> _bar2Animation;
  late Animation<double> _bar3Animation;
  late Animation<double> _bar4Animation;

  // анімація кольору
  late Animation<Color?> _colorAnimation;


  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _bar1Animation = Tween<double>(
      begin: 40,
      end: 140,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _bar2Animation = Tween<double>(
      begin: 40,
      end: 180,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _bar3Animation = Tween<double>(
      begin: 40,
      end: 120,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _bar4Animation = Tween<double>(
      begin: 40,
      end: 200,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );




    _colorAnimation = ColorTween(
      begin: Colors.indigo,
      end: Colors.orange,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  void _toggleAnimation() {
    setState(() {
      if (_isAnimating) {
        _controller.stop();
        _isAnimating = false;
      } else {
        _controller.repeat(reverse: true);
        _isAnimating = true;
      }
    });
  }

  Widget _buildBar({
    required String label,
    required double height,
    required Color color,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          height.toStringAsFixed(0),
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),


        const SizedBox(height: 8),
        Container(
          width: 50,
          height: 220,
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Container(
            width: 50,
            height: height,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        ),

        const SizedBox(height: 10),

        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Анімація діаграми'),
        centerTitle: true,
      ),

      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final currentColor = _colorAnimation.value ?? Colors.indigo;
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        _buildBar(
                          label: 'Mon',
                          height: _bar1Animation.value,
                          color: currentColor,
                        ),


                        _buildBar(
                          label: 'Tue',
                          height: _bar2Animation.value,
                          color: currentColor,
                        ),

                        _buildBar(
                          label: 'Wed',
                          height: _bar3Animation.value,
                          color: currentColor,
                        ),

                        _buildBar(
                          label: 'Thu',
                          height: _bar4Animation.value,
                          color: currentColor,
                        ),

                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _toggleAnimation,
                    child: Text(
                      _isAnimating
                          ? 'Зупинити анімацію'
                          : 'Запустити анімацію',
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
    );
  }
}