import 'package:flutter/material.dart';
import 'package:lepolo/pages/Home.dart';
import 'package:lepolo/pages/LoadingPage.dart';
import 'package:lepolo/scoped/mains.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  Mainscoped mains = Mainscoped();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
        model: mains,
        child: MaterialApp(
            title: "le polo'o",
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              textTheme: const TextTheme(
                  bodyLarge: TextStyle(
                    fontFamily: "Roboto",
                  ),
                  bodyMedium: TextStyle(
                    fontFamily: "Roboto",
                  )),
              primaryColorLight: Color.fromARGB(255, 241, 131, 75),
              colorScheme: ColorScheme.light(primary: Color(0xFFec5a13)),
              useMaterial3: true,
            ),
            home: Directionality(
                textDirection: TextDirection.ltr,
                child: LoadingPage(
                  mains: mains,
                ))));
  }
}
