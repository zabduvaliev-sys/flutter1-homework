import 'package:flutter/material.dart';

void main() => runApp(const NewsApp());

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Новости',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.teal,
        scaffoldBackgroundColor: Colors.grey[50],
      ),
      home: const NewsHome(),
    );
  }
}

class NewsHome extends StatelessWidget {
  const NewsHome({super.key});

  final List<Map<String, String>> news = const [
    {
      'title': 'Flutter: создаём приложения',
      'subtitle': 'Знакомимся с виджетами и учимся собирать интерфейсы.',
      'image': 'https://picsum.photos/seed/flutter1/400/200',
    },
    {
      'title': 'Что нового в технологиях',
      'subtitle': 'Короткий обзор интересных новостей из мира IT.',
      'image': 'https://picsum.photos/seed/tech2/400/200',
    },
    {
      'title': 'Дизайн мобильных приложений',
      'subtitle': 'Как сделать экран понятным и удобным.',
      'image': 'https://picsum.photos/seed/design3/400/200',
    },
    {
      'title': 'Учимся программировать',
      'subtitle': 'Практика помогает лучше понять Dart и Flutter.',
      'image': 'https://picsum.photos/seed/code4/400/200',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Новости'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: news.length,
        itemBuilder: (context, index) {
          final item = news[index];

          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            clipBehavior: Clip.antiAlias,
            elevation: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  item['image']!,
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['title']!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(item['subtitle']!),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}