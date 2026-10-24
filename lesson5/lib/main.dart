import 'package:flutter/material.dart';

void main() {
  runApp(const NavApp());
}

class NavApp extends StatelessWidget {
  const NavApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ProductListPage(),
    );
  }
}

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  final List<Map<String, String>> products = const [
    {
      'title': 'Товар 1',
      'desc': 'Описание товара 1',
      'image': 'https://picsum.photos/seed/item1/200/140',
    },
    {
      'title': 'Товар 2',
      'desc': 'Описание товара 2',
      'image': 'https://picsum.photos/seed/item2/200/140',
    },
    {
      'title': 'Товар 3',
      'desc': 'Описание товара 3',
      'image': 'https://picsum.photos/seed/item3/200/140',
    },
    {
      'title': 'Товар 4',
      'desc': 'Описание товара 4',
      'image': 'https://picsum.photos/seed/item4/200/140',
    },
    {
      'title': 'Товар 5',
      'desc': 'Описание товара 5',
      'image': 'https://picsum.photos/seed/item5/200/140',
    },
    {
      'title': 'Товар 6',
      'desc': 'Описание товара 6',
      'image': 'https://picsum.photos/seed/item6/200/140',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Список товаров'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final item = products[index];

          return Card(
            child: ListTile(
              leading: Image.network(
                item['image']!,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
              title: Text(item['title']!),
              subtitle: Text(item['desc']!),
              onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => ProductDetailPage(
        title: item['title']!,
        desc: item['desc']!,
        imageUrl: item['image']!,
      ),
    ),
  );
},
            ),
          );
        },
      ),
    );
  }
}
class ProductDetailPage extends StatelessWidget {
  final String title;
  final String desc;
  final String imageUrl;

  const ProductDetailPage({
    super.key,
    required this.title,
    required this.desc,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(desc),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => OrderPage(productTitle: title),
                    ),
                  );
                },
                child: const Text('Купить'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}class OrderConfirmationPage extends StatelessWidget {
  final String productTitle;

  const OrderConfirmationPage({
    super.key,
    required this.productTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Подтверждение заказа')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 80,
            ),
            const SizedBox(height: 16),
            const Text(
              'Заказ успешно оформлен',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text('Товар: $productTitle'),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: const Text('Вернуться в каталог'),
            ),
          ],
        ),
      ),
    );
  }
}class OrderPage extends StatelessWidget {
  final String productTitle;

  const OrderPage({
    super.key,
    required this.productTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Оформление заказа')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Вы выбрали: $productTitle'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => OrderConfirmationPage(
                      productTitle: productTitle,
                    ),
                  ),
                );
              },
              child: const Text('Оплатить'),
            ),
          ],
        ),
      ),
    );
  }
}