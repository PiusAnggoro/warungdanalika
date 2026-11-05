import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import 'checkout_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Keranjang Belanja')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, i) {
                final item = cart.items.values.toList()[i];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: ListTile(
                    title: Text(item.title),
                    subtitle: Text('Total: Rp ${(item.price * item.quantity).toStringAsFixed(0)}'),
                    trailing: Text('${item.quantity}x'),
                  ),
                );
              },
            ),
          ),
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total:', style: TextStyle(fontSize: 20)),
                  Text('Rp ${cart.totalAmount.toStringAsFixed(0)}', style: const TextStyle(fontSize: 20, color: Colors.green)),
                  TextButton(
                    onPressed: cart.totalAmount <= 0
                        ? null
                        : () => Navigator.push(context, MaterialPageRoute(builder: (ctx) => const CheckoutScreen())),
                    child: const Text('PROSES BAYAR'),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
