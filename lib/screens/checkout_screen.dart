import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: const Text('Proses Pembayaran')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.payment, size: 100, color: Colors.blue),
              const SizedBox(height: 20),
              const Text('Selesaikan Pembayaran Anda', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text('Total tagihan: Rp ${cart.totalAmount.toStringAsFixed(0)}', style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white, minimumSize: const Size(200, 50)),
                onPressed: () {
                  // Mengosongkan keranjang setelah bayar berhasil
                  cart.clearCart();
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text('Sukses'),
                      content: const Text('Pembayaran Berhasil! Terima kasih telah berbelanja.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(ctx); // Tutup dialog
                            Navigator.popUntil(context, (route) => route.isFirst); // Kembali ke Katalog
                          },
                          child: const Text('OK'),
                        )
                      ],
                    ),
                  );
                },
                child: const Text('Bayar Sekarang'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
