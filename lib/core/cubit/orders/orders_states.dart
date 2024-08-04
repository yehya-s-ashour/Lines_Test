import 'package:equatable/equatable.dart';
import 'package:lines_co_test/core/models/order_model.dart';

abstract class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object?> get props => [];
}

class OrderInitial extends OrderState {}

class OrderLoading extends OrderState {}

class OrderLoaded extends OrderState {
  final List<Order> orders;
  final String selectedOrganization;

  const OrderLoaded({required this.orders, required this.selectedOrganization});

  OrderLoaded copyWith({List<Order>? orders, String? selectedOrganization}) {
    return OrderLoaded(
      orders: orders ?? this.orders,
      selectedOrganization: selectedOrganization ?? this.selectedOrganization,
    );
  }

  @override
  List<Object?> get props => [orders, selectedOrganization];
}

class OrderError extends OrderState {
  final String error;

  const OrderError(this.error);

  @override
  List<Object?> get props => [error];
}
