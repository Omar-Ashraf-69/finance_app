abstract class FetchingDataState {}

final class FetchingDataCubitInitial extends FetchingDataState {}

final class FetchingDataCubitLoading extends FetchingDataState {}

final class FetchingDataCubitSuccess extends FetchingDataState {}

final class FetchingDataCubitError extends FetchingDataState {
  final String error;

  FetchingDataCubitError({required this.error});
}
