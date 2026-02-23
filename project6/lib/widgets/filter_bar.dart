import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project6/state/shop_state.dart';

class FilterBar extends StatelessWidget {
  const FilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Consumer<ShopState>(
          builder: (context, state, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Тільки дешеві (<= 3000)',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    Switch(
                      value: state.onlyCheap,
                      onChanged: (value) {
                        Provider.of<ShopState>(context, listen: false).setOnlyCheap(value);
                      },
                    ),
                  ],
                ),


                const SizedBox(height: 8),

                Row(
                  children: [
                    Expanded(
                      child: DropdownButton<SortType>(
                        value: state.sort,
                        isExpanded: true,
                        items: const [
                          DropdownMenuItem(
                            value: SortType.none,
                            child: Text('Без сортування'),
                          ),
                          DropdownMenuItem(
                            value: SortType.priceAsc,
                            child: Text('Ціна: зростання'),
                          ),
                          DropdownMenuItem(
                            value: SortType.priceDesc,
                            child: Text('Ціна: спадання'),
                          ),
                        ],
                        onChanged: (value) {
                          if (value == null) return;
                          Provider.of<ShopState>(context, listen: false).setSort(value);
                        },
                      ),
                    ),


                    const SizedBox(width: 12),

                    ElevatedButton(
                      onPressed: () {
                        Provider.of<ShopState>(context, listen: false).clearCart();

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Кошик очищено'),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      },
                      child: const Text('Очистити'),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}