import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:joao_app/core/app_colors.dart';
import 'package:joao_app/core/app_images.dart';
import 'package:joao_app/pages/outVehicle/out_vehicle_page.dart';
import 'package:joao_app/pages/registerVehicle/register_vehicle_page.dart';


class HomeBodyWidget extends StatelessWidget {
  const HomeBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50),
        SafeArea(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                'Olá\nSr. João!',
                style: GoogleFonts.nunito(
                  color: AppColors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 75),
        Center(
          child: Container(
            child: Text(
              'Selecione sua opção',
              style: GoogleFonts.nunito(
                color: AppColors.grey,
                fontSize: 21,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        SizedBox(height: 35),
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterVehicle()));
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                height: 135,
                width: 135,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.purple.withOpacity(0.25),
                      spreadRadius: 2,
                      blurRadius: 9,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(AppImages.truckIn),
                    Text(
                      'Entrada',
                      style: GoogleFonts.nunito(
                        color: AppColors.darkGreen,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OutVehicle()));
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                height: 135,
                width: 135,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.purple.withOpacity(0.25),
                      spreadRadius: 2,
                      blurRadius: 9,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(AppImages.truckOut),
                    Text(
                      'Saída',
                      style: GoogleFonts.nunito(
                        color: AppColors.darkRed,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
