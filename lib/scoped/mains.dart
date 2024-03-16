import "package:lepolo/Models/Card.dart";
import "package:lepolo/Models/CategorySite.dart";
import "package:lepolo/Models/Event.dart";
import 'package:shared_preferences/shared_preferences.dart';
import "../data/lieux.dart";
import "../data/evenements.dart";
import "../data/menu.dart";
import 'package:scoped_model/scoped_model.dart';

class Mainscoped extends Model {
  List lieux = [];
  get getlieux {
    return lieux;
  }

  fetchlieux() {
    for (var i = 1; i < 10; i++) {
      categories.add(CategorySite(
          id: i.toString(),
          name: "Categorie " + i.toString(),
          description: "Description " + i.toString(),
          active: "true"));
    }

    fetchMenu();
    fetchEntertainment();
    notifyListeners();
  }

  List<CardModel> cardData = [];
  fetchcards() {
    cardData = cards;
    notifyListeners();
  }

  fetchMenu() {
    menu = menus;
    notifyListeners();
  }

  fetchEntertainment() {
    lieux = datalieux;
    notifyListeners();
  }

  List<CardModel> card = [];
  fetchcard() {
    for (var element in menus) {
      card.add(CardModel(
        id: element["id"].toString(),
        name: element["nom"],
        description: element["description"],
        multimedia: element["image"],
        entertainmentid: element["id"].toString(),
        familyid: "familyid",
      ));
    }
    notifyListeners();
  }

  get getcard {
    return card;
  }

  List<Event> evenements = [];
  get getevenement {
    return evenements;
  }

  fetchevenement() {
    evenements = [];
    for (var even in evenementdata) {
      evenements.add(Event(
          id: even["id"].toString(),
          description: even["description"],
          name: even["nom"],
          multimedia: even["image"],
          stardate: "stardate",
          enddate: "enddate",
          status: "status",
          entertainmentid: even["id_lieu"].toString(),
          label_id: "label_id"));
    }
    notifyListeners();
  }

  List categories = [];
  get getcategories {
    return categories;
  }

  fetchcategories() {}
  bool isconnect = false;
  get getisconnect {
    return isconnect;
  }

  activeisconnect() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isconnect = true;
    prefs.setBool("isconnect", true);
    notifyListeners();
  }

  verifyconnect() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool("isconnect") == null ||
        prefs.getBool("isconnect") == false) {
      isconnect = false;
    } else {
      isconnect = true;
    }
    notifyListeners();
  }

  List menu = [];
  get getmenu {
    return menu;
  }
}
