
import 'package:mvvm_project/features/domain/model/model.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeEmptyState extends HomeState {}

class HomeSuccessState extends HomeState {
  late ModelCharacters haracters;

  HomeSuccessState(this.haracters);
}

class HomeFailureState extends HomeState {
  late String message;

  HomeFailureState({
    required this.message,
  });
}
