import 'package:flutter/material.dart';
import 'package:project5/models/product.dart';

//Картка одного товару

class ProductCard extends StatelessWidget{
  final Product product;

  //Callback функція, викликаємо onBuy і передаємо товар батьківському віджету
  final void Function(Product product) onBuy;

  const ProductCard({
    super.key, 
    required this.product, 
    required this.onBuy
    });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(product.title, style: theme.textTheme.bodyMedium,),

        subtitle: Text('Ціна: ${product.price} грн', style: theme.textTheme.bodySmall,),

        trailing: ElevatedButton(
          onPressed: () {
            onBuy(product);
          },
          child: const Text('Купити'),
        ),
      ),
    );
  }
}