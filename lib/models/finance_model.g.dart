// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finance_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FinanceModelAdapter extends TypeAdapter<FinanceModel> {
  @override
  final int typeId = 1;

  @override
  FinanceModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FinanceModel(
      balance: fields[2] as double,
      date: fields[1] as DateTime,
      transactionDetails: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FinanceModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.transactionDetails)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.balance);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FinanceModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
