class Product {
  final int id;
  final String name;
  final String imageUrl;
  final double price;
  final int? stock;
  final String? description;

  Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    this.stock,
    this.description,
  });
}

// Dummy data produk
List<Product> dummyProducts = [
  Product(
    id: 1,
    name: "Tiket Wisata A",
    imageUrl: "https://via.placeholder.com/150",
    price: 50000,
  ),
  Product(
    id: 2,
    name: "Tiket Wisata B",
    imageUrl: "https://via.placeholder.com/150",
    price: 75000,
  ),
  Product(
    id: 3,
    name: "Tiket Wisata C",
    imageUrl: "https://via.placeholder.com/150",
    price: 100000,
  ),
];
