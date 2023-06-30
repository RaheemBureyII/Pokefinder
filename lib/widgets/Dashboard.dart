// ignore_for_file: file_names, prefer_const_constructors, avoid_unnecessary_containers
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:getxprac/controllers/pokemoncontroller.dart';
import 'package:getxprac/widgets/PokeListWidget.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);

  TextEditingController pokename = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          color: Color.fromRGBO(147, 200, 208, 1),
          height: MediaQuery.of(context).size.height,
          //padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //Image(image: AssetImage("assets/pokelogo.png"),width: MediaQuery.of(context).size.width*0.1,),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: Column(
                    children: [
                      Row(
                        children: [
                            Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: TextField(
                              controller: pokename,
                              onSubmitted: (name) {
                                fetchposts(name.toLowerCase());
                                pokename.text = "";
                              },
                              cursorColor: Colors.white,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                suffixIcon: IconButton(onPressed: (){
                                        print("pressed");
                                }, icon: Icon(Icons.search)),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: "Enter Pokemon name here",
                                  hintStyle: TextStyle(color: Colors.black),
                                  border:  OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.black, width: 1.0),
                                      borderRadius: BorderRadius.circular(15.0)),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 1.0),
                                    borderRadius: BorderRadius.circular(15.0),
                                  )),
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 60),
                  decoration: BoxDecoration(
                      color: Colors.white,),
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: Obx(() => !pokemons.isEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, index) {
                            return InkWell(
                              onTap: () {
                                Get.toNamed("/pokemoninfo",
                                    arguments: {"index": index});
                              },
                              child: PokeListWidget(
                                index: index,
                              ),
                            );
                          },
                          itemCount: pokemons.length,
                        )
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.catching_pokemon,
                                size: 100,
                                color: Color.fromRGBO(147, 200, 208, 1),
                              ),
                              Text(
                                "I see you dont wanna be the very best",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Color.fromRGBO(147, 200, 208, 1),
                                ),
                              ),
                            ],
                          ),
                        )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
