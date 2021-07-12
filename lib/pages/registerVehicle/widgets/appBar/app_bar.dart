import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:joao_app/core/app_colors.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget(context, String title)
      : super(
            preferredSize: Size.fromHeight(75),
            child: SafeArea(
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 0, 65, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back)),
                    Text(
                      title,
                      style: GoogleFonts.nunito(
                        color: AppColors.black,
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ));
}
