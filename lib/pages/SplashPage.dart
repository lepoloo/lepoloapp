import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import '../Composants/PageComposant.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  @override
  _SplashPageState createState() => _SplashPageState();
}

List<Widget> pages = [
  PageComposant(
      "Réserver pour un evenement",
      "Grace a notre application vous pouvez réserver pour un evenement directement via l'application.",
      false,
      "assets/images/party-flatline.svg"),
  PageComposant(
      "Localiser les zones les plus enflammees",
      "Localisez tous les zones ayant une ambiance et rejoignez l'aventure",
      false,
      "assets/images/party-flatline-90d1e.svg"),
  PageComposant(
      "Annonce et promotion en live",
      "ne manquez aucune occasion ni promotion sur un evenement ou autre.",
      true,
      "assets/images/party-monochromatic-ea21f.svg"),
];

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ExpandableCarousel.builder(
      itemCount: pages.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          pages[itemIndex],
      options: CarouselOptions(viewportFraction: 1),
    ));
  }
}
