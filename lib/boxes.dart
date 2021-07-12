import 'package:hive/hive.dart';
import 'package:joao_app/model/vehicle.dart';

class Boxes {
  static Box<Vehicle> getVehicle() => Hive.box<Vehicle>('vehicles');
}
