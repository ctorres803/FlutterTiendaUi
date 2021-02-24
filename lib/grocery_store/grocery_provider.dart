import 'package:flutter/material.dart';

import 'package:tiendaflu/grocery_store/grocery_store_block.dart';

class GroceryProvider extends InheritedWidget {
  

  final GrocerystoreBlock block;
  final Widget child;

  GroceryProvider({
    @required this.block, 
    @required this.child
    }): super(child: child);

  static GroceryProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GroceryProvider>();
  }

  @override
  bool updateShouldNotify(GroceryProvider oldWidget) {
    return true;
  }
}