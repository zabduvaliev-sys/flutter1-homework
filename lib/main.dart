
import 'package:flutter/material.dart';

void main() {
  runApp(const ProfileApp());
}

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Profile',
      debugShowCheckedModeBanner: false,
       theme: ThemeData(
    fontFamily: 'Roboto',
  ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  final String name = 'Tom Hardy';
  final int age = 49;
  final String bio = 'Actor';
  final String city = 'London';
  final List<String> interests = const [
  'Кино',
  'Спорт',
  'Путешествия',
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.yellow,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('images/tomhardy.jpg'),
            ),
            const SizedBox(height: 16),

            // Имя пользователя
            Text(
              name,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 8),

            // Домашнее задание №1: возраст под именем
            Text(
              'Возраст: $age лет',
              style: const TextStyle(fontSize: 16, color: Colors.amber, fontFamily: 'Roboto'),
            ),

            const SizedBox(height: 8),

            // Описание пользователя
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                bio,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: Colors.lightBlue,),
              ),
            ),
const SizedBox(height: 8),

Text(
  'Город: $city',
  style: const TextStyle(fontSize: 16, color: Colors.deepPurple,),
),

const SizedBox(height: 16),

const Text(
  'Интересы:',
  style: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  ),
),

const SizedBox(height: 8),

Text(
  interests.join('\n'),
  textAlign: TextAlign.center,
  style: const TextStyle(fontSize: 16, color: Colors.white),
),

            const SizedBox(height: 20),

            // Иконки социальных сетей
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.camera_alt, color: Colors.white,),
                  iconSize: 30,
                  onPressed: () {},
                ),
                const SizedBox(width: 12),
                IconButton(
                  icon: const Icon(Icons.alternate_email, color: Colors.white,),
                  iconSize: 30,
                  onPressed: () {},
                ),
                const SizedBox(width: 12),
                IconButton(
                  icon: const Icon(Icons.videocam, color: Colors.white,),
                  iconSize: 30,
                  onPressed: () {},
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Кнопка подписки
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Follow',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
