import 'package:equatable/equatable.dart';

class Package extends Equatable {
  final String name;
  final String available;
  final String booked;
  final String from;
  final String to;
  final String exitTime;
  final String returnTime;
  final String category;
  final bool isActive;

  Package({
    required this.name,
    required this.available,
    required this.booked,
    required this.from,
    required this.to,
    required this.exitTime,
    required this.returnTime,
    required this.category,
    required this.isActive,
  });

  Package copyWith({
    String? name,
    String? available,
    String? booked,
    String? from,
    String? to,
    String? exitTime,
    String? returnTime,
    String? category,
    bool? isActive,
  }) {
    return Package(
      name: name ?? this.name,
      available: available ?? this.available,
      booked: booked ?? this.booked,
      from: from ?? this.from,
      to: to ?? this.to,
      exitTime: exitTime ?? this.exitTime,
      returnTime: returnTime ?? this.returnTime,
      category: category ?? this.category,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  List<Object?> get props => [
        name,
        available,
        booked,
        from,
        to,
        exitTime,
        returnTime,
        category,
        isActive,
      ];
}
