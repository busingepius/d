abstract class AccountCubitEvent {
  const AccountCubitEvent();
}

class AccountIncrementEvent extends AccountCubitEvent {
  const AccountIncrementEvent();
}

class AccountDecrementEvent extends AccountCubitEvent {
  const AccountDecrementEvent();
}
