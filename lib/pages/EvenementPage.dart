import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:lepolo/Composants/EvenementCard.dart';
import 'package:lepolo/scoped/mains.dart';
import 'package:scoped_model/scoped_model.dart';

class EvenementPage extends StatefulWidget {
  final Mainscoped mains;
  const EvenementPage({Key? key, required this.mains}) : super(key: key);

  @override
  _EvenementPageState createState() => _EvenementPageState();
}

class _EvenementPageState extends State<EvenementPage> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<Mainscoped>(
      builder: (context, child, model) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "le polo'o".toUpperCase(),
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.height / 50,
              ),
            ),
          ),
          body: PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: model.getevenement.length,
            itemBuilder: (context, index) {
              var eve = model.getevenement[index];
              return VisibilityDetector(
                key: Key(index.toString()),
                onVisibilityChanged: (VisibilityInfo info) {},
                child: EvenementCard(
                  date: DateTime(2022),
                  isfavorite: true,
                  title: eve.name,
                  lieu: "lieu",
                  map: "map",
                  image: eve.multimedia,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
