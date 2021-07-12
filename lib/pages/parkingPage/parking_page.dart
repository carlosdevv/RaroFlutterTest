import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:joao_app/core/app_colors.dart';
import 'package:joao_app/core/app_images.dart';
import 'package:joao_app/model/vehicle.dart';

import '../../boxes.dart';

class ParkingPage extends StatefulWidget {
  @override
  _ParkingPageState createState() => _ParkingPageState();
}

class _ParkingPageState extends State<ParkingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder<Box<Vehicle>>(
            valueListenable: Boxes.getVehicle().listenable(),
            builder: (context, box, _) {
              final vehicles = box.values.toList().cast<Vehicle>();

              return _buildContent(vehicles);
            }));
  }

  Column _buildContent(List<Vehicle> vehicles) {
    return Column(
      children: [
        SafeArea(
          child: Text(
            'Estacionamento',
            style: GoogleFonts.nunito(
              color: AppColors.black,
              fontSize: 32,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(height: 3),
        Text(
          'Disponibilidade: ${vehicles.length}/8',
          style: GoogleFonts.roboto(
            color: AppColors.purple,
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
        Container(
          height: 580,
          child: ListView.builder(
              itemCount: vehicles.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                final vehicle = vehicles[index];

                return buildVehicle(context, vehicle);
              }),
        ),
      ],
    );
  }

  Container buildVehicle(BuildContext context, Vehicle vehicle) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Color(0xffe1e1e6),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: [
          Image.asset(AppImages.truckP),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                vehicle.placa,
                style: GoogleFonts.montserrat(
                  color: AppColors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                vehicle.marca,
                style: GoogleFonts.montserrat(
                  color: AppColors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                vehicle.cor,
                style: GoogleFonts.montserrat(
                  color: AppColors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'Vaga: ${vehicle.vaga}',
                style: GoogleFonts.montserrat(
                  color: AppColors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
