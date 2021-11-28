// ignore_for_file: file_names, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxprac/controllers/pokemoncontroller.dart';
import 'package:getxprac/widgets/PokeListWidget.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);

  TextEditingController pokename = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Color.fromRGBO(147, 200, 208, 1),
        height: MediaQuery.of(context).size.height,
        //padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height * 0.2,
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: pokename,
                    onSubmitted: (name) {
                      fetchposts(name.toLowerCase());
                      pokename.text = "";
                    },
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                        hintText: "Enter Pokemon name here",
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 1.0),
                          borderRadius: BorderRadius.circular(15.0),
                        )),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 60),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(60))),
              height: MediaQuery.of(context).size.height * 0.8,
              child: Obx(
                () => ListView.builder(
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
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
