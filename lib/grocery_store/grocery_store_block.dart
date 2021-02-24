import 'package:flutter/material.dart';

import 'package:tiendaflu/grocery_store/grocery_product.dart';

enum GroceryState{
  normal, 
  details,
  cart,
}

class GrocerystoreBlock with ChangeNotifier{
   
   GroceryState groceryState = GroceryState.normal;
   List<GroceryProduct> catelog = List.unmodifiable(groceryProducts);
   List<GroceryProductItem> cart = [];

   void changeToNormal(){
     groceryState = GroceryState.normal;
     notifyListeners();
   }

   void changeToCart(){
     groceryState = GroceryState.cart;
     notifyListeners();
   }

   void addProduct(GroceryProduct product){
     for (GroceryProductItem item in cart){
       if (item.product.name == product.name){
         item.increment();
         notifyListeners();
         return;
       }
     }
     cart.add(GroceryProductItem(product: product));
     notifyListeners();
   }

  //eliminar productos desde el total
   void deletedProduct(GroceryProductItem productItem){
     cart.remove(productItem);
     notifyListeners();
   }
  
  int totalCartsElementes() => cart.fold<int>(0, (previousValue, element) => previousValue + element.quantity);

  double totalPriceElementes() => cart.fold<double>(
    0.0, 
    (previousValue, element) => previousValue + ( element.quantity* element.product.price),
  );
}

class GroceryProductItem {
  GroceryProductItem({this.quantity = 1, @required this.product});
  int quantity;
  final GroceryProduct product;

  void increment(){
    quantity++;
  }

  void decrement(){}

  


}