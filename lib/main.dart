// import 'package:flutter/material.dart';

// class Item {
//   final String category;
//   final String name;
//   final String imageUrl;

//   Item({required this.category, required this.name, required this.imageUrl});
// }

// final List<Item> items = [
//   Item(category: 'animales', name: 'Panda Rojo', imageUrl: 'assets/images/animales/panda-rojo.jpg'),
//   Item(category: 'animales', name: 'Tigre', imageUrl: 'assets/images/animales/tigre.jpg'),
//   Item(category: 'animales', name: 'Tucán', imageUrl: 'assets/images/animales/tucan.jpg'),
// ];

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Lista con Imágenes y Fuentes',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Lista con Imágenes y Fuentes'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: GridView.count(
//               crossAxisCount: 2,
//               children: List.generate(items.length, (index) {
//                 return _buildItem(context, items[index]);
//               }),
//             ),
//           ),
//           Container(
//             color: Colors.grey.shade300,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: GridView.count(
//                 crossAxisCount: 3,
//                 shrinkWrap: true,
//                 children: [
//                   _buildFontItem('Jersey25Charted'),
//                   _buildFontItem('Oswald'),
//                   _buildFontItem('PoetsenOne'),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildItem(BuildContext context, Item item) {
//     TextStyle textStyle;
//     switch (item.category) {
//       case 'alimentos':
//         textStyle = TextStyle(fontFamily: 'Jersey25Charted', fontSize: 20);
//         break;
//       case 'animales':
//         textStyle = TextStyle(fontFamily: 'Oswald', fontSize: 20);
//         break;
//       case 'lugares':
//         textStyle = TextStyle(fontFamily: 'PoetsenOne', fontSize: 20);
//         break;
//       default:
//         textStyle = TextStyle(fontSize: 20);
//     }

//     return Card(
//       child: Column(
//         children: [
//           Expanded(
//             child: Image.asset(
//               item.imageUrl,
//               fit: BoxFit.cover,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               item.name,
//               style: textStyle,
//               textAlign: TextAlign.center,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildFontItem(String fontFamily) {
//     TextStyle textStyle = TextStyle(fontFamily: fontFamily, fontSize: 20);

//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Text(
//           'Texto de ejemplo',
//           style: textStyle,
//           textAlign: TextAlign.center,
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'product.dart';
import 'product_details_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Detalles de Producto',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductListScreen(),
    );
  }
}

class ProductListScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: 'Panda Rojo',
      price: 29.99,
      description: 'Un panda rojo adorable y juguetón.',
      imageUrl: 'assets/images/animales/panda-rojo.jpg',
    ),
    Product(
      name: 'Tigre',
      price: 49.99,
      description: 'Un tigre majestuoso y feroz.',
      imageUrl: 'assets/images/animales/tigre.jpg',
    ),
    Product(
      name: 'Tucán',
      price: 19.99,
      description: 'Un tucán colorido y exótico.',
      imageUrl: 'assets/images/animales/tucan.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Productos'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(products.length, (index) {
          return _buildProductItem(context, products[index]);
        }),
      ),
    );
  }

  Widget _buildProductItem(BuildContext context, Product product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(product: product),
          ),
        );
      },
      child: Card(
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                product.name,
                style: TextStyle(
                  fontFamily: 'Oswald',
                  fontSize: 20,
                ),
                textAlign: TextAlign.center, // Asegúrate de que esté dentro del Text widget
              ),
            ),
          ],
        ),
      ),
    );
  }
}
