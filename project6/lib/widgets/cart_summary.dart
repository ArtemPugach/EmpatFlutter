import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project6/state/shop_state.dart';

class CartSummary extends StatelessWidget {
  const CartSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ShopState>(
      builder: (context, state, _) {
        return SafeArea(
          top: false,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Theme.of(context).cardTheme.color,
              border: const Border(
                top: BorderSide(width: 1),
              ),
            ),
            
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'У кошику: ${state.cartCount} | Сума: ${state.total.toStringAsFixed(0)} грн',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}