import 'package:equatable/equatable.dart';

abstract class SubscriptionState extends Equatable {
  const SubscriptionState();

  @override
  List<Object?> get props => [];
}

class SubscriptionInitial extends SubscriptionState {}

class SubscriptionTabChanged extends SubscriptionState {
  final int currentIndex;
  final List<int> selectedOptionIndices;

  const SubscriptionTabChanged(this.currentIndex, this.selectedOptionIndices);

  @override
  List<Object?> get props => [currentIndex, selectedOptionIndices];
}

class SubscriptionOptionChanged extends SubscriptionState {
  final int currentIndex;
  final List<int> selectedOptionIndices;

  const SubscriptionOptionChanged(
      this.currentIndex, this.selectedOptionIndices);

  @override
  List<Object?> get props => [currentIndex, selectedOptionIndices];
}
