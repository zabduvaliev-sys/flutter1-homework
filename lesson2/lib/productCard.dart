
import 'package:flutter/material.dart';
import 'constants.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String category;
  final int rating;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.category,
     required this.rating,
  });

  @override
  Widget build(BuildContext context) {
   return Container(
  constraints: const BoxConstraints(
    maxHeight: 400,
  ),
      padding: const EdgeInsets.all(paddingSize),
      decoration: BoxDecoration(
       color: const Color(0xFFFFF8E7),
        borderRadius: BorderRadius.circular(cardRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          const SizedBox(height: 8),
          Text(price),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              category,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(height: 8),

Row(
  children: List.generate(
    5,
    (index) => Icon(
      index < rating ? Icons.star : Icons.star_border,
      size: 16,
      color: Colors.amber,
    ),
  ),
),
const SizedBox(height: 8),

SizedBox(
  width: double.infinity,
  child: ElevatedButton(
    onPressed: () {},
    child: const Text('Купить'),
  ),
),

const SizedBox(height: 8),

SizedBox(
  width: double.infinity,
  child: OutlinedButton(
    onPressed: () {},
    child: const Text('В избранное'),
  ),
),
        ],
      ),
    );
  }
}
