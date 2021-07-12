import 'package:hive/hive.dart';

part 'vehicle.g.dart';

@HiveType(typeId: 0)
class Vehicle extends HiveObject {
  @HiveField(0)
  late String placa;

  @HiveField(1)
  late String marca;

  @HiveField(2)
  late String cor;

  @HiveField(3)
  late DateTime createdVehicle;

  @HiveField(4)
  late String vaga;
}
