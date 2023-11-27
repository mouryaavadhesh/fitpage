import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class _AppState extends Equatable {}

class CubitState extends _AppState {
  @override
  List<Object?> get props => [];
}

abstract class AppCubit<T> extends AppCubitHandler<T> {
  AppCubit(T initialState) : super(initialState);

  void init();

  Future<bool> onBackPress();

  Future<void> onRefresh();
}

abstract class AppCubitHandler<T> extends Cubit<T> {
  AppCubitHandler(T initialState) : super(initialState);
}
