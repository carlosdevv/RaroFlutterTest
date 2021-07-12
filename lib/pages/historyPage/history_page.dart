import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:joao_app/boxes.dart';
import 'package:joao_app/core/app_colors.dart';
import 'package:joao_app/model/vehicle.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  void initState() {
    initializeDateFormatting('pt_BR', null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
          body: ValueListenableBuilder<Box<Vehicle>>(
              valueListenable: Boxes.getVehicle().listenable(),
              builder: (context, box, _) {
                final vehicles = box.values.toList().cast<Vehicle>();

                return _buildContent(context, vehicles);
              })),
    );
  }

  Column _buildContent(BuildContext context, List<Vehicle> vehicles) {
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: SafeArea(
            child: Text(
              'Historico',
              textAlign: TextAlign.center,
              style: GoogleFonts.nunito(
                color: AppColors.black,
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        Container(
          height: 549,
          child: ListView.builder(
              itemCount: vehicles.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                final vehicle = vehicles[index];

                return _buildVehicles(context, vehicle);
              }),
        ),
      ],
    );
  }

  Container _buildVehicles(BuildContext context, Vehicle vehicle) {
    final createdTime = vehicle.createdVehicle;

    var newFormat = new DateFormat.jms('pt_BR');
    String formatedTime = newFormat.format(createdTime);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 12),
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
          color: Color(0xff7366FF), borderRadius: BorderRadius.circular(6)),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              vehicle.placa,
              style: GoogleFonts.roboto(
                color: AppColors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              vehicle.marca,
              style: GoogleFonts.roboto(
                color: AppColors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              vehicle.cor,
              style: GoogleFonts.roboto(
                color: AppColors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              'Vaga: ${vehicle.vaga}',
              style: GoogleFonts.roboto(
                color: AppColors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Spacer(),
          Text(
            formatedTime,
            style: GoogleFonts.roboto(
              color: AppColors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
