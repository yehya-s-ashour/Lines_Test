import 'package:equatable/equatable.dart';
import 'package:lines_co_test/core/models/package_model.dart';

abstract class PackageState extends Equatable {
  const PackageState();

  @override
  List<Object?> get props => [];
}

class PackageInitial extends PackageState {}

class PackageLoading extends PackageState {}

class PackageLoaded extends PackageState {
  final List<Package> packages;
  final bool isActive;
  final String? selectedCategory;

  const PackageLoaded({
    required this.packages,
    this.isActive = true,
    this.selectedCategory,
  });

  PackageLoaded copyWith({
    List<Package>? packages,
    bool? isActive,
    String? selectedCategory,
  }) {
    return PackageLoaded(
      packages: packages ?? this.packages,
      isActive: isActive ?? this.isActive,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }

  @override
  List<Object?> get props => [packages, isActive, selectedCategory];
}

class PackageError extends PackageState {
  final String error;

  const PackageError(this.error);

  @override
  List<Object?> get props => [error];
}
