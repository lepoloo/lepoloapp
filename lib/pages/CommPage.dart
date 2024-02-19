import "dart:io";
//import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:flutter_stories/flutter_stories.dart";
import "package:image_picker/image_picker.dart";
import "package:lepolo/Composants/Evenements.dart";
import "package:lepolo/Composants/PageStatus.dart";
import "package:lepolo/scoped/mains.dart";
import "package:scoped_model/scoped_model.dart";

class CommPage extends StatefulWidget {
  @override
  _CommPageState createState() => _CommPageState();
}

class _CommPageState extends State<CommPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Generatedata();
  }

  PageController _pagecontroller = PageController();
  List evenementdata = [];
  late File _imageFile;
  final _picker = ImagePicker();

  Future _pickimagefromgallery() async {
    final PickedFile pickedfile =
        (await _picker.pickImage(source: ImageSource.gallery)) as PickedFile;
    setState(() {
      _imageFile = File(pickedfile.path);
    });
  }

  Future _pickimagefromcamera() async {
    final PickedFile pickedfile =
        (await _picker.pickImage(source: ImageSource.camera)) as PickedFile;
    setState(() {
      _imageFile = File(pickedfile.path);
    });
  }

  Generatedata() {
    for (var i = 1; i < 10; i++) {
      setState(() {
        evenementdata.add({
          "id": i,
          "lieu": "Evenement " + i.toString(),
          "description": "Description pour l'evenement " + i.toString(),
          "image":
              "https://images.pexels.com/photos/12366583/pexels-photo-12366583.jpeg?auto=compress&cs=tinysrgb&w=600",
          "date": "3 jours",
          "isfavori": true
        });
      });
    }
  }

  List<Map<String, dynamic>> storyItemList = [
    {
      "name": "Deadpool",
      "photo": "assets/images/everybody.jpg",
      "data": [
        {
          'data': "assets/images/people.jpg",
          "date": "15:45",
          "message": "Allez sur google et recherchez deadpool"
        },
        {
          "data": "assets/images/everybody.jpg",
          "date": "17:02",
          "message": "je suis deadpool le plus fort des heros"
        }
      ],
    },
    {
      "name": "Deadpool 2",
      "photo": "assets/images/everybody.jpg",
      "data": [
        {
          "data": "assets/images/people.jpg",
          'date': "17:03",
          "message": "j'ai recu le trophe du plus fort des heros'"
        },
        {
          "data": "assets/images/everybody.jpg",
          "date": "17:07",
          "message": "je suis deadpool le Manifique"
        }
      ],
    }
  ];

  Widget build(BuildContext context) {
    return ScopedModelDescendant<Mainscoped>(
      builder: (context, child, model) {
        return Container(
          color: Colors.grey[100],
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.height / 300),
            child: ListView(
              children: [
                Container(
                    height: MediaQuery.of(context).size.height / 12,
                    width: MediaQuery.of(context).size.width,
                    //   color: Colors.green,
                    child: ListView.builder(
                      itemCount: storyItemList.length,
                      itemBuilder: (context, index) {
                        var element = storyItemList[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return Scaffold(
                                  body: PageView.builder(
                                    controller: _pagecontroller,
                                    itemCount: storyItemList.length,
                                    itemBuilder: (context, index) {
                                      var element = storyItemList[index];
                                      Function next = () {
                                        _pagecontroller.nextPage(
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.easeOut);
                                      };
                                      Function previous = () {
                                        _pagecontroller.previousPage(
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.easeInBack);
                                      };
                                      return PageStatus(
                                          image: element["data"],
                                          imageperson: element["photo"],
                                          istext: false,
                                          name: element["name"].toString(),
                                          next: next,
                                          previous: previous);
                                    },
                                  ),
                                );
                              },
                            ));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 6,
                            height: MediaQuery.of(context).size.width / 5,
                            // color: Colors.yellow,
                            margin: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.height / 300),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CircleAvatar(
                                  backgroundImage:
                                      AssetImage(element["photo"].toString()),
                                ),
                                Text(
                                  element["name"],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              80),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      scrollDirection: Axis.horizontal,
                    )),
                Container(
                  height: MediaQuery.of(context).size.height / 10,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.height / 80),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.tv,
                                size: MediaQuery.of(context).size.height / 45,
                              )),
                          Text(
                            "Réels",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.height / 45),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: _pickimagefromcamera,
                        child: CircleAvatar(
                          minRadius: MediaQuery.of(context).size.height / 33,
                          backgroundColor: Theme.of(context).primaryColor,
                          child: Center(
                            child: Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.white,
                              size: MediaQuery.of(context).size.height / 45,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ...model.getevenement
                    .map<Widget>((e) => Evenements(e["lieu"], "image_lieu",
                        "date", e["image"], "description", true))
                    .toList()
              ],
            ),
          ),
        );
      },
    );
  }
}
