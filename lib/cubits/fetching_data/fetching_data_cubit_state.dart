abstract class FetchingDataCubitState {}

final class FetchingDataCubitInitial extends FetchingDataCubitState {}

final class FetchingDataCubitLoading extends FetchingDataCubitState {}

final class FetchingDataCubitSuccess extends FetchingDataCubitState {}

final class FetchingDataCubitError extends FetchingDataCubitState {
  final String error;

  FetchingDataCubitError({required this.error});
}
