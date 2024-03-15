import 'package:bloc/bloc.dart';
import 'package:finanice_app/cons.dart';
import 'package:finanice_app/cubits/add_finance/add_finance_data_state.dart';
import 'package:finanice_app/models/finance_model.dart';
import 'package:hive_flutter/adapters.dart';

class AddFinanceDataCubit extends Cubit<AddFinanceDataState> {
  AddFinanceDataCubit() : super(AddFinanceDataInitial());
  addFinanceData(FinanceModel financeModel) async {
    emit(AddFinanceDataLoading());
    try {
      await Hive.box<FinanceModel>(kFinanceBox).add(financeModel);
      
      emit(AddFinanceDataSuccess());
    } catch (e) {
      emit(AddFinanceDataError(error: e.toString()));
    }
  }
}
