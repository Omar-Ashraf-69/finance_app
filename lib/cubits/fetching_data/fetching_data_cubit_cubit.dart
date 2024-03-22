import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:finanice_app/cons.dart';
import 'package:finanice_app/cubits/fetching_data/fetching_data_cubit_state.dart';
import 'package:finanice_app/models/finance_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class FetchingDataCubit extends Cubit<FetchingDataState> {
  FetchingDataCubit() : super(FetchingDataCubitInitial());
  List<FinanceModel> financeList = [];
  List<FinanceModel> todayFinanceList = [];
  List<FinanceModel> dateFinanceList = [];

  double totalBalance = 0;
  double todayBalance = 0;
  DateTime selectedDate = DateTime.now();
  void fetchingData() {
    emit(FetchingDataCubitLoading());

    try {
      financeList = Hive.box<FinanceModel>(kFinanceBox).values.toList();
      todayFinanceList = Hive.box<FinanceModel>(kFinanceBox)
          .values
          .toList()
          .where((element) =>
              DateFormat.yMMMEd().format(element.date) ==
              DateFormat.yMMMEd().format(DateTime.now()))
          .toList();
      financeList = financeList.reversed.toList();
      todayFinanceList = todayFinanceList.reversed.toList();
      fetchingDateData(selectedDate);
      totalBalance = 0;
      todayBalance = 0;
      for (var ele in financeList) {
        totalBalance += ele.balance;
        if (DateFormat.yMMMEd().format(ele.date) ==
            DateFormat.yMMMEd().format(DateTime.now())) {
          todayBalance += ele.balance;
        }
      }
      log(financeList.toString());
      emit(FetchingDataCubitSuccess());
    } catch (e) {
      emit(FetchingDataCubitError(error: e.toString()));
    }
  }

  void fetchingDateData(DateTime date) {
    emit(FetchingDataCubitLoading());

    try {
      dateFinanceList = Hive.box<FinanceModel>(kFinanceBox)
          .values
          .toList()
          .where((element) =>
              DateFormat.yMMMEd().format(element.date) ==
              DateFormat.yMMMEd().format(date))
          .toList();
      todayFinanceList = todayFinanceList.reversed.toList();
      dateFinanceList = dateFinanceList.reversed.toList();
      emit(FetchingDataCubitSuccess());
    } catch (e) {
      emit(FetchingDataCubitError(error: e.toString()));
    }
  }
}
