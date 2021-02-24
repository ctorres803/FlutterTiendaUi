/*
En este archivo se queman los datos que se pintan en el listView,
como futura actualizacion extraer los datos de una base de datos, API o firebase*/ 

class GroceryProduct {
  const GroceryProduct({
    this.price,
    this.name,
    this.description,
    this.image,
    this.weight,
  });
  final double price ;
  final String name;
  final String description;
  final String image;
  final String weight;
}

const groceryProducts = <GroceryProduct>[
  GroceryProduct(
    price: 5000,
    name: 'Aguacate',
    description: 
            'El aguacate es una fruta exotica que se obtiene de los tropicos',
    image: 'assets/grocery_store/aguacate.png',
    weight: '500g'),

    GroceryProduct(
    price: 300,
    name: 'Banano',
    description: 
              'Es una buena fruta para todas las personas menos para los diabeticos',
    image: 'assets/grocery_store/banano.png',
    weight: '150g'),

    GroceryProduct(
    price: 900,
    name: 'Mango',
    description: 
              'El mango es reconoocido como una de las mejores frutas tropicales',
    image: 'assets/grocery_store/mango.png',
    weight: '500g'),

    GroceryProduct(
    price: 2500,
    name: 'Piña',
    description: 
              'La piña es una fruta tropical que es obtenida de una plata la cual recive el mismo nombre',
    image: 'assets/grocery_store/pina.png',
    weight: '1000g'),

    GroceryProduct(
    price: 1000,
    name: 'Manzana',
    description: 
                'La manzana es una de las frutas mas ricas para un breake',
    image: 'assets/grocery_store/manzana.png',
    weight: '650g'),

    GroceryProduct(
    price: 450,
    name: 'Naranja',
    description: 
              'La narajan es una de la mejores frutas citricas con alto contenido de vitamina C',
    image: 'assets/grocery_store/naranja.png',
    weight: '220g'),
];