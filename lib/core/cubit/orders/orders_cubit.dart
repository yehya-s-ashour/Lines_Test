import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lines_co_test/core/cubit/orders/orders_states.dart';
import 'package:lines_co_test/core/models/order_model.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());

  String _selectedOrganization = 'School';
  void loadOrders() async {
    try {
      emit(OrderLoading());
      emit(OrderLoaded(
          orders: _dummyOrders, selectedOrganization: _selectedOrganization));
    } catch (e) {
      emit(OrderError('Failed to load orders'));
    }
  }

  void toggleOrganization(String organization) {
    _selectedOrganization = organization;
    emit(OrderLoaded(
        orders: _dummyOrders, selectedOrganization: _selectedOrganization));
  }

  String get selectedOrganization => _selectedOrganization;

  List<Order> get filteredOrders {
    if (state is OrderLoaded) {
      final currentState = state as OrderLoaded;
      return currentState.orders
          .where((order) => order.organization == _selectedOrganization)
          .toList();
    }
    return [];
  }

  static final List<Order> _dummyOrders = [
    Order(
      id: '1',
      passengerCount: '7',
      departureAddress: 'Jadah , Riyadh , Al-Jouf',
      arrivalAddress: '2972 Westheimer Rd. Santa Ana',
      arrivalTime: '10:30 PM',
      days: 'All Days',
      isRefunded: true,
      status: 'Completed',
      organization: 'School',
    ),
    Order(
      id: '1',
      passengerCount: '7',
      departureAddress: 'Jadah , Riyadh , Al-Jouf',
      arrivalAddress: '2972 Westheimer Rd. Santa Ana',
      arrivalTime: '5:30 PM',
      days: 'All Days',
      isRefunded: false,
      status: 'Completed',
      organization: 'School',
    ),
    Order(
      id: '2',
      passengerCount: '5',
      departureAddress: 'Riyadh, Saudi Arabia',
      arrivalAddress: 'Mall of Arabia, Jeddah',
      arrivalTime: '4:00 PM',
      days: 'Weekdays',
      isRefunded: false,
      status: 'In Progress',
      organization: 'University',
    ),
    Order(
      id: '3',
      passengerCount: '3',
      departureAddress: 'Riyadh, Saudi Arabia',
      arrivalAddress: 'Kingdom Tower',
      arrivalTime: '2:00 PM',
      days: 'Weekdays',
      isRefunded: true,
      status: 'In Progress',
      organization: 'Work',
    ),
    Order(
      id: '4',
      passengerCount: '4',
      departureAddress: 'Riyadh, Saudi Arabia',
      arrivalAddress: 'Sports City',
      arrivalTime: '5:00 PM',
      days: 'Weekdays',
      isRefunded: true,
      status: 'Completed',
      organization: 'Sporting Club',
    ),
  ];
}
