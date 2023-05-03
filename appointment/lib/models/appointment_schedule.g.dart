// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_schedule.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppointmentScheduleAdapter extends TypeAdapter<AppointmentSchedule> {
  @override
  final int typeId = 0;

  @override
  AppointmentSchedule read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppointmentSchedule(
      name: fields[0] as String,
      dateTime: fields[6] as DateTime,
      age: fields[2] as String,
      type: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AppointmentSchedule obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(6)
      ..write(obj.dateTime)
      ..writeByte(2)
      ..write(obj.age)
      ..writeByte(4)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppointmentScheduleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
