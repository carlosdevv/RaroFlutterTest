import 'package:joao_app/core/core.dart';
import 'package:joao_app/pages/homePage/home_page.dart';

import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "JoaoApp",
      locale: Locale('pt', 'BR'),
      home: HomePage(),
      theme: ThemeData(
        primaryColor: AppColors.grey,
      ),
    );
  }
}
