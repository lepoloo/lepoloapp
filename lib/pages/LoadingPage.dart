// ignore_for_file: use_build_context_synchronously

import "dart:async";
import "package:flutter/material.dart";
import 'package:lepolo/pages/Home.dart';
import "package:lepolo/pages/HomeManager.dart";
import "package:lepolo/pages/LoginPage.dart";
import 'package:lepolo/pages/SplashPage.dart';
import "package:lepolo/scoped/mains.dart";
import "package:shared_preferences/shared_preferences.dart";

class LoadingPage extends StatefulWidget {
  final Mainscoped mains;
  LoadingPage({Key? key, required this.mains});
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.mains.verifyconnect();
    Timer(const Duration(seconds: 3), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      bool? descriptionapp = prefs.getBool("description");
      if (descriptionapp == null) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return SplashPage();
        }));
      } else {
        widget.mains.fetchlieux();
        widget.mains.fetchcard();
        widget.mains.fetchevenement();
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return HomeManager(mains: widget.mains);
        }));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            //ajout de l'image
            ),
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height / 5,
            width: MediaQuery.of(context).size.height / 5,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
              "assets/images/logo.png",
            ))),
          ),
        ),
      ),
    );
  }
}
