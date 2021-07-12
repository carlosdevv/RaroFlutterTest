import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:joao_app/core/app_widget.dart';
import 'package:joao_app/model/vehicle.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await AppData.init();

  await Hive.initFlutter();

  Hive.registerAdapter(VehicleAdapter());
  await Hive.openBox<Vehicle>('vehicles');
  

  runApp(AppWidget());
}
