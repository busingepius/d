// import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
/// usisng bloc
class AccountCubit extends Bloc<AccountCubit, int>{
  AccountCubit():super(10);

  void aIncrement()=>emit(state + 10);
  void aDecrement()=>emit(state - 10);
}
/// using cubit
// class CounterCubit extends Cubit<int> {
//   CounterCubit() : super(0);
//
//   void increment() => emit(state + 1);
//
//   void decrement() => emit(state - 1);
// }