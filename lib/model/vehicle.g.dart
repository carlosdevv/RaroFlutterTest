// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VehicleAdapter extends TypeAdapter<Vehicle> {
  @override
  final int typeId = 0;

  @override
  Vehicle read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Vehicle();
  }

  @override
  void write(BinaryWriter writer, Vehicle obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.placa)
      ..writeByte(1)
      ..write(obj.marca)
      ..writeByte(2)
      ..write(obj.cor)
      ..writeByte(3)
      ..write(obj.createdVehicle)
      ..writeByte(4)
      ..write(obj.vaga);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VehicleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
