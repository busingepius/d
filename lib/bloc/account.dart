import 'package:flutter_bloc/flutter_bloc.dart';
import "accountEvent.dart";

// using bloc
class AccountCubit extends Bloc<AccountCubitEvent, int> {
  AccountCubit() : super(10) {
    on((event, emit) {
      if (event is AccountIncrementEvent) {
        return emit(state + 10);
      }
      if (event is AccountDecrementEvent) {
        return emit(state - 10);
      }
    });
  }
}

// using cubit
// class CounterCubit extends Cubit<int> {
//   CounterCubit() : super(0);
//
//   void increment() => emit(state + 1);
//
//   void decrement() => emit(state - 1);
// }
