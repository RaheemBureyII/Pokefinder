// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:getxprac/models/pokemon.dart';
import 'package:http/http.dart';

List<Pokemon> pokemons = [
  Pokemon(
      name: "Bulbasaur",
      imageurl:
          "https://assets.pokemon.com/assets/cms2/img/pokedex/full/001.png",
      desc:
          "For some time after its birth, it grows by gaining nourishment from the seed on its back.")
].obs;
String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

void fetchposts(String name) async {
  final url = "https://pokeapi.co/api/v2/pokemon/${name}";
  int check = -1;
  try {
    Get.defaultDialog(
      title: "",
      titlePadding: EdgeInsets.all(0),
      backgroundColor: Color.fromRGBO(147, 200, 208, 1),
      content: SpinKitRing(color: Colors.white),
    );
    var response = await get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    var desc = await getmoredata(jsonData["species"]["url"]);
    var id = jsonData["id"];
    var pokename = capitalize(jsonData["name"]);
    check = pokemons.indexWhere((element) => element.name == pokename);
    print(check);

    if (id < 10) {
      id = "00${id}";
    } else if (id >= 10 && id < 100) {
      id = "0${id}";
    }
    var imageurl =
        "https://assets.pokemon.com/assets/cms2/img/pokedex/full/${id}.png";
    Get.back();
    if (check != -1) {
      Get.snackbar("Error", "You already added this pokemon");
    } else {
      showdialog(pokename, imageurl, desc);
    }
  } catch (e) {
    Get.back();
    Get.snackbar("Error", "Thats a creature but that aint no pokemon");
    print(e.toString());
  }
}

Future<String> getmoredata(url) async {
  try {
    var response = await get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    bool iseng = false;
    int x = 0;
    while (!iseng) {
      jsonData["flavor_text_entries"][x]["language"]["name"] == "en"
          ? iseng = true
          : x++;
    } //test if description is english

    var description = jsonData["flavor_text_entries"][x][
        "flavor_text"]; //sets description to english description with the index
    //print(description.toString().replaceAll("\n", " "));
    return description.toString().replaceAll("\n", " ");
  } catch (e) {
    return e.toString();
  }
}

void showdialog(name, imageurl, desc) {
  Get.defaultDialog(
    title: "",
    titlePadding: EdgeInsets.all(0),
    backgroundColor: Color.fromRGBO(147, 200, 208, 1),
    content: Container(
      color: Color.fromRGBO(147, 200, 208, 1),
      child: Column(
        children: [
          Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Hero(
            tag: "location-img-$name",
            child: Image(
              image: NetworkImage(
                imageurl,
              ),
              width: 100,
            ),
          ),
          MaterialButton(
            onPressed: () {
              pokemons.add(
                Pokemon(name: name, imageurl: imageurl, desc: desc.toString()),
              );
              Get.back();
              if (pokemons.length == 2) {
                Get.snackbar(
                  "New Pokemon Added",
                  "Tap It to see more",
                );
              }
            },
            child: Text(
              "Add",
              style: TextStyle(color: Color.fromRGBO(147, 200, 208, 1)),
            ),
            color: Colors.white,
          )
        ],
      ),
    ),
  );
}
