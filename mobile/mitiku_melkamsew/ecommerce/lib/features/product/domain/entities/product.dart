import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String imageUrl;
  final String name;
  final double price;
  final String category;
  final String description;

  const Product({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.category,
    required this.description,
  });

  @override
  List<Object?> get props => [id, imageUrl, name, price, category, description];
}
