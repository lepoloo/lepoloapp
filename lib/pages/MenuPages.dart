import "dart:async";
import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:lepolo/scoped/mains.dart";
import "package:loading_animation_widget/loading_animation_widget.dart";
import "package:scoped_model/scoped_model.dart";
import "../Models/Card.dart";

class MenuPages extends StatefulWidget {
  final String nomlieu;
  final CardModel menu;
  const MenuPages({Key? key, required this.menu, required this.nomlieu})
      : super(key: key);

  @override
  _MenuPagesState createState() => _MenuPagesState();
}

class _MenuPagesState extends State<MenuPages> {
  @override
  void initState() {
    cardselectionne = widget.menu;
    super.initState();
  }

  String evenselect = "";
  Color _backColor = Colors.white;
  bool backactive = false;
  bool visiblebanner = true;
  var cardselectionne;
  bool visible = true;
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScopedModelDescendant<Mainscoped>(
        builder: (context, child, model) {
          return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView(children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.width / 50,
                      horizontal: MediaQuery.of(context).size.width / 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            // Change container color to red
                            _backColor = Theme.of(context).primaryColor;
                            backactive = !backactive;
                          });

                          // Revert back to original color after 1 second
                          Timer(Duration(milliseconds: 300), () {
                            setState(() {
                              _backColor = Colors.white;
                            });
                            Navigator.pop(context);
                          });
                        },
                        child: AnimatedContainer(
                          duration: Duration(microseconds: 100),
                          height: MediaQuery.of(context).size.height / 25,
                          child: CircleAvatar(
                              backgroundColor: backactive
                                  ? _backColor.withOpacity(0.3)
                                  : Theme.of(context).primaryColor,
                              child: Center(
                                  child: Icon(
                                Icons.arrow_back,
                                size: MediaQuery.of(context).size.height / 50,
                                color: Colors.white,
                              ))),
                        ),
                      ),
                      Text(
                        widget.nomlieu,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width / 25),
                      )
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height *
                      0.3, // Hauteur du carrousel
                  child: PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        visible = false;
                        visiblebanner = false;

                        //  cardselectionne = model.getcard[value];
                      });
                      Timer(Duration(milliseconds: 300), () {
                        setState(() {
                          visible = true;

                          cardselectionne = model.getcard[value];
                          Timer(Duration(milliseconds: 400), () {
                            setState(() {
                              visiblebanner = true;
                            });
                          });
                        });
                      });
                    },
                    itemCount: model.getcard
                        .length, // Nombre total d'éléments dans le carrousel
                    controller:
                        PageController(viewportFraction: 0.6, initialPage: 1),
                    itemBuilder: (context, index) {
                      var card = model.getcard[index];
                      // Index de l'élément actuellement centré
                      final int centerIndex = 1;
                      // Facteur d'agrandissement pour l'élément central
                      final double scaleFactor = 1.5;
                      // Calcul de l'échelle en fonction de l'index de l'élément
                      final double scale =
                          index == centerIndex ? scaleFactor : 1.0;
                      return Center(
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 100),
                          height: MediaQuery.of(context).size.height *
                              (cardselectionne.id.toString() ==
                                      card.id.toString()
                                  ? 0.28
                                  : 0.25),
                          width:
                              MediaQuery.of(context).size.width * 0.7 * scale,
                          child: Card(
                            elevation: 6.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Container(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Center(
                                      child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.width * 0.2,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: CachedNetworkImageProvider(
                                                card.multimedia))),
                                  )),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: ListTile(
                                      title: Text(
                                        card.name,
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(
                                        card.description,
                                        style:
                                            TextStyle(color: Colors.grey[500]),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                !visible
                    ? Center(
                        child: Container(
                        margin: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height / 20),
                        child: LoadingAnimationWidget.fourRotatingDots(
                            color: Theme.of(context).primaryColor,
                            size: MediaQuery.of(context).size.height / 20),
                      ))
                    : Center(),
                AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    //  height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 20,
                        right: MediaQuery.of(context).size.width / 20,
                        top: !visible
                            ? MediaQuery.of(context).size.width / 2
                            : 0),
                    //  color: Colors.green,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(
                            MediaQuery.of(context).size.height / 100)),
                        border: Border.all(
                            color: Colors.grey,
                            width: MediaQuery.of(context).size.width / 300)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              cardselectionne.name.toString().toUpperCase(),
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize:
                                      MediaQuery.of(context).size.width / 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            !visible
                                ? Center()
                                : AnimatedContainer(
                                    curve: standardEasing,
                                    duration: Duration(seconds: 1),
                                    height: MediaQuery.of(context).size.height /
                                        (visiblebanner ? 18 : 25),
                                    width:
                                        MediaQuery.of(context).size.width / 10,
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(
                                                MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    40),
                                            bottomRight: Radius.circular(
                                                MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    40))),
                                    child: !visiblebanner
                                        ? Center()
                                        : Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                "Commander",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            150),
                                              ),
                                              Icon(
                                                Icons
                                                    .production_quantity_limits,
                                                size: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    70,
                                                color: Colors.white,
                                              )
                                            ],
                                          ),
                                  )
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: ListTile(
                            title: Text(
                              "Description",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width / 25),
                            ),
                            subtitle: Text(
                              cardselectionne.description,
                              style: TextStyle(
                                  color: Colors.grey[800],
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width / 40),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 2.2,
                          //  color: Colors.yellow,
                          child: ListTile(
                            title: Text(
                              "Nos produits",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width / 25),
                            ),
                            subtitle: Container(
                              height: MediaQuery.of(context).size.height / 2.45,
                              child: GridView.count(
                                  childAspectRatio: 1.3,
                                  crossAxisCount: 2,
                                  scrollDirection: Axis.vertical,
                                  mainAxisSpacing:
                                      MediaQuery.of(context).size.height / 100,
                                  crossAxisSpacing:
                                      MediaQuery.of(context).size.height / 100,
                                  padding: EdgeInsets.all(0),
                                  children: model.getevenement
                                      .map<Widget>((element) => GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                evenselect =
                                                    element.id.toString();
                                              });
                                              Timer(Duration(milliseconds: 300),
                                                  () {
                                                setState(() {
                                                  evenselect = "";
                                                });
                                              });
                                            },
                                            child: AnimatedContainer(
                                              duration:
                                                  Duration(milliseconds: 300),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  7,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4,
                                              padding: EdgeInsets.all(
                                                  MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      100),
                                              decoration: BoxDecoration(
                                                  border: evenselect.toString() ==
                                                          element.id.toString()
                                                      ? Border.all(
                                                          color:
                                                              Theme.of(context)
                                                                  .primaryColor,
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height /
                                                              350)
                                                      : null,
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                        element.multimedia,
                                                      ),
                                                      fit: BoxFit.cover),
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              100))),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    element.name.toString(),
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            (element.name
                                                                        .toString()
                                                                        .length <=
                                                                    25
                                                                ? 30
                                                                : 35)),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ))
                                      .toList()),
                            ),
                          ),
                        )
                      ],
                    ))
              ]));
        },
      ),
    );
  }
}
