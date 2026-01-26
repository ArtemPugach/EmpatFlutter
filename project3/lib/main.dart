import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:google_fonts/google_fonts.dart';



void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const InstaMockScreen(),
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF000000),
      ),
    );
  }
}



class InstaMockScreen extends StatelessWidget {
  const InstaMockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: const [
                  _TopBar(),
                  _StoriesBar(),
                  _PostCard(),
                  SizedBox(height: 8),
                  _Post911Card(),
                ],
              ),
            ),
            _BottomNavBar(),
          ],
        ),
      ),
    );
  }
}



// Шапка Інстаграму

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            PhosphorIconsLight.plus,
            size: 26,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Instagram',
                style: GoogleFonts.pacifico(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(width: 2),
              Transform.translate(
                offset: const Offset(0, 3),
                child: const Icon(
                  PhosphorIconsLight.caretDown,
                  size: 15,
                ),
              ),
            ],
          ),
          Stack(
            alignment: Alignment.topRight,
            children: [
              const Icon(
                PhosphorIconsLight.heart,
                size: 26,
              ),
              Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.only(right: 1, top: 1),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}



// Блок з історіями

class _StoriesBar extends StatelessWidget {
  const _StoriesBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 112,
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          SizedBox(width: 12),
          _StoryItem(
            label: 'Your story',
            imagePath: 'assets/main-photo.png',
            withPlus: true,
          ),
          _StoryItem(label: 'mksmlbd', imagePath: 'assets/mksmlbd.png'),
          _StoryItem(label: 'arciome', imagePath: 'assets/arciome.png'),
          _StoryItem(label: 'kazhanna_', imagePath: 'assets/kazhanna.png'),
          _StoryItem(label: 'honeymoon', imagePath: 'assets/honeymoon.png'),
          SizedBox(width: 12),
        ],
      ),
    );
  }
}



class _StoryItem extends StatelessWidget {
  final String label;
  final bool withPlus;
  final String imagePath;
  const _StoryItem({
    required this.label,
    required this.imagePath,
    this.withPlus = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 78,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFFEDA75),
                      Color(0xFFFA7E1E),
                      Color(0xFFD62976),
                      Color(0xFF962FBF),
                      Color(0xFF4F5BD5),
                    ],
                  ),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              if (withPlus)
                Container(
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(
                      PhosphorIconsLight.plus,
                      size: 14,
                      color: Colors.black,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 3),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 11),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}



// Блок з контентом

class _PostCard extends StatelessWidget {
  const _PostCard();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/green-garage-logo.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                'greengarage',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              const Spacer(),
              const Icon(PhosphorIconsLight.dotsThree),
            ],
          ),
        ),
        SizedBox(
          height: 400,
          width: double.infinity,
          child: Image.asset(
            'assets/coffee.png',
            fit: BoxFit.cover,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Icon(PhosphorIconsLight.heart, size: 22),
                  SizedBox(width: 4),
                  Text('453', style: TextStyle(fontSize: 12)),
                  SizedBox(width: 14),

                  Icon(PhosphorIconsLight.chatCircle, size: 22),
                  SizedBox(width: 4),
                  Text('12', style: TextStyle(fontSize: 12)),
                  SizedBox(width: 14),

                  Icon(PhosphorIconsLight.repeat, size: 22), 
                  SizedBox(width: 4),
                  Text('3', style: TextStyle(fontSize: 12)),
                  SizedBox(width: 14),

                  Icon(PhosphorIconsLight.paperPlaneTilt, size: 22),
                  SizedBox(width: 4),
                  Text('7', style: TextStyle(fontSize: 12)),
                  Spacer(),

                  Icon(PhosphorIconsLight.bookmarkSimple, size: 22),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'greengarage ',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Трохи кавового настрою на вечір.',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              const Text(
                '2 дні тому',
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}



// Пост 2

class _Post911Card extends StatelessWidget {
  const _Post911Card();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/911-logo.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                '911onabc',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              const Spacer(),
              const Icon(PhosphorIconsLight.dotsThree),
            ],
          ),
        ),
        SizedBox(
          height: 400,
          width: double.infinity,
          child: Image.asset(
            'assets/911-photo.png',
            fit: BoxFit.cover,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Icon(PhosphorIconsLight.heart, size: 22),
                  SizedBox(width: 4),
                  Text('21 ТИС.', style: TextStyle(fontSize: 12)),
                  SizedBox(width: 14),

                  Icon(PhosphorIconsLight.chatCircle, size: 22),
                  SizedBox(width: 4),
                  Text('105', style: TextStyle(fontSize: 12)),
                  SizedBox(width: 14),

                  Icon(PhosphorIconsLight.repeat, size: 22),
                  SizedBox(width: 4),
                  Text('339', style: TextStyle(fontSize: 12)),
                  SizedBox(width: 14),

                  Icon(PhosphorIconsLight.paperPlaneTilt, size: 22),
                  SizedBox(width: 4),
                  Text('701', style: TextStyle(fontSize: 12)),
                  Spacer(),
                  Icon(PhosphorIconsLight.bookmarkSimple, size: 22),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    '911onabc ',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'A little BTS joy for your feed.',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              const Text(
                '4 год тому',
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}



//Нижня частина додатку, іконки

class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: const BoxDecoration(
        color: Colors.black,
        border: Border(
          top: BorderSide(
            color: Color(0xFF1C1C1C), 
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            PhosphorIconsLight.house,
            size: 26,
          ),
          const Icon(
            PhosphorIconsLight.playCircle,
            size: 26,
          ),
          const Icon(
            PhosphorIconsLight.paperPlaneTilt,
            size: 26,
          ),
          const Icon(
            PhosphorIconsLight.magnifyingGlass,
            size: 26,
          ),
          Container(
            width: 28,
            height: 28,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/main-photo.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
