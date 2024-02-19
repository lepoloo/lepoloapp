import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import 'package:lepolo/pages/Home.dart';
import "package:lepolo/pages/HomeManager.dart";
import "package:lepolo/scoped/mains.dart";
import "package:scoped_model/scoped_model.dart";
import "package:shared_preferences/shared_preferences.dart";

// ignore: must_be_immutable
class PageComposant extends StatelessWidget {
  String titre;
  String description;
  bool dernier;
  String image;
  PageComposant(this.titre, this.description, this.dernier, this.image,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<Mainscoped>(
      builder: (context, child, model) {
        return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Container(
                            height: MediaQuery.of(context).size.height / 2,
                            width: MediaQuery.of(context).size.height / 2,
                            //    color: Theme.of(context).primaryColorDark,
                            child: SvgPicture.asset(
                              image,
                            )),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height / 30),
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              titre,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.height / 30),
                            ),
                          ),
                          Center(
                            child: Text(
                              description,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize:
                                      MediaQuery.of(context).size.height / 45),
                            ),
                          ),
                        ],
                      ),
                    ),
                    dernier
                        ? ElevatedButton(
                            style: ButtonStyle(
                                padding: MaterialStatePropertyAll(
                                    EdgeInsets.all(
                                        MediaQuery.of(context).size.width /
                                            30)),
                                backgroundColor: MaterialStatePropertyAll(
                                    Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.1))),
                            onPressed: () async {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setBool("description", true);
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return HomeManager(mains: model);
                              }));
                            },
                            child: Text(
                              "Commencer",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height / 40,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ))
                        : const Center()
                  ],
                ),
                Positioned(
                    top: 0,
                    right: 0,
                    height: MediaQuery.of(context).size.height / 8,
                    width: MediaQuery.of(context).size.height / 8,
                    child: IconButton(
                        onPressed: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setBool("description", true);
                          model.fetchlieux();
                          model.fetchevenement();
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return HomeManager(mains: model);
                          }));
                        },
                        icon: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: MediaQuery.of(context).size.height / 30,
                        ))),
              ],
            ));
      },
    );
  }
}
