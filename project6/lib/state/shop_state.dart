import 'package:flutter/foundation.dart';
import 'package:project6/data/products_data.dart';
import 'package:project6/models/product.dart';

enum SortType{none, priceAsc, priceDesc}

class ShopState extends ChangeNotifier{
  int cartCount = 0; //к-сть товарів в кошику
  double total = 0; //Сума покупок
  bool onlyCheap = false; //Показуємо дешеві товари
  SortType sort = SortType.none; //Тип сортування

  List<Product> get visibleProducts {

    List<Product> list = List<Product>.from(productsData);

    // фільтр тільки дешеві
    if (onlyCheap) {
      list = list.where((p) => p.price <= 3000).toList();
    }

    // Сортування від дешевих до дорогих
    if (sort == SortType.priceAsc) {
      list.sort((a, b) => a.price.compareTo(b.price));
    }

    // Сортування від дорогих до дешевих
    if (sort == SortType.priceDesc) {
      list.sort((a, b) => b.price.compareTo(a.price));
    }

    // фінальний список
    return list;
  }

  //Додати товар в кошик
  void addToCart(Product product){
    cartCount++;

    total += product.price;

    notifyListeners();
  }

  //Очистити кошик
  void clearCart(){
    cartCount =0;

    total =0;

    notifyListeners();
  }

  // Ввімкнути/вимкнути фільтри дешевих товарів
  void setOnlyCheap(bool value){
    onlyCheap = value;

    notifyListeners();
  }


  //Встановлення типу сортування
  void setSort(SortType value){
    sort = value;
    notifyListeners();
  }


  
}
