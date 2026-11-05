import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: Column(
        children: [
          Image.network(product.imageUrl, height: 300,
              width: double.infinity,
              fit: BoxFit.cover),
          const SizedBox(height: 10),
          Text('Rp ${product.price.toStringAsFixed(0)}',
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                  fontWeight: FontWeight.bold)),
          Text(product.description, textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16)),
          const Spacer(),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50)),
            icon: const Icon(Icons.add_shopping_cart),
            label: const Text('Tambah ke Keranjang'),
            onPressed: () {
              cart.addToCart(product);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text('${product.title} ditambahkan ke keranjang!'),
                    duration: const Duration(seconds: 2)),
              );
            },
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
