import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
/// using bloc
class CounterCubit extends Bloc<CounterCubit, int>{
  CounterCubit():super(0);

  void increment()=>emit(state + 1);
  void decrement()=>emit(state - 1);
}
