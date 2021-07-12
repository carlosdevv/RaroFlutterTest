import 'dart:io';

import 'package:hive/hive.dart';
import 'package:joao_app/model/vehicle.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class AppData {
  static late Box vehicleBox;

  static Future init() async {
    final Directory appDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();

    Hive
      ..init(appDocumentDir.path)
      ..registerAdapter(VehicleAdapter());

    await Hive.openBox<Vehicle>('vehicleBox');
  }
}
