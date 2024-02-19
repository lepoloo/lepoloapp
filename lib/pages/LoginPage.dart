import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lepolo/pages/HomeManager.dart';
import 'package:lepolo/scoped/mains.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "package:custom_clippers/custom_clippers.dart";

class LoginPage extends StatefulWidget {
  LoginPage({
    Key? key,
  });
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool activelogin = false;
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(child: ScopedModelDescendant<Mainscoped>(
      builder: (context, child, model) {
        return Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: Stack(children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 1.5,
                child: ClipPath(
                  clipper: WaveClipper(),
                  child: Container(
                    //height: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        //  opacity: 0.7,
                        image: AssetImage("assets/images/everybody.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    alignment: Alignment.center,
                    // padding: EdgeInsets.only(top:MediaQuery, bottom:MediaQuery),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 1.9,
                    width: MediaQuery.of(context).size.width * 2.3 / 3,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(
                            MediaQuery.of(context).size.width / 20))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Center(
                            child: Container(
                          height: MediaQuery.of(context).size.height / 8,
                          width: MediaQuery.of(context).size.height / 8,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/logo.png"))),
                        )),
                        Container(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.height / 40),
                          child: Text(
                            "Email",
                            style:
                                TextStyle(color: Colors.grey, fontSize: 16.0),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: _emailFocusNode.hasFocus
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey.withOpacity(0.5),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          margin: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 15.0),
                                child: Icon(
                                  Icons.person_outline,
                                  color: _emailFocusNode.hasFocus
                                      ? Theme.of(context).primaryColor
                                      : Colors.grey,
                                ),
                              ),
                              Container(
                                height: 30.0,
                                width: 1.0,
                                color: _emailFocusNode.hasFocus
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey.withOpacity(0.5),
                                margin: const EdgeInsets.only(
                                    left: 00.0, right: 10.0),
                              ),
                              Expanded(
                                child: TextField(
                                  controller: _emailcontroller,
                                  focusNode: _emailFocusNode,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Enter your email',
                                    hintStyle: TextStyle(color: Colors.grey),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.height / 40),
                          child: Text(
                            "Password",
                            style:
                                TextStyle(color: Colors.grey, fontSize: 16.0),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: _passwordFocusNode.hasFocus
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey.withOpacity(0.5),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          margin: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 15.0),
                                child: Icon(
                                  Icons.lock_open,
                                  color: _passwordFocusNode.hasFocus
                                      ? Theme.of(context).primaryColor
                                      : Colors.grey,
                                ),
                              ),
                              Container(
                                height: 30.0,
                                width: 1.0,
                                color: _passwordFocusNode.hasFocus
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey.withOpacity(0.5),
                                margin: const EdgeInsets.only(
                                    left: 00.0, right: 10.0),
                              ),
                              Expanded(
                                child: TextField(
                                  controller: _passwordcontroller,
                                  focusNode: _passwordFocusNode,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Enter your password',
                                    hintStyle: TextStyle(color: Colors.grey),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            setState(() {
                              activelogin = !activelogin;
                            });
                            model.fetchlieux();
                            Timer(Duration(seconds: 1), () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(
                                builder: (context) {
                                  return HomeManager(mains: model);
                                },
                              ));
                            });
                            model.activeisconnect();
                          },
                          child: Center(
                            child: AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                padding: EdgeInsets.symmetric(
                                    vertical:
                                        MediaQuery.of(context).size.height /
                                            150,
                                    horizontal:
                                        MediaQuery.of(context).size.height /
                                            50),
                                margin: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 15.0),
                                height: MediaQuery.of(context).size.height / 20,
                                width: activelogin
                                    ? MediaQuery.of(context).size.width / 3
                                    : MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          blurRadius: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              400)
                                    ],
                                    borderRadius: BorderRadius.circular(
                                        MediaQuery.of(context).size.height /
                                            40)),
                                child: Row(
                                  mainAxisAlignment: activelogin
                                      ? MainAxisAlignment.center
                                      : MainAxisAlignment.spaceBetween,
                                  children: [
                                    activelogin
                                        ? Center()
                                        : Container(
                                            child: Text(
                                              "Login",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          40),
                                            ),
                                          ),
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 5,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(500))),
                                      child: Center(
                                        child: activelogin
                                            ? Container(
                                                child:
                                                    CircularProgressIndicator(
                                                  strokeWidth:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          150,
                                                ),
                                              )
                                            : Icon(
                                                Icons.navigate_next,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                size: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    35,
                                              ),
                                      ),
                                    )
                                  ],
                                )),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 15,
                          width: MediaQuery.of(context).size.width,
                          //  color: Colors.red,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 20.0),
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 20.0),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: InkWell(
                                        //   shape:  RoundedRectangleBorder(borderRadius:  BorderRadius.circular(30.0)),
                                        //    color: Colors.transparent,
                                        child: Container(
                                          padding:
                                              const EdgeInsets.only(left: 20.0),
                                          alignment: Alignment.center,
                                          child: Text(
                                            "DON'T HAVE AN ACCOUNT?",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .primaryColor),
                                          ),
                                        ),
                                        onTap: () => {},
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ]));
      },
    )));
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2.25, size.height / 2.25);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
        Offset(size.width - (size.width / 3.25), size.height / 5);
    var secondEndPoint = Offset(size.width, size.height / 4);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
