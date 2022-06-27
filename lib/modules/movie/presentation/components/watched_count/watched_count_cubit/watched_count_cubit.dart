import 'package:bloc/bloc.dart';

class WatchedCountCubit extends Cubit<int> {
  WatchedCountCubit() : super(0);

  setInitialValue(int value) {
    emit(value);
  }

  void increment() {
    emit(state + 1);
  }

  void decrement() {
    emit(state - 1);
  }
}
