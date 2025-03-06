import 'package:flutter/material.dart';
import '../models/product_model.dart';

class OrderDetailPage extends StatelessWidget {
  final Product product;

  const OrderDetailPage({Key? key, required this.product}) : super(key: key);

  // Fungsi untuk menampilkan dialog QRIS
  void _showQRISDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Pembayaran QRIS"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                "https://via.placeholder.com/150", // Ganti dengan QR Code asli jika ada
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 10),
              const Text("Scan QR Code untuk melakukan pembayaran."),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Tutup"),
            ),
          ],
        );
      },
    );
  }

  // Fungsi untuk menampilkan dialog pembayaran tunai
  void _showCashDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Pembayaran Tunai"),
          content: const Text("Silakan lakukan pembayaran di kasir."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Oke"),
            ),
          ],
        );
      },
    );
  }

  // Fungsi untuk menampilkan dialog pilihan pembayaran
  void _showPaymentOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Pilih Metode Pembayaran",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                  _showQRISDialog(context);
                },
                icon: const Icon(Icons.qr_code),
                label: const Text("Bayar dengan QRIS"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  minimumSize: const Size(double.infinity, 50),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                  _showCashDialog(context);
                },
                icon: const Icon(Icons.attach_money),
                label: const Text("Bayar dengan Tunai"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: const Size(double.infinity, 50),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(product.name),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gambar Produk
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  product.imageUrl,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),

              // Kartu Detail Produk
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Harga: Rp ${product.price.toStringAsFixed(0)}",
                        style: const TextStyle(fontSize: 18, color: Colors.green),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Stok: ${product.stock ?? 'Tidak tersedia'}",
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Deskripsi:",
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        product.description ?? 'Tidak ada deskripsi',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Tombol Pesan Sekarang
              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => _showPaymentOptions(context),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Pesan Sekarang",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
