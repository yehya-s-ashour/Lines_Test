import 'package:equatable/equatable.dart';

class Order extends Equatable {
  final String id;
  final String passengerCount;
  final String departureAddress;
  final String arrivalAddress;
  final String arrivalTime;
  final String days;
  final bool isRefunded;
  final String status;
  final String organization;

  Order({
    required this.id,
    required this.passengerCount,
    required this.departureAddress,
    required this.arrivalAddress,
    required this.arrivalTime,
    required this.days,
    required this.isRefunded,
    required this.status,
    required this.organization,
  });

  @override
  List<Object?> get props => [
        id,
        passengerCount,
        departureAddress,
        arrivalAddress,
        arrivalTime,
        days,
        isRefunded,
        status,
        organization,
      ];

  Order copyWith({
    String? id,
    String? passengerCount,
    String? departureAddress,
    String? arrivalAddress,
    String? arrivalTime,
    String? days,
    bool? isRefunded,
    String? status,
    String? organization,
  }) {
    return Order(
      id: id ?? this.id,
      passengerCount: passengerCount ?? this.passengerCount,
      departureAddress: departureAddress ?? this.departureAddress,
      arrivalAddress: arrivalAddress ?? this.arrivalAddress,
      arrivalTime: arrivalTime ?? this.arrivalTime,
      days: days ?? this.days,
      isRefunded: isRefunded ?? this.isRefunded,
      status: status ?? this.status,
      organization: organization ?? this.organization,
    );
  }
}
