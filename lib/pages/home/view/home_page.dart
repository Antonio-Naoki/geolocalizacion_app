import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocalizacion_app/pages/global/app_colors.dart';
import 'package:geolocalizacion_app/pages/global/app_text_sytle.dart';
import 'package:geolocalizacion_app/pages/global/ratio_calculator.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? _imagen;
  final ImagePicker _picker = ImagePicker();

  Future<void> _seleccionarImagen() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imagen = File(pickedFile.path);
      });
    }
  }

  Future<void> _subirImagen() async {
    if (_imagen != null) {
      print('Subiendo imagen: ${_imagen!.path}');
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  Future<Position> determinePosition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("error");
      }
    }
    return await Geolocator.getCurrentPosition();
  }

  void getCurrentLocation() async {
    Position position = await determinePosition();
    print("Longitud: ${position.longitude}");
    print("Latitud: ${position.latitude}");
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final RatioCalculator ratioCalculator = RatioCalculator();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: ratioCalculator.calculateHeight(30)),
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Container(
                  child: const Text(
                    "Nuevo Registro",
                    style: AppTextStyle.text25W600InputTextStyle,
                  ),
                ),
                SizedBox(
                  height: ratioCalculator.calculateHeight(20),
                ),
                GestureDetector(
                  onTap: _seleccionarImagen,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    radius: 66,
                    backgroundImage: _imagen != null
                        ? FileImage(
                            _imagen!,
                          )
                        : null,
                    child: _imagen == null
                        ? Icon(
                            Icons.camera_alt_rounded,
                            size: 32,
                            color: Colors.grey[600],
                          )
                        : null,
                  ),
                ),
                SizedBox(
                  height: ratioCalculator.calculateHeight(10),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: ratioCalculator.calculateWidth(46),
                    right: ratioCalculator.calculateWidth(42),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Nombre",
                      labelStyle: AppTextStyle.text20W600InputTextStyle,
                      hintStyle: AppTextStyle.text16W600InputTextStyle,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: AppColors.inputLoginColor,
                          width: 2.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: AppColors.inputLoginColor,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: AppColors.inputLoginColor,
                          width: 2.0,
                        ),
                      ),
                      suffixIcon: Icon(
                        Icons.person,
                        color: AppColors.iconInputLoginColor,
                      ),
                    ),
                    style: AppTextStyle.text16W600InputTextStyle,
                  ),
                ),
                SizedBox(
                  height: ratioCalculator.calculateHeight(15),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: ratioCalculator.calculateWidth(46),
                    right: ratioCalculator.calculateWidth(42),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Apellido",
                      labelStyle: AppTextStyle.text20W600InputTextStyle,
                      hintStyle: AppTextStyle.text16W600InputTextStyle,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: AppColors.inputLoginColor,
                          width: 2.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: AppColors.inputLoginColor,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: AppColors.inputLoginColor,
                          width: 2.0,
                        ),
                      ),
                      suffixIcon: Icon(
                        Icons.person,
                        color: AppColors.iconInputLoginColor,
                      ),
                    ),
                    style: AppTextStyle.text16W600InputTextStyle,
                  ),
                ),
                SizedBox(
                  height: ratioCalculator.calculateHeight(15),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: ratioCalculator.calculateWidth(46),
                    right: ratioCalculator.calculateWidth(42),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Correo Electronico",
                      labelStyle: AppTextStyle.text20W600InputTextStyle,
                      hintStyle: AppTextStyle.text16W600InputTextStyle,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: AppColors.inputLoginColor,
                          width: 2.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: AppColors.inputLoginColor,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: AppColors.inputLoginColor,
                          width: 2.0,
                        ),
                      ),
                      suffixIcon: Icon(
                        Icons.email,
                        color: AppColors.iconInputLoginColor,
                      ),
                    ),
                    style: AppTextStyle.text16W600InputTextStyle,
                  ),
                ),
                SizedBox(
                  height: ratioCalculator.calculateHeight(15),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: ratioCalculator.calculateWidth(46),
                    right: ratioCalculator.calculateWidth(42),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Telefono",
                      labelStyle: AppTextStyle.text20W600InputTextStyle,
                      hintStyle: AppTextStyle.text16W600InputTextStyle,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: AppColors.inputLoginColor,
                          width: 2.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: AppColors.inputLoginColor,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: AppColors.inputLoginColor,
                          width: 2.0,
                        ),
                      ),
                      suffixIcon: Icon(
                        Icons.phone,
                        color: AppColors.iconInputLoginColor,
                      ),
                    ),
                    style: AppTextStyle.text16W600InputTextStyle,
                  ),
                ),
                SizedBox(
                  height: ratioCalculator.calculateHeight(15),
                ),
                Container(
                    height: ratioCalculator.calculateHeight(57),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: AppColors.inputLoginColor,
                        width: 2.0,
                      ),
                    ),
                    margin: EdgeInsets.only(
                      top: ratioCalculator.calculateHeight(61),
                      left: ratioCalculator.calculateWidth(43),
                      right: ratioCalculator.calculateWidth(47),
                    ),
                    child: const ButtonBar(
                      alignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Ingresar",
                          style: AppTextStyle.text25W600InputTextStyle,
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
