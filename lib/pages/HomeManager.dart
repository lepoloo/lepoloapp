import "package:flutter/material.dart";
import "package:lepolo/pages/AnnoncePage.dart";
import "package:lepolo/pages/EvenementPage.dart";
import "package:lepolo/pages/Home.dart";
import "package:lepolo/scoped/mains.dart";
import "package:scoped_model/scoped_model.dart";

class HomeManager extends StatefulWidget {
  final Mainscoped mains;
  const HomeManager({Key? key, required this.mains}) : super(key: key);

  @override
  _HomeManagerState createState() => _HomeManagerState();
}

class _HomeManagerState extends State<HomeManager>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Tab> items = [
    Tab(
      icon: Icon(Icons.home),
      text: "Acceuil",
    ),
    Tab(
      icon: Icon(Icons.event),
      text: "Evenements",
    ),
    Tab(
      icon: Icon(Icons.notifications),
      text: "Annonces",
    ),
    Tab(
      icon: Icon(Icons.location_on),
      text: "Carte",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<Mainscoped>(builder: (context, child, model) {
      return Scaffold(
        appBar: AppBar(),
        bottomNavigationBar: Material(
          color: Colors.white,
          child: TabBar(
            tabs: items,
            controller: _tabController,
          ),
        ),
        body: TabBarView(
          children: [
            Home(),
            EvenementPage(mains: model),
            AnnoncePage(),
            EvenementPage(mains: model)
          ],
          controller: _tabController,
        ),
      );
    });
  }
}
