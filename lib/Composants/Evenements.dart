//import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";

class Evenements extends StatelessWidget {
  String image_lieu, nom_lieu, data_lieu, image, description;
  bool isfavorite;
  Evenements(this.nom_lieu, this.image_lieu, this.data_lieu, this.image,
      this.description, this.isfavorite);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.5,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 100),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.grey,
            blurRadius: MediaQuery.of(context).size.height / 200)
      ]),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 13,
            child: ListTile(
                leading: CircleAvatar(),
                title: Text(
                  nom_lieu,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.height / 45),
                ),
                subtitle: Text(
                  data_lieu,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: MediaQuery.of(context).size.height / 60),
                )),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 5,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.fill)),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 12,
            width: MediaQuery.of(context).size.width,
            //  color: Colors.grey,
            padding: EdgeInsets.all(MediaQuery.of(context).size.height / 100),
            child: Text(
              description,
              textAlign: TextAlign.justify,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.height / 55),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(MediaQuery.of(context).size.height / 100),
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.favorite,
                        size: MediaQuery.of(context).size.height / 80,
                        color: Colors.red,
                      ),
                      Text(
                        "Favori",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 80),
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 7,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.flag,
                        size: MediaQuery.of(context).size.height / 80,
                        color: Theme.of(context).primaryColor,
                      ),
                      Text(
                        "Signaler",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 80),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
