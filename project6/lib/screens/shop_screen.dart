import 'package:flutter/material.dart';
import 'package:project6/state/shop_state.dart';
import 'package:project6/widgets/cart_summary.dart';
import 'package:project6/widgets/filter_bar.dart';
import 'package:project6/widgets/product_list.dart';
import 'package:provider/provider.dart';


class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Consumer<ShopState>(
          builder: (context, state, _){
            return Text('Mini shop | Кошик: ${state.cartCount}');
          },
        ),
      ),
      body: Column(
        children: [
          const FilterBar(),
          Expanded(
            child: Consumer<ShopState>(
              builder: (context, state, _) {
                return ProductList(
                  products: state.visibleProducts,
                  onBuy: (product) {
                    Provider.of<ShopState>(context, listen: false).addToCart(product);

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Додано до кошика'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  },
                );
              },
            ),
          ),

          const CartSummary(),
        ],
      ),

    );
  }
}
