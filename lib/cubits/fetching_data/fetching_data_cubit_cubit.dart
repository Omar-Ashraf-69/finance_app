import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:finanice_app/cons.dart';
import 'package:finanice_app/cubits/fetching_data/fetching_data_cubit_state.dart';
import 'package:finanice_app/models/finance_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FetchingDataCubit extends Cubit<FetchingDataCubitState> {
  FetchingDataCubit() : super(FetchingDataCubitInitial());
  List<FinanceModel> financeList = [];
  double totalBalance = 0;
  fetchingData() {
    emit(FetchingDataCubitLoading());

    try {
      financeList = Hive.box<FinanceModel>(kFinanceBox).values.toList();
      financeList = financeList.reversed.toList();
      totalBalance = 0;
      for (var ele in financeList) {
        totalBalance += ele.balance;
      }
      log(financeList.toString());
      emit(FetchingDataCubitSuccess());
    } catch (e) {
      log(e.toString());

      emit(FetchingDataCubitError(error: e.toString()));
    }
  }
}
