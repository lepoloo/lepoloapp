import "package:animated_rating_stars/animated_rating_stars.dart";
//import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import 'package:lepolo/pages/DetailLieux.dart';

class Lieuxcomposant extends StatefulWidget {
  var data;
  Lieuxcomposant(this.data);

  @override
  _LieuxcomposantState createState() => _LieuxcomposantState();
}

class _LieuxcomposantState extends State<Lieuxcomposant> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      isfavorite = widget.data["isfavorite"] ? true : false;
    });
  }

  bool isfavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          right: MediaQuery.of(context).size.height / 100,
          top: MediaQuery.of(context).size.height / 100,
          bottom: MediaQuery.of(context).size.height / 100),
      height: MediaQuery.of(context).size.height / 3.8,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                blurRadius: MediaQuery.of(context).size.height / 200)
          ],
          //    color: Colors.grey,
          borderRadius: BorderRadius.all(
              Radius.circular(MediaQuery.of(context).size.height / 80))),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 6.5,
                decoration: BoxDecoration(
                    //   color: Colors.red,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(widget.data["image"])),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                            MediaQuery.of(context).size.height / 80),
                        topRight: Radius.circular(
                            MediaQuery.of(context).size.height / 80))),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 10,
                width: MediaQuery.of(context).size.width,
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height / 200),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(
                            MediaQuery.of(context).size.height / 80),
                        bottomRight: Radius.circular(
                            MediaQuery.of(context).size.height / 80))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 100),
                      child: Text(
                        widget.data["title"].toUpperCase(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.height / 50),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: Theme.of(context).primaryColor,
                        ),
                        Text(
                          widget.data["lieu"],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.height / 60),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 150),
                      child: AnimatedRatingStars(
                        readOnly: true,
                        filledColor: Theme.of(context).primaryColor,
                        displayRatingValue: true,
                        initialRating:
                            double.parse(widget.data["note"].toString()),
                        starSize: MediaQuery.of(context).size.height / 55,
                        onChanged: (value) {},
                        customFilledIcon: Icons.star,
                        customHalfFilledIcon: Icons.star_half,
                        customEmptyIcon: Icons.star_border,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Positioned(
              top: MediaQuery.of(context).size.height / 100,
              left: MediaQuery.of(context).size.height / 100,
              child: Container(
                  height: MediaQuery.of(context).size.height / 25,
                  padding: EdgeInsets.only(
                      left: 0, right: MediaQuery.of(context).size.height / 200),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorLight,
                      borderRadius: BorderRadius.all(Radius.circular(
                          MediaQuery.of(context).size.height / 50))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.local_library_sharp,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 100),
                        child: Text(
                          widget.data["title"],
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.height / 55,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ))),
          Positioned(
              bottom: MediaQuery.of(context).size.height / 50,
              right: MediaQuery.of(context).size.height / 100,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return DetailLieux(widget.data);
                    },
                  ));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 25,
                  child: CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColorLight,
                      child: Center(
                          child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: MediaQuery.of(context).size.height / 80,
                        color: Colors.white,
                      ))),
                ),
              )),
          Positioned(
              top: MediaQuery.of(context).size.height / 100,
              right: MediaQuery.of(context).size.height / 100,
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      isfavorite = !isfavorite;
                    });
                  },
                  icon: Icon(
                    isfavorite ? Icons.favorite : Icons.favorite_border,
                    color: Theme.of(context).primaryColor,
                    size: MediaQuery.of(context).size.height / 40,
                  )))
        ],
      ),
    );
  }
}
