// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userList.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InputFormAdapter extends TypeAdapter<InputForm> {
  @override
  final int typeId = 1;

  @override
  InputForm read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InputForm(
      id: fields[0] as int,
      name: fields[1] as String,
      memo: fields[2] as String,
      memoList: (fields[3] as List).cast<InputForm>(),
    );
  }

  @override
  void write(BinaryWriter writer, InputForm obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.memo)
      ..writeByte(3)
      ..write(obj.memoList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InputFormAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
