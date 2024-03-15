abstract class AddFinanceDataState {}

final class AddFinanceDataInitial extends AddFinanceDataState {}

final class AddFinanceDataLoading extends AddFinanceDataState {}

final class AddFinanceDataSuccess extends AddFinanceDataState {}

final class AddFinanceDataError extends AddFinanceDataState {
  final String error;

  AddFinanceDataError({required this.error});
}
