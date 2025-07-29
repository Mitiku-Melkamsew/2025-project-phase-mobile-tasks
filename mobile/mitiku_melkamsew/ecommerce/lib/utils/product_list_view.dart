import 'package:flutter/material.dart';
import 'package:ecommerce/data.dart';
import 'package:ecommerce/utils/card.dart';

class ProductListView extends StatelessWidget {
  final List<Product> products;

  const ProductListView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return const Center(
        child: Text('No products found.'),
      );
    }

    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              '/details',
              arguments: product,
            );
          },
          child: ProductCard(product: product),
        );
      },
    );
  }
}