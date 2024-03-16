//import "package:cached_network_image/cached_network_image.dart";
import "dart:async";

import "package:cached_network_image/cached_network_image.dart";
import "package:card_swiper/card_swiper.dart";
import "package:flutter/material.dart";
import "package:flutter_image_stack/flutter_image_stack.dart";
import "package:lepolo/pages/MenuPages.dart";
import "package:lepolo/scoped/mains.dart";
import "package:scoped_model/scoped_model.dart";

class DetailLieux extends StatefulWidget {
  var data;
  DetailLieux(this.data);

  @override
  _DetailLieuxState createState() => _DetailLieuxState();
}

class _DetailLieuxState extends State<DetailLieux> {
  @override
  void initState() {
    // TODO: implement initState
  }
  bool alldrag = false;
  String evenselect = "";
  Color _likeColor = Colors.white;
  Color _signalColor = Colors.white;
  bool favoriteactive = false;
  bool signalactive = false;
  Color _backColor = Colors.white;
  bool backactive = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ScopedModelDescendant<Mainscoped>(
      builder: (context, child, model) {
        return Stack(
          children: [
            SizedBox.expand(
              child: Container(
                child: Stack(children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 1.8,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height / 15),
                    decoration: BoxDecoration(
                        //      color: Colors.green,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(widget.data['image']))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        alldrag
                            ? Center()
                            : AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                margin: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.height /
                                        100),
                                height: MediaQuery.of(context).size.height / 20,
                                width: MediaQuery.of(context).size.width / 1.5,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.3),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            MediaQuery.of(context).size.height /
                                                100))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(
                                      Icons.calendar_month,
                                      color:
                                          Theme.of(context).primaryColorLight,
                                      size: MediaQuery.of(context).size.height /
                                          40,
                                    ),
                                    Text(
                                      "De Lundi a Dimanche",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              70),
                                    ),
                                    Icon(
                                      Icons.timer,
                                      color:
                                          Theme.of(context).primaryColorLight,
                                      size: MediaQuery.of(context).size.height /
                                          40,
                                    ),
                                    Text(
                                      "08H - 17H",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              55),
                                    )
                                  ],
                                ))
                      ],
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 12,
                    left: MediaQuery.of(context).size.height / 100,
                    child: InkWell(
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
                            backgroundColor: _backColor.withOpacity(0.3),
                            child: Center(
                                child: Icon(
                              Icons.arrow_back,
                              size: MediaQuery.of(context).size.height / 50,
                              color: Colors.white,
                            ))),
                      ),
                    ),
                  ),
                  Positioned(
                      right: MediaQuery.of(context).size.height / 100,
                      top: MediaQuery.of(context).size.height / 12,
                      height: MediaQuery.of(context).size.height / 10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                // Change container color to red
                                _likeColor = Theme.of(context).primaryColor;
                                favoriteactive = !favoriteactive;
                              });

                              // Revert back to original color after 1 second
                              Timer(Duration(milliseconds: 300), () {
                                setState(() {
                                  _likeColor = Colors.white;
                                });
                              });
                            },
                            child: AnimatedContainer(
                              duration: Duration(seconds: 1),
                              height: MediaQuery.of(context).size.height / 25,
                              child: CircleAvatar(
                                  backgroundColor: _likeColor.withOpacity(0.3),
                                  child: Center(
                                      child: Icon(
                                    favoriteactive
                                        ? Icons.favorite
                                        : Icons.favorite_outline,
                                    size:
                                        MediaQuery.of(context).size.height / 60,
                                    color: Colors.white,
                                  ))),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                // Change container color to red
                                _signalColor = Theme.of(context).primaryColor;
                                signalactive = !signalactive;
                              });

                              // Revert back to original color after 1 second
                              Timer(Duration(milliseconds: 300), () {
                                setState(() {
                                  _signalColor = Colors.white;
                                });
                              });
                            },
                            child: AnimatedContainer(
                              duration: Duration(seconds: 1),
                              height: MediaQuery.of(context).size.height / 25,
                              child: CircleAvatar(
                                  backgroundColor:
                                      _signalColor.withOpacity(0.3),
                                  child: Center(
                                      child: Icon(
                                    Icons.flag,
                                    size:
                                        MediaQuery.of(context).size.height / 60,
                                    color: Colors.white,
                                  ))),
                            ),
                          ),
                        ],
                      )),
                ]),
              ),
            ),
            NotificationListener<DraggableScrollableNotification>(
                onNotification: (notification) {
                  if (notification.extent > 0.5) {
                    setState(() {
                      alldrag = true;
                    });
                  } else {
                    setState(() {
                      alldrag = false;
                    });
                    return true;
                  }
                  return true; // retourne false pour continuer à propager la notification
                },
                child: DraggableScrollableSheet(
                    initialChildSize: 0.5,
                    minChildSize: 0.5,
                    maxChildSize: 0.7,
                    builder: (context, scrollController) {
                      return Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(
                                    MediaQuery.of(context).size.height / 30),
                                topRight: Radius.circular(
                                    MediaQuery.of(context).size.height / 30))),
                        child: Container(
                            child: ListView(
                          padding: EdgeInsets.all(0),
                          controller: scrollController,
                          //  itemCount: 25,
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    AssetImage(widget.data["image"]),
                              ),
                              title: Text(
                                widget.data["title"].toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            45),
                              ),
                              subtitle: Text(
                                widget.data["lieu"].toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            60),
                              ),
                              trailing: Container(
                                width: MediaQuery.of(context).size.width / 3,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    alldrag
                                        ? AnimatedContainer(
                                            curve: standardEasing,
                                            duration: Duration(seconds: 3),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                10,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                10,
                                            decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft: Radius.circular(
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            40),
                                                    bottomRight:
                                                        Radius.circular(
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height /
                                                                40))),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  "Ouvert",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              80),
                                                ),
                                                Text(
                                                  "7J/7",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              70),
                                                )
                                              ],
                                            ),
                                          )
                                        : Center(),
                                    IconButton.filled(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.location_on,
                                          color: Colors.white,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                            ListTile(
                              title: Text(
                                "Description",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            60),
                              ),
                              subtitle: Text(widget.data["description"]),
                            ),
                            ListTile(
                              title: Text(
                                "Nos menus",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            60),
                              ),
                              subtitle: Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height / 6,
                                //  color: Colors.green,
                                child: Swiper(
                                  autoplay: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var card = model.getcard[index];
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                          builder: (context) {
                                            return MenuPages(
                                              menu: card,
                                              nomlieu: widget.data["title"]
                                                  .toString(),
                                            );
                                          },
                                        ));
                                      },
                                      child: Stack(
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: MediaQuery.of(context)
                                                .size
                                                .height,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image:
                                                        CachedNetworkImageProvider(
                                                            card.multimedia),
                                                    fit: BoxFit.cover)),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2,
                                            decoration: BoxDecoration(
                                                color: Colors.white
                                                    .withOpacity(0.3),
                                                borderRadius: BorderRadius.only(
                                                    topRight: Radius.circular(
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            30),
                                                    bottomRight:
                                                        Radius.circular(
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height /
                                                                30))),
                                            child: Text(
                                              card.name,
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          60),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  layout: SwiperLayout.DEFAULT,
                                  itemCount: model.getmenu.length,
                                  pagination: SwiperPagination(),
                                  control: SwiperControl(),
                                ),
                              ),
                            ),
                            ListTile(
                              title: Text(
                                "Evenements",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            60),
                              ),
                              subtitle: Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height / 6,
                                // color: Colors.green,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  padding: EdgeInsets.all(0),
                                  itemCount: model.getevenement.length,
                                  itemBuilder: (context, index) {
                                    var even = model.getevenement[index];
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          evenselect = even.id.toString();
                                        });
                                        Timer(Duration(milliseconds: 300), () {
                                          setState(() {
                                            evenselect = "";
                                          });
                                        });
                                      },
                                      child: AnimatedContainer(
                                        duration: Duration(milliseconds: 300),
                                        height:
                                            MediaQuery.of(context).size.height /
                                                7,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                4,
                                        margin: EdgeInsets.only(
                                            right: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                100),
                                        padding: EdgeInsets.all(
                                            MediaQuery.of(context).size.height /
                                                100),
                                        decoration: BoxDecoration(
                                            border: evenselect.toString() ==
                                                    even.id.toString()
                                                ? Border.all(
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            350)
                                                : null,
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  even.multimedia,
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
                                              even.name.toString(),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: MediaQuery.of(
                                                              context)
                                                          .size
                                                          .width /
                                                      (even.name
                                                                  .toString()
                                                                  .length <=
                                                              25
                                                          ? 30
                                                          : 35)),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        )),
                      );
                    }))
          ],
        );
      },
    ));
  }
}
