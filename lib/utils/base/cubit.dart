import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


abstract class _AppState extends Equatable {}

class CubitState extends _AppState {
  @override
  List<Object?> get props => [];
}

abstract class AppCubit<T> extends AppCubitHandler<T> {
  //var userData = Utils.fetchUserDetailsSync();

  AppCubit(T initialState) : super(initialState);

  void init();

  Future<bool> onBackPress();

  Future<void> onRefresh();

  void updateUserPref() {
    //userData = Utils.fetchUserDetailsSync();
  }
}

abstract class AppCubitHandler<T> extends Cubit<T> {
  //final AnalyticsManager analyticsManager = getIt.get<AnalyticsManager>();

  AppCubitHandler(T initialState) : super(initialState);
}
