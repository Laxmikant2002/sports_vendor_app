class Vendor {
  Vendor({required this.name, required this.rating, required this.price});

  factory Vendor.fromJson(Map<String, dynamic> json) {
    return Vendor(
      name: json['name'] as String,
      rating: (json['rating'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
    );
  }
  final String name;
  final double rating;
  final double price;
}
