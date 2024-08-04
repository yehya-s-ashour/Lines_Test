import 'package:equatable/equatable.dart';
import 'package:lines_co_test/core/models/product_model.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object?> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Product> products;
  final int quantity;
  final String size;
  final int doughType;
  final int sauceType;
  final List<String> additionalChoices;
  final List<String> removeFromPizza;

  const ProductLoaded({
    required this.products,
    this.quantity = 1,
    this.size = 'Medium',
    this.doughType = 1,
    this.sauceType = 1,
    this.additionalChoices = const [],
    this.removeFromPizza = const [],
  });

  ProductLoaded copyWith({
    List<Product>? products,
    int? quantity,
    String? size,
    int? doughType,
    int? sauceType,
    List<String>? additionalChoices,
    List<String>? removeFromPizza,
  }) {
    return ProductLoaded(
      products: products ?? this.products,
      quantity: quantity ?? this.quantity,
      size: size ?? this.size,
      doughType: doughType ?? this.doughType,
      sauceType: sauceType ?? this.sauceType,
      additionalChoices: additionalChoices ?? this.additionalChoices,
      removeFromPizza: removeFromPizza ?? this.removeFromPizza,
    );
  }

  @override
  List<Object?> get props => [
        products,
        quantity,
        size,
        doughType,
        sauceType,
        additionalChoices,
        removeFromPizza,
      ];
}

class ProductError extends ProductState {
  final String error;

  const ProductError(this.error);

  @override
  List<Object?> get props => [error];
}
