import "dart:math";
//import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:lepolo/Composants/Lieuxcomposant.dart";

class CategoriePage extends StatefulWidget {
  Map categoriedata;
  CategoriePage(this.categoriedata);

  @override
  _CategoriePageState createState() => _CategoriePageState();
}

class _CategoriePageState extends State<CategoriePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Generatedata();
  }

  List lieux = [];
  Generatedata() {
    for (var i = 1; i < 10; i++) {
      setState(() {
        for (var l = 0; l < 5; l++) {
          lieux.add({
            "title": "Lieu " + i.toString() + l.toString(),
            "category_id": i,
            "isfavorite": Random().nextInt(i) < l ? true : false,
            "lieu": "Lieu " + i.toString(),
            "note": Random().nextDouble() * 5,
            "image":
                "https://images.pexels.com/photos/941864/pexels-photo-941864.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
          });
        }
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoriedata["title"]),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount: 1 +
              lieux
                  .length, // Nombre total d'éléments (1 pour categoriedata + la taille de lieux)
          itemBuilder: (context, index) {
            if (index == 0) {
              // Premier élément, correspondant à widget.categoriedata
              return Container(
                height: MediaQuery.of(context).size.height / 8,
                width: MediaQuery.of(context).size.width,
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height / 100),
                decoration: BoxDecoration(
                  //  color: Colors.grey,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(widget.categoriedata["image"]),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.categoriedata["title"],
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.height / 35,
                      ),
                    ),
                    Text(
                      widget.categoriedata["description"],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height / 55,
                      ),
                    ),
                  ],
                ),
              );
            } else {
              // Éléments suivants correspondant à la liste de lieux
              Map lieu = lieux[index - 1];
              return Lieuxcomposant(lieu);
            }
          },
        ),
      ),
    );
  }
}
