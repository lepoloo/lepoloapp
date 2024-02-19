//import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:flutter_image_stack/flutter_image_stack.dart";
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
    Generateperson();
  }

  List person = [];
  Generateperson() {
    for (var i = 0; i < 5; i++) {
      setState(() {
        person.add("assets/images/people.jpg");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
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
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(widget.data['image']))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height / 250),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(
                              MediaQuery.of(context).size.height / 90))),
                      child: Text(
                        widget.data["title"].toString().toUpperCase(),
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.height / 60),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 15,
                      width: MediaQuery.of(context).size.width * 2 / 3,
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height / 150),
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          boxShadow: [
                            BoxShadow(
                                color: const Color.fromARGB(255, 192, 187, 187),
                                blurRadius:
                                    MediaQuery.of(context).size.height / 200)
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(
                              MediaQuery.of(context).size.height / 55))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 4,
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.all(Radius.circular(
                                    MediaQuery.of(context).size.height / 100))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "OUVERTURE",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              70),
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height / 1000,
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.black26,
                                ),
                                Text(
                                  "07H00",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              50),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 10,
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                shape: BoxShape.circle),
                            child: Center(
                              child: Text(
                                "7J/7",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            80),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 4,
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.all(Radius.circular(
                                    MediaQuery.of(context).size.height / 100))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "FERMETURE",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              70),
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height / 1000,
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.black26,
                                ),
                                Text(
                                  "20H30",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              50),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                  top: MediaQuery.of(context).size.height / 12,
                  left: MediaQuery.of(context).size.height / 100,
                  child: IconButton.filled(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios))),
              Positioned(
                  right: MediaQuery.of(context).size.height / 100,
                  top: MediaQuery.of(context).size.height / 8,
                  child: Column(
                    children: [
                      IconButton.filled(
                        onPressed: () {},
                        icon: Icon(Icons.favorite_outline),
                      ),
                      IconButton.filled(
                        onPressed: () {},
                        icon: Icon(Icons.flag),
                      ),
                    ],
                  )),
              Positioned(
                  right: MediaQuery.of(context).size.height / 20,
                  bottom: MediaQuery.of(context).size.height / 20,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 35,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                Theme.of(context).primaryColorLight)),
                        onPressed: () {},
                        child: Text(
                          "Ville",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        )),
                  )),
            ]),
          ),
        ),
        DraggableScrollableSheet(
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
                      backgroundImage: AssetImage(widget.data["image"]),
                    ),
                    title: Text(
                      widget.data["title"].toString(),
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.height / 45),
                    ),
                    subtitle: Text(
                      widget.data["lieu"].toString(),
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: MediaQuery.of(context).size.height / 60),
                    ),
                    trailing: IconButton.filled(
                        onPressed: () {},
                        icon: Icon(
                          Icons.location_on,
                          color: Colors.white,
                        )),
                  ),
                  ListTile(
                    title: Text(
                      "Description",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.height / 65),
                    ),
                    subtitle: Text(widget.data["description"]),
                  ),
                  ListTile(
                    title: Text(
                      "Evenements",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.height / 65),
                    ),
                  )
                ],
              )),
            );
          },
        )
      ],
    ));
  }
}
