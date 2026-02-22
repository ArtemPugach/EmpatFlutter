import 'package:flutter/material.dart';
import 'package:project5/data/products_data.dart';
import 'package:project5/widgets/product_list.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  int cartCount = 0; //Лічильник товарів у кошику


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mini shop | Кошик: $cartCount'),
        centerTitle: true,
      ),
      body: ProductList(
        products: productsData, //Передача списку товарів

        onBuy: (product) {
          setState(() {
            cartCount++; //Передача ф-ії яка збільшує кошик
          });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Додано до кошика'),
              duration: Duration(seconds: 2),
            )
          );
        },
      ),

    );
  }
}
