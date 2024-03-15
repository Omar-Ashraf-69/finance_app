import 'package:bloc/bloc.dart';
import 'package:finanice_app/cons.dart';
import 'package:finanice_app/cubits/fetching_data/fetching_data_cubit_state.dart';
import 'package:finanice_app/models/finance_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FetchingDataCubit extends Cubit<FetchingDataCubitState> {
  FetchingDataCubit() : super(FetchingDataCubitInitial());
  List<FinanceModel> financeList = [];
  List<FinanceModel> fetchingData() {
    emit(FetchingDataCubitLoading());

    try {
      List temp = Hive.box<FinanceModel>(kFinanceBox).values.toList();
      for (var ele in temp) {
        financeList.add(ele);
      }
      emit(FetchingDataCubitSuccess());
      return financeList;
    } catch (e) {
      emit(FetchingDataCubitError(error: e.toString()));
      throw Exception(e.toString());
    }
  }
}
