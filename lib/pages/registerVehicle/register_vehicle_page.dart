import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:joao_app/boxes.dart';
import 'package:joao_app/core/app_colors.dart';
import 'package:joao_app/model/vehicle.dart';
import 'package:joao_app/pages/registerVehicle/widgets/appBar/app_bar.dart';

class RegisterVehicle extends StatefulWidget {
  @override
  _RegisterVehicleState createState() => _RegisterVehicleState();
}

class _RegisterVehicleState extends State<RegisterVehicle> {
  final formKey = GlobalKey<FormState>();
  final placaController = TextEditingController();
  final marcaController = TextEditingController();
  final corController = TextEditingController();
  final vagaController = TextEditingController();

  @override
  void initState() {
    placaController.addListener(() => setState(() {}));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBarWidget(context, 'Registrar Veiculo'),
        body: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: 35),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Insira as informações do veiculo',
                  style: GoogleFonts.nunito(
                    color: AppColors.grey,
                    fontSize: 21,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 10),
              _textField("Placa", placaController, TextInputType.text),
              SizedBox(height: 10),
              _textField("Marca/Modelo", marcaController, TextInputType.text),
              SizedBox(height: 10),
              _textField("Cor", corController, TextInputType.text),
              SizedBox(height: 10),
              _textField("Vaga", vagaController, TextInputType.number),
              Spacer(),
              GestureDetector(
                onTap: () {
                  var placa = placaController.text;
                  var marca = marcaController.text;
                  var cor = corController.text;
                  var vaga = vagaController.text;

                  addVehicle(placa, marca, cor, vaga);
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(48, 12, 48, 12),
                  decoration: BoxDecoration(
                    color: AppColors.purple,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    'Registrar Entrada',
                    style: GoogleFonts.nunito(
                      color: AppColors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Container _textField(
      String label, TextEditingController controller, TextInputType type) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        controller: controller,
        keyboardType: type,
        decoration: InputDecoration(
          suffixIcon: controller.text.isEmpty
              ? Container(width: 0)
              : IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => controller.clear(),
                  color: AppColors.black,
                ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.black),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          labelText: label,
          labelStyle: new TextStyle(color: AppColors.purple),
        ),
      ),
    );
  }

  Future addVehicle(
    String placa,
    String marca,
    String cor,
    String vaga,
  ) async {
    final vehicle = Vehicle()
      ..placa = placa
      ..marca = marca
      ..createdVehicle = DateTime.now()
      ..cor = cor
      ..vaga = vaga;

    final box = Boxes.getVehicle();
    // box.clear();
    box.add(vehicle);
    print(box.length);
  }
}
