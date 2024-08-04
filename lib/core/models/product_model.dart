import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String name;
  final double price;
  final double rating;
  final String description;
  final int orders;
  final int availableQuantity;
  final String imageUrl;
  final Store store;
  final Reviews reviews;
  final bool isFavorite;

  Product({
    required this.store,
    required this.reviews,
    required this.isFavorite,
    required this.id,
    required this.name,
    required this.price,
    required this.rating,
    required this.description,
    required this.orders,
    required this.availableQuantity,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        price,
        rating,
        reviews,
        description,
        orders,
        availableQuantity,
        imageUrl,
        store,
        reviews,
        isFavorite
      ];
  Product copyWith({
    String? id,
    String? name,
    double? price,
    double? rating,
    String? description,
    int? orders,
    int? availableQuantity,
    String? imageUrl,
    Store? store,
    Reviews? reviews,
    bool? isFavorite,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      rating: rating ?? this.rating,
      description: description ?? this.description,
      orders: orders ?? this.orders,
      availableQuantity: availableQuantity ?? this.availableQuantity,
      imageUrl: imageUrl ?? this.imageUrl,
      store: store ?? this.store,
      reviews: reviews ?? this.reviews,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}

class Store {
  final String id;
  final String name;
  final String imageUrl;

  Store({
    required this.id,
    required this.name,
    required this.imageUrl,
  });
}

class Reviews {
  final int count;
  final Map productReviews;
  final Map sellerReviews;
  final Map deliveryReviews;

  Reviews({
    required this.count,
    required this.productReviews,
    required this.sellerReviews,
    required this.deliveryReviews,
  });
}
