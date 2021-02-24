import 'package:flutter/material.dart';

import 'package:tiendaflu/grocery_store/grocery_product.dart';

class GroceryStoreDetails extends StatefulWidget {
  const GroceryStoreDetails({Key key, @required this.product, this.onProductAdd})
      : super(key: key);
  final GroceryProduct product;
  final VoidCallback onProductAdd;

  @override
  _GroceryStoreDetailsState createState() => _GroceryStoreDetailsState();
}

class _GroceryStoreDetailsState extends State<GroceryStoreDetails> {

  String heroTag = '';


  void _addToCart(BuildContext context){
    setState(() {
      heroTag = 'details';
    });
    widget.onProductAdd();
    Navigator.of(context).pop();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                //contenido principal del detalle
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Hero(
                      tag: 'list_${widget.product.name}$heroTag',
                      child: Image.asset(
                        widget.product.image,
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height * 0.36,
                      ),
                    ),
                  ),
                  Text(
                    widget.product.name,
                    style: Theme.of(context).textTheme.headline5.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  
                  Text(
                    widget.product.weight,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(color: Colors.grey),
                  ),
                  Row(
                    children: [
                      Spacer(),
                      Text(
                        '\$${widget.product.price}',
                        style: Theme.of(context).textTheme.headline4.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                  
                  Text(
                    'Sobre el producto',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(                   
                    widget.product.description,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(color: Colors.black, fontWeight: FontWeight.w200),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: IconButton(
                    icon: Icon(
                      Icons.favorite_border,
                      color: Colors.black,
                    ),
                    onPressed: () => null,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: RaisedButton(
                    color: Color(0xFFF4C459),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Text(
                        'Agregar al carrito',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    onPressed: ()=> _addToCart(context),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/*
 Hero(
      tag: 'list_${product.name}',
      child: Image.asset(
      product.image,
      fit: BoxFit.cover,
    ),
  ),*/
