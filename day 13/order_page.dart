import 'package:flutter/material.dart';
import '../models/product_model.dart'; // Import model Product

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Page'),
      ),
      body: ListView.builder(
        itemCount: dummyProducts.length,
        itemBuilder: (context, index) {
          final product = dummyProducts[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: Image.network(product.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
              title: Text(product.name),
              subtitle: Text('Harga: Rp ${product.price.toStringAsFixed(0)}'),
              trailing: IconButton(
                icon: const Icon(Icons.add_shopping_cart),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${product.name} ditambahkan ke keranjang!')),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
