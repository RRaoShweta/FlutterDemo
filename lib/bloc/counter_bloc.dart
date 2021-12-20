import 'package:bloc/bloc.dart';

class CounterBloc extends Cubit<int> {
  CounterBloc() : super(0);

  int counterState = 0;

  void increment() {
    counterState++;
    emit(counterState);
  }

  void decrement() {
    counterState--;
    emit(counterState);
  }
}
