// ignore: file_names
// ignore_for_file: prefer_const_constructors_in_immutables, file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:getxprac/controllers/pokemoncontroller.dart';

class PokeListWidget extends StatelessWidget {
  final int index;
  PokeListWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 80,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(pokemons[index].imageurl),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    pokemons[index].name,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(147, 200, 208, 1),
                    ),
                  ),
                ],
              ),
              IconButton(
                  onPressed: () {
                    pokemons.removeAt(index);
                  },
                  icon: Icon(
                    Icons.delete_outline,
                    color: Color.fromRGBO(147, 200, 208, 1),
                  ))
            ],
          )),
    );
  }
}
