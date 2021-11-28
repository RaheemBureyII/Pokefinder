// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxprac/widgets/Dashboard.dart';
import 'package:getxprac/widgets/PokemonInfo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Dashboard(),
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => Dashboard()),
        GetPage(name: "/pokemoninfo", page: () => PokemonInfo()),
      ],
    );
  }
}
