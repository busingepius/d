import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
/// usisng bloc
class CounterCubit extends Bloc<CounterCubit, int>{
  CounterCubit():super(0);

  void increment()=>emit(state + 1);
  void decrement()=>emit(state - 1);
}
/// using cubit
// class CounterCubit extends Cubit<int> {
//   CounterCubit() : super(0);
//
//   void increment() => emit(state + 1);
//
//   void decrement() => emit(state - 1);
// }