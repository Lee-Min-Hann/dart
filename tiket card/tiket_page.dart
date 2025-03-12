// tiket_page.dart
import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../widgets/tiket_card.dart';

class TiketPage extends StatelessWidget {
  const TiketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummyProducts.length,
          itemBuilder: (context, index) {
            final Product product = dummyProducts[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: TiketCard(product: product),
            );
          },
        ),
      ),
    );
  }
}
