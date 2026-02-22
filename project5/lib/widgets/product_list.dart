import 'package:flutter/material.dart';
import 'package:project5/models/product.dart';
import 'package:project5/widgets/product_card.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;
  final void Function(Product product) onBuy;
  const ProductList({
    super.key, 
    required this.products, 
    required this.onBuy
    });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,

      itemBuilder: (context, index) {
        final product = products[index];

        return ProductCard(
          product: product,
          onBuy: onBuy,
        );
      },
    );
  }
}
