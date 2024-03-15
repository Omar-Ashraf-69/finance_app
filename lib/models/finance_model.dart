import 'package:hive/hive.dart';

part 'finance_model.g.dart';

@HiveType(typeId: 1)

class FinanceModel extends HiveObject {
  @HiveField(0)
  String transactionDetails;
  @HiveField(1)
  DateTime date;
  @HiveField(2)
  double balance;

  FinanceModel({required this.balance,required this.date,required this.transactionDetails});

}
