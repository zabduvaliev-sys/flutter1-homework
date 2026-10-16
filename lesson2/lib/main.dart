import 'package:flutter/material.dart';
import 'productCard.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
body: Padding(
  padding: const EdgeInsets.all(16),
  child: Center(
    child: SizedBox(
      width: 240,
      child: ProductCard(
        title: 'Nike Air Max',
        price: '\$120',
        category: 'Обувь',
        rating: 4,
      ),
    ),
  ),
),
    ),
    );
  }
}
