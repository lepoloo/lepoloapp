//import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:flutter_stories/flutter_stories.dart";

class PageStatus extends StatefulWidget {
  final List image;
  final imageperson;
  final String name;
  final bool istext;
  final Function next;
  final Function previous;
  const PageStatus(
      {Key? key,
      required this.image,
      required this.imageperson,
      required this.istext,
      required this.name,
      required this.next,
      required this.previous})
      : super(key: key);

  @override
  _PageStatusState createState() => _PageStatusState();
}

class _PageStatusState extends State<PageStatus> {
  @override
  Widget build(BuildContext context) {
    return Story(
        onFlashBack: () {
          widget.previous();
        },
        onFlashForward: () {
          widget.next();
        },
        fullscreen: false,
        momentBuilder: (context, index) {
          var data = widget.image[index];
          return Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      data["data"],
                    ),
                  ),
                ),
              ),
              Positioned(
                  bottom: MediaQuery.of(context).size.height / 25,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.height / 100),
                    child: Center(
                      child: Text(
                        data["message"],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.height / 45),
                      ),
                    ),
                  )),
              Positioned(
                  top: MediaQuery.of(context).size.height / 15,
                  left: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 5,
                    child: ListTile(
                      leading: Container(
                        width: MediaQuery.of(context).size.width / 6,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                  size: MediaQuery.of(context).size.height / 35,
                                )),
                            CircleAvatar(
                              backgroundImage: AssetImage(widget.imageperson),
                            ),
                          ],
                        ),
                      ),
                      title: Text(
                        widget.name,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        data["date"],
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.normal),
                      ),
                      trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.more_horiz,
                            color: Colors.white,
                          )),
                    ),
                  ))
            ],
          );
        },
        momentDurationGetter: (index) {
          return Duration(seconds: 3);
        },
        momentCount: widget.image.length);
  }
}
