import 'package:flutter/material.dart';
import '../models/product.dart';
import 'detail_screen.dart';
import 'cart_screen.dart';

class CatalogScreen extends StatelessWidget {
  CatalogScreen({super.key});

  // Dummy Data Produk
  final List<Product> dummyProducts = [
    Product(id: 'p1', title: 'Sepatu Keren', description: 'Sepatu nyaman untuk jalan-jalan.', price: 250000, imageUrl: 'https://images.unsplash.com/photo-1608666634759-4376010f863d?q=60&w=800'),
    Product(id: 'p2', title: 'Kaos Polos', description: 'Bahan katun adem 100%.', price: 75000, imageUrl: 'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?q=60&w=800'),
    Product(id: 'p3', title: 'Tas Ransel', description: 'Kapasitas besar dan tahan air.', price: 180000, imageUrl: 'https://images.unsplash.com/photo-1546938576-6e6a64f317cc?q=60&w=800'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Katalog Toko'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (ctx) => const CartScreen())),
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: dummyProducts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (ctx, i) {
          final product = dummyProducts[i];
          return GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (ctx) => DetailScreen(product: product))),
            child: Card(
              elevation: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Image.network(product.imageUrl, fit: BoxFit.cover, width: double.infinity),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(product.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                        Text('Rp ${product.price.toStringAsFixed(0)}', style: const TextStyle(color: Colors.green)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
