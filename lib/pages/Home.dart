import "dart:async";
import "dart:math";
//import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_carousel_widget/flutter_carousel_widget.dart";
import "package:lepolo/Composants/CategorieElement.dart";
import "package:lepolo/Composants/Lieuxcomposant.dart";
import "package:flutter_carousel_widget/flutter_carousel_widget.dart";
import 'package:lepolo/pages/CategoriePage.dart';
import 'package:lepolo/pages/CommPage.dart';
import "package:lepolo/pages/EvenementPage.dart";
import "package:lepolo/scoped/mains.dart";
import "package:scoped_model/scoped_model.dart";

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //  widget.mains.fetchlieux();
  }

  String categorieselectionnee = "1";
  bool widthsearch = false;
  Widget build(BuildContext context) {
    return ScopedModelDescendant<Mainscoped>(
      builder: (context, child, model) {
        return DefaultTabController(
            length: 2,
            child: Scaffold(
                appBar: AppBar(
                  bottom: TabBar(tabs: [
                    Tab(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.list_alt,
                              color: Theme.of(context).primaryColor,
                            ),
                            Text(
                              "Lists",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor),
                            )
                          ],
                        ),
                      ),
                    ),
                    Tab(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.group,
                              color: Theme.of(context).primaryColor,
                            ),
                            Text(
                              "Communautés",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor),
                            )
                          ],
                        ),
                      ),
                    ),
                  ]),
                  title: widthsearch
                      ? Center()
                      : Text(
                          "le polo'o".toUpperCase(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.height / 50),
                        ),
                  actions: [
                    Container(
                        // width: widthsearch,
                        margin: EdgeInsets.only(
                            right: MediaQuery.of(context).size.height / 100),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              widthsearch = true;
                            });
                          },
                          child: Row(
                            children: [
                              AnimatedContainer(
                                  width: widthsearch
                                      ? MediaQuery.of(context).size.width / 1.2
                                      : MediaQuery.of(context).size.width / 10,
                                  padding: EdgeInsets.symmetric(
                                      vertical: widthsearch
                                          ? 0
                                          : MediaQuery.of(context).size.height /
                                              100,
                                      horizontal:
                                          MediaQuery.of(context).size.height /
                                              100),
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              (widthsearch ? 50 : 1)))),
                                  duration: Duration(milliseconds: 900),
                                  child: widthsearch
                                      ? Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  right: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      100),
                                              child: Icon(
                                                Icons.search,
                                                color: Colors.white,
                                                size: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    40,
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  2.1 /
                                                  3,
                                              child: TextFormField(
                                                autofocus: true,
                                                enableSuggestions: false,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            45),
                                                showCursor: true,
                                                maxLines: 1,
                                                decoration: InputDecoration(
                                                    hintStyle: TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: Colors.white,
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            55),
                                                    hintText:
                                                        "Rechercher un lieu ou un evenement",
                                                    border: InputBorder.none),
                                              ),
                                            )
                                          ],
                                        )
                                      : Icon(
                                          Icons.search,
                                          color: Colors.white,
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              40,
                                        )),
                              widthsearch
                                  ? GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          widthsearch = false;
                                        });
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                80),
                                        width:
                                            MediaQuery.of(context).size.height /
                                                22,
                                        child: CircleAvatar(
                                          child: Icon(Icons.close),
                                        ),
                                      ),
                                    )
                                  : GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                80),
                                        width:
                                            MediaQuery.of(context).size.height /
                                                22,
                                        child: CircleAvatar(
                                          child: Icon(Icons.filter_list),
                                        ),
                                      ),
                                    )
                            ],
                          ),
                        ))
                  ],
                ),
                body: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.height / 500),
                  child: TabBarView(children: [
                    ListView(
                      children: [
                        Container(
                          //  color: Colors.green,
                          child: const ListTile(
                            title: Text(
                              "Catégories",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 8,
                          // color: Colors.green,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.height / 200),
                            child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: model.categories
                                    .map((e) => GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              categorieselectionnee =
                                                  e.id.toString();
                                            });
                                            Timer(Duration(milliseconds: 400),
                                                () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                builder: (context) {
                                                  return EvenementPage(
                                                      mains: model);
                                                },
                                              ));
                                            });
                                          },
                                          child: AnimatedContainer(
                                            duration:
                                                Duration(milliseconds: 500),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                5.5,
                                            margin: EdgeInsets.only(
                                                left: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    100),
                                            decoration: BoxDecoration(
                                                color: categorieselectionnee ==
                                                        e.id.toString()
                                                    ? Theme.of(context)
                                                        .primaryColor
                                                    : Colors.white,
                                                border: Border.all(
                                                    color: categorieselectionnee ==
                                                            e.id.toString()
                                                        ? Theme.of(context)
                                                            .primaryColor
                                                        : Colors.black12,
                                                    width: MediaQuery.of(context)
                                                            .size
                                                            .height /
                                                        500),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(
                                                        MediaQuery.of(context).size.height / 55))),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Icon(
                                                  Icons.category,
                                                  color: Theme.of(context)
                                                      .primaryColorLight,
                                                ),
                                                Text(
                                                  e.name.toString(),
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color:
                                                          categorieselectionnee ==
                                                                  e.id
                                                                      .toString()
                                                              ? Colors.white
                                                              : Colors.black,
                                                      fontWeight:
                                                          categorieselectionnee ==
                                                                  e.id
                                                                      .toString()
                                                              ? FontWeight.bold
                                                              : FontWeight
                                                                  .normal,
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              75),
                                                )
                                              ],
                                            ),
                                          ),
                                        ))
                                    .toList()),
                          ),
                        ),
                        const ListTile(
                          title: Text(
                            "A la une",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                            height: MediaQuery.of(context).size.height / 5,
                            width: MediaQuery.of(context).size.width,
                            child: FlutterCarousel(
                                items: model.getevenement
                                    .take(10)
                                    .map<Widget>(
                                      (evn) => Container(
                                        height:
                                            MediaQuery.of(context).size.height,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        padding: EdgeInsets.all(
                                            MediaQuery.of(context).size.height /
                                                150),
                                        decoration: BoxDecoration(
                                            //  color: Colors.grey

                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                    evn.multimedia))),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              evn.name,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          35),
                                            ),
                                            Text(
                                              evn.description
                                                  .toString()
                                                  .substring(0, 25),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          50),
                                            ),
                                            ElevatedButton(
                                                onPressed: () {},
                                                child: Text("Learn more"))
                                          ],
                                        ),
                                      ),
                                    )
                                    .toList(),
                                options: CarouselOptions(
                                    slideIndicator: CircularSlideIndicator(
                                        alignment: Alignment.bottomRight),
                                    viewportFraction: 1,
                                    enlargeCenterPage: true,
                                    autoPlay: true,
                                    autoPlayInterval: Duration(seconds: 3)))),
                        const ListTile(
                          title: Text(
                            "Nos récommandations",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                            height: MediaQuery.of(context).size.height / 3.5,
                            width: MediaQuery.of(context).size.width,
                            child: FlutterCarousel(
                                items: model.getlieux
                                    .map<Widget>((e) => Lieuxcomposant(e))
                                    .toList(),
                                options: CarouselOptions(
                                  showIndicator: false,
                                  enlargeCenterPage: false,
                                  autoPlay: false,
                                ))),
                        const ListTile(
                          title: Text(
                            "Plus visites",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                            height: MediaQuery.of(context).size.height / 3.5,
                            width: MediaQuery.of(context).size.width,
                            child: FlutterCarousel(
                                items: model.getlieux
                                    .map<Widget>((e) => Lieuxcomposant(e))
                                    .toList(),
                                options: CarouselOptions(
                                  showIndicator: false,
                                  enlargeCenterPage: false,
                                  autoPlay: false,
                                ))),
                      ],
                    ),

                    // deuxieme partie
                    CommPage()
                  ]),
                )));
      },
    );
  }
}
