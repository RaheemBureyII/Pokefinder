import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:getxprac/models/pokemon.dart';
import 'package:http/http.dart';

List<Pokemon> pokemons = [
  Pokemon(
      name: "Bulbasaur",
      imageurl:
          "https://assets.pokemon.com/assets/cms2/img/pokedex/full/001.png",
      desc: "LOPSUM IPSUM BRRRRR")
].obs;
String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

void fetchposts(String name) async {
  final url = "https://pokeapi.co/api/v2/pokemon/${name}";
  try {
    var response = await get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    var desc = await getmoredata(jsonData["species"]["url"]);
    var id = jsonData["id"];
    var pokename = capitalize(jsonData["name"]);
    if (id < 10) {
      id = "00${id}";
    }
    pokemons.add(
      Pokemon(
          name: pokename,
          imageurl:
              "https://assets.pokemon.com/assets/cms2/img/pokedex/full/${id}.png",
          desc: desc.toString()),
    );
    if (pokemons.length == 2) {
      Get.snackbar(
        "New Pokemon Added",
        "Tap It to see more",
      );
    }
  } catch (e) {
    print(e.toString());
  }
}

Future<String> getmoredata(url) async {
  try {
    var response = await get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    var description = jsonData["flavor_text_entries"][0]["flavor_text"];

    return description;
  } catch (e) {
    return e.toString();
  }
}
