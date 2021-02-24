import 'package:flutter/material.dart';
import 'package:tiendaflu/grocery_store/grocery_provider.dart';
import 'package:tiendaflu/grocery_store/grocery_store_details.dart';
import 'package:tiendaflu/grocery_store/grocery_store_home.dart';
//import 'package:store_flutter/grocery_store/grocery_store_home.dart';

class GroceryStoreList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = GroceryProvider.of(context).block;
//Se pintan los productos en forma dual
    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.only(top: cartBarHeight, left: 10, right: 10),
      child: StaggeredDualView(
        aspectRatio: 0.7,
        offsetPercent: 0.3,
        spacing: 20,
        itemBuilder: (context, index) {
          final product = bloc.catelog[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 900),
                  pageBuilder: (context, animation, __) {
                    return FadeTransition(
                        opacity: animation,
                        child: GroceryStoreDetails(
                            product: product,
                            onProductAdd: () {
                              bloc.addProduct(product);
                            }));
                  },
                ),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 8,
              shadowColor: Colors.black45,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Hero(
                        tag: 'list_${product.name}',
                        child: Image.asset(
                          product.image,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Text(
                      '\$${product.price}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      product.name,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      product.weight,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: bloc.catelog.length,
      ),
    );

//Se pintan los productos en forma de lista
    /*return ListView.builder(
      padding: const EdgeInsets.only(top: cartBarHeight),
      itemCount: bloc.catelog.length,
      itemBuilder: (context, index){
        return Container(
          height: 100,
          width: 100,
          color: Colors.primaries[index % Colors.primaries.length],
        );
      }
    );*/
  }
}

//widgett de elementos en grilla 2
class StaggeredDualView extends StatelessWidget {
  const StaggeredDualView({
    Key key,
    @required this.itemBuilder,
    @required this.itemCount,
    this.spacing = 0.0,
    this.aspectRatio = 0.5,
    this.offsetPercent = 0.5,
  }) : super(key: key);

  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final double spacing;
  final double aspectRatio;
  final double offsetPercent;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final itemHeight = (width * 0.5) / aspectRatio;
        final height = constraints.maxHeight + itemHeight;
        return OverflowBox(
          maxWidth: width,
          minWidth: width,
          maxHeight: height,
          minHeight: height,
          child: GridView.builder(
              padding: EdgeInsets.only(top: itemHeight / 2, bottom: itemHeight),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: aspectRatio,
                crossAxisSpacing: spacing,
                mainAxisSpacing: spacing,
              ),
              itemCount: itemCount,
              itemBuilder: (context, index) {
                return Transform.translate(
                  offset: Offset(
                      0.0, index.isOdd ? itemHeight * offsetPercent : 0.0),
                  child: itemBuilder(context, index),
                );
              }),
        );
      },
    );
  }
}
