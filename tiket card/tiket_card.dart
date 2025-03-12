// lib/widgets/tiket_card.dart
import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../pages/tiket_page.dart';

class TiketCard extends StatelessWidget {
  final Product product; // Pastikan pakai Product

  const TiketCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: ListTile(
        leading: Image.network(product.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
        title: Text(product.name, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('Harga: Rp ${product.price}'),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.red),
          onPressed: () {
            _showDeleteDialog(context);
          },
        ),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Hapus Tiket'),
        content: Text('Apakah Anda yakin ingin menghapus tiket ini?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              // TODO: Implementasi hapus tiket
              Navigator.pop(context);
            },
            child: Text('Hapus', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
