//import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";

class EvenementCard extends StatefulWidget {
  final DateTime date;
  final bool isfavorite;
  final String title;
  final String lieu;
  final String map;
  String image;
  EvenementCard(
      {Key? key,
      required this.date,
      required this.isfavorite,
      required this.title,
      required this.lieu,
      required this.map,
      required this.image})
      : super(key: key);
  @override
  _EvenementCardState createState() => _EvenementCardState();
}

class _EvenementCardState extends State<EvenementCard> {
  bool isfavorite = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      isfavorite = widget.isfavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(MediaQuery.of(context).size.height / 50),
      height: MediaQuery.of(context).size.height * 2 / 3,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          // color: Colors.green,
          image: DecorationImage(
              image: AssetImage(widget.image), fit: BoxFit.cover),
          borderRadius: BorderRadius.all(
            Radius.circular(MediaQuery.of(context).size.height / 50),
          )),
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            //
            child: Center(
              child: Text(
                widget.title.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.height / 30),
              ),
            ),
          ),
          Positioned(
              top: MediaQuery.of(context).size.height / 100,
              left: MediaQuery.of(context).size.height / 100,
              child: Container(
                height: MediaQuery.of(context).size.height / 13,
                width: MediaQuery.of(context).size.height / 13,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(
                      Radius.circular(MediaQuery.of(context).size.height / 100),
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "JAN".toUpperCase(),
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height / 45,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "24".toUpperCase(),
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height / 55,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )),
          Positioned(
              top: MediaQuery.of(context).size.height / 50,
              right: MediaQuery.of(context).size.height / 50,
              child: Container(
                height: MediaQuery.of(context).size.height / 20,
                width: MediaQuery.of(context).size.height / 20,
                decoration:
                    BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        isfavorite = !isfavorite;
                      });
                    },
                    icon: Icon(
                      isfavorite ? Icons.favorite : Icons.favorite_outline,
                      color: Colors.red,
                      size: MediaQuery.of(context).size.height / 35,
                    )),
              )),
          Positioned(
              bottom: MediaQuery.of(context).size.height / 100,
              // left: MediaQuery.of(context).size.height / 100,
              child: Container(
                // color: Colors.yellow,
                width: MediaQuery.of(context).size.width * 2.8 / 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 2 / 3,
                      height: MediaQuery.of(context).size.height / 20,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                                MediaQuery.of(context).size.height / 100),
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.orange,
                          ),
                          TextButton(onPressed: () {}, child: Text(widget.lieu))
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 20,
                      width: MediaQuery.of(context).size.height / 20,
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Center(
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.home_work_sharp,
                              color: Colors.black,
                              size: MediaQuery.of(context).size.height / 35,
                            )),
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
