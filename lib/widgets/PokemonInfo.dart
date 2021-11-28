// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxprac/controllers/pokemoncontroller.dart';

class PokemonInfo extends StatelessWidget {
  PokemonInfo({Key? key}) : super(key: key);
  var arg = Get.arguments;

  @override
  Widget build(BuildContext context) {
    int index = arg["index"];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(147, 200, 208, 1),
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        color: Color.fromRGBO(147, 200, 208, 1),
        child: Column(
          children: [
            Text(
              pokemons[index].name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image(image: NetworkImage(pokemons[index].imageurl)),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                pokemons[index].desc,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
