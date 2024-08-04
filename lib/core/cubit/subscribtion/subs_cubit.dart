import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lines_co_test/core/cubit/subscribtion/subs_states.dart';

class SubscriptionCubit extends Cubit<SubscriptionState> {
  SubscriptionCubit() : super(SubscriptionInitial());

  PageController pageController = PageController();
  int _currentIndex = 0;
  List<int> _selectedOptionIndices = [0, 0];

  void onTabSelected(int index) {
    _currentIndex = index;
    pageController.jumpToPage(index);
    emit(SubscriptionTabChanged(index, List.from(_selectedOptionIndices)));
  }

  void onPageChanged(int index) {
    _currentIndex = index;
    emit(SubscriptionTabChanged(index, List.from(_selectedOptionIndices)));
  }

  void onOptionSelected(int optionIndex) {
    _selectedOptionIndices[_currentIndex] = optionIndex;
    emit(SubscriptionOptionChanged(
        _currentIndex, List.from(_selectedOptionIndices)));
  }
}
