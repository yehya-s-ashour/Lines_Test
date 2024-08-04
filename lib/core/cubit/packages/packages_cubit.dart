import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lines_co_test/core/cubit/packages/packages_states.dart';
import 'package:lines_co_test/core/models/package_model.dart';

class PackageCubit extends Cubit<PackageState> {
  PackageCubit() : super(PackageInitial());

  void loadPackages() async {
    try {
      emit(PackageLoading());
      emit(PackageLoaded(packages: _dummyPackages));
    } catch (e) {
      emit(PackageError('Failed to load packages'));
    }
  }

  void toggleActiveStatus(int index) {
    if (state is PackageLoaded) {
      final currentState = state as PackageLoaded;
      final updatedPackages = List<Package>.from(currentState.packages);
      final package = updatedPackages[index];
      updatedPackages[index] = package.copyWith(isActive: !package.isActive);
      emit(currentState.copyWith(packages: updatedPackages));
    }
  }

  static final List<Package> _dummyPackages = [
    Package(
      name: 'Askar School',
      available: '30 Passengers',
      booked: '20 Passengers',
      from: '2972 Westheimer Rd. Santa Ana, Illinois 85486',
      to: '2972 Westheimer Rd. Santa Ana, Illinois',
      exitTime: '9.00 AM',
      returnTime: '2.00 PM',
      category: 'School',
      isActive: true,
    ),
    Package(
      name: 'Downtown Business Shuttle',
      available: '50 Passengers',
      booked: '40 Passengers',
      from: '123 Main St, City Center, Illinois 60606',
      to: '500 Business Ave, City Center, Illinois 60606',
      exitTime: '8.00 AM',
      returnTime: '6.00 PM',
      category: 'Business',
      isActive: false,
    ),
    Package(
      name: 'City Tour',
      available: '45 Passengers',
      booked: '30 Passengers',
      from: '2000 Avenue of the Stars, Los Angeles, CA 90067',
      to: 'Hollywood Blvd, Los Angeles, CA 90028',
      exitTime: '10.00 AM',
      returnTime: '4.00 PM',
      category: 'Tourism',
      isActive: true,
    ),
    Package(
      name: 'Airport Transfer',
      available: '60 Passengers',
      booked: '55 Passengers',
      from: 'LAX International Airport, Los Angeles, CA 90045',
      to: 'Downtown Los Angeles, CA 90012',
      exitTime: '12.00 PM',
      returnTime: '12.00 PM',
      category: 'Transfer',
      isActive: true,
    ),
    Package(
      name: 'Concert Shuttle',
      available: '40 Passengers',
      booked: '35 Passengers',
      from: '123 Stadium Rd, Anaheim, CA 92806',
      to: '456 Concert Blvd, Los Angeles, CA 90015',
      exitTime: '5.00 PM',
      returnTime: '11.00 PM',
      category: 'Entertainment',
      isActive: false,
    ),
    Package(
      name: 'Weekend Getaway',
      available: '20 Passengers',
      booked: '10 Passengers',
      from: '456 Suburb Lane, Riverside, CA 92501',
      to: 'Big Bear Lake, CA 92315',
      exitTime: '7.00 AM',
      returnTime: '8.00 PM',
      category: 'Leisure',
      isActive: true,
    ),
  ];
}
