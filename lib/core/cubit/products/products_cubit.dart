import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lines_co_test/core/cubit/products/products_states.dart';
import 'package:lines_co_test/core/models/product_model.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  void loadProducts() async {
    try {
      emit(ProductLoading());
      await Future.delayed(Duration(seconds: 1));
      emit(ProductLoaded(products: _dummyProducts));
    } catch (e) {
      emit(ProductError('Failed to load products'));
    }
  }

  void toggleFavorite(String productId) {
    if (state is ProductLoaded) {
      final currentState = state as ProductLoaded;
      final updatedProducts = currentState.products.map((product) {
        if (product.id == productId) {
          return product.copyWith(isFavorite: !product.isFavorite);
        }
        return product;
      }).toList();
      emit(ProductLoaded(products: updatedProducts));
    }
  }

  void setQuantity(int quantity) {
    if (state is ProductLoaded) {
      final currentState = state as ProductLoaded;
      emit(currentState.copyWith(quantity: quantity));
    }
  }

  void setSize(String size) {
    if (state is ProductLoaded) {
      final currentState = state as ProductLoaded;
      emit(currentState.copyWith(size: size));
    }
  }

  void setDoughType(int doughType) {
    if (state is ProductLoaded) {
      final currentState = state as ProductLoaded;
      emit(currentState.copyWith(doughType: doughType));
    }
  }

  void setSauceType(int sauceType) {
    if (state is ProductLoaded) {
      final currentState = state as ProductLoaded;
      emit(currentState.copyWith(sauceType: sauceType));
    }
  }

  void addAdditionalChoice(String choice) {
    if (state is ProductLoaded) {
      final currentState = state as ProductLoaded;
      final updatedChoices = List<String>.from(currentState.additionalChoices)
        ..add(choice);
      emit(currentState.copyWith(additionalChoices: updatedChoices));
    }
  }

  void removeAdditionalChoice(String choice) {
    if (state is ProductLoaded) {
      final currentState = state as ProductLoaded;
      final updatedChoices = List<String>.from(currentState.additionalChoices)
        ..remove(choice);
      emit(currentState.copyWith(additionalChoices: updatedChoices));
    }
  }

  void addRemoveFromPizza(String item) {
    if (state is ProductLoaded) {
      final currentState = state as ProductLoaded;
      final updatedItems = List<String>.from(currentState.removeFromPizza)
        ..add(item);
      emit(currentState.copyWith(removeFromPizza: updatedItems));
    }
  }

  void removeRemoveFromPizza(String item) {
    if (state is ProductLoaded) {
      final currentState = state as ProductLoaded;
      final updatedItems = List<String>.from(currentState.removeFromPizza)
        ..remove(item);
      emit(currentState.copyWith(removeFromPizza: updatedItems));
    }
  }

  static final List<Product> _dummyProducts = [
    Product(
      id: '1',
      name: 'Air Jordan',
      price: 75.0,
      rating: 4.5,
      description: 'High quality Air Jordan shoes.',
      orders: 17,
      availableQuantity: 10,
      imageUrl: 'assets/images/shoes_1.png',
      store: Store(
        id: '0',
        name: 'Air',
        imageUrl: 'assets/icons/nike_logo.png',
      ),
      reviews: Reviews(
        count: 9,
        productReviews: {
          'total': 3.1,
          'reviews': [
            '',
            '',
            '',
          ]
        },
        sellerReviews: {
          'total': 4.2,
          'reviews': [
            '',
            '',
            '',
          ]
        },
        deliveryReviews: {
          'total': 2.3,
          'reviews': [
            '',
            '',
            '',
          ]
        },
      ),
      isFavorite: false,
    ),
    Product(
      id: '2',
      name: 'Nike Running Shoes',
      price: 120.0,
      rating: 4.0,
      description: 'Comfortable and durable running shoes.',
      orders: 23,
      availableQuantity: 15,
      imageUrl: 'assets/images/shoes_2.png',
      store: Store(
        id: '1',
        name: 'Nike',
        imageUrl: 'assets/icons/nike_logo.png',
      ),
      reviews: Reviews(
        count: 6,
        productReviews: {
          'total': 1.4,
          'reviews': [
            '',
            '',
            '',
          ]
        },
        sellerReviews: {
          'total': 2.5,
          'reviews': [
            '',
            '',
            '',
          ]
        },
        deliveryReviews: {
          'total': 3.6,
          'reviews': [
            '',
            '',
            '',
          ]
        },
      ),
      isFavorite: false,
    ),
    Product(
      id: '3',
      name: 'Women Shoes',
      price: 120.0,
      rating: 4.0,
      description: 'Comfortable and durable running shoes.',
      orders: 23,
      availableQuantity: 15,
      imageUrl: 'assets/images/shoes_3.png',
      store: Store(
        id: '2',
        name: 'Women',
        imageUrl: 'assets/icons/nike_logo.png',
      ),
      reviews: Reviews(
        count: 2,
        productReviews: {
          'total': 2.7,
          'reviews': [
            '',
            '',
            '',
          ]
        },
        sellerReviews: {
          'total': 3.9,
          'reviews': [
            '',
            '',
            '',
          ]
        },
        deliveryReviews: {
          'total': 4.8,
          'reviews': [
            '',
            '',
            '',
          ]
        },
      ),
      isFavorite: false,
    ),
  ];
}
