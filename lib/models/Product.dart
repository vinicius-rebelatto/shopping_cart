//lib/models/Product.dart

import 'dart:ffi';

class Product {
  final String id;
  final String name;
  final int quantity;
  final bool purchased;
  final double? price;
  final DateTime? addedAt;

  Product({
    required this.id,
    required this.name,
    required this.quantity,
    this.purchased = false,
    this.price,
    this.addedAt,
  }) :  assert(quantity > 0, 'Quantity must be positive'),
        assert(price! >= 0, 'Price cannot be negative');

  Product.createNew({
    required this.name,
    required this.quantity,
    this.price,
  }) : id = '',
       purchased = false,
       addedAt =  DateTime.now();

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'quantity': quantity,
      'purchased': purchased,
      'price': price,
      'addedAt': addedAt?.toIso8601String(),
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
        id: map['id'] ?? '',
        name: map['name'] ?? '',
        quantity: map['quantity']?.toInt() ?? 1,
        purchased: map['purchased'] ?? false,
        price: map['price']?.toDouble() ?? 0.0,
        addedAt: map['addedAt'] != null ? DateTime.parse(map['addedAt']) : null,
    );
  }

  Product copyWith({
    String? id,
    String? name,
    int? quantity,
    bool? purchased,
    double? price,
    DateTime? addedAt,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      purchased: purchased ?? this.purchased,
      price: price ?? this.price,
      addedAt: addedAt ?? this.addedAt,
    );
  }
}