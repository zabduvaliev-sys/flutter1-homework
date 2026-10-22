import 'package:flutter/material.dart';

void main() => runApp(const TabsApp());

class TabsApp extends StatelessWidget {
  const TabsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Моё приложение'),
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Новости'),
                Tab(text: 'Чаты'),
                Tab(text: 'Профиль'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(
  child: Column(
  mainAxisSize: MainAxisSize.min,
  children: [
    Container(
    width: 320,
    height: 220,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(24),
      boxShadow: const [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 12,
          offset: Offset(0, 6),
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            'https://picsum.photos/seed/flutter/640/440',
            fit: BoxFit.cover,
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withValues(alpha: 0.75),
                ],
              ),
            ),
          ),
          const Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            child: Text(
              'Новости Flutter',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                shadows: [
  Shadow(
    color: Colors.white54,
    blurRadius: 4,
    offset: Offset(1, 1),
  ),
],
              ),
            ),
          ),
        ],
      ),
    ),
  ),
      const SizedBox(height: 12),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          'Короткое описание новости — что изображено на фото.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: Colors.black54,
            height: 1.4,
          ),
        ),
      ),
    ],
  ), // Column
), // Center
              Center(child: Text('Чаты')),
              Center(
  child: Container(
    width: 300,
    padding: const EdgeInsets.all(24),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(28),
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 20,
          offset: Offset(0, 8),
        ),
      ],
    ),
    child: const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.teal,
          child: Icon(
            Icons.person,
            size: 45,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 16),
        Text(
          'Мой профиль',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text('Изучаю Flutter'),
      ],
    ),
  ),
),
            ],
          ),
        ),
      ),
    );
  }
}