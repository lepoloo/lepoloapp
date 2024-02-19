import 'package:shared_preferences/shared_preferences.dart';
import "../data/lieux.dart";
import "../data/evenements.dart";
import 'package:scoped_model/scoped_model.dart';

class Mainscoped extends Model {
  List lieux = [];
  get getlieux {
    return lieux;
  }

  fetchlieux() {
    for (var i = 1; i < 10; i++) {
      categories.add({
        "id": i,
        "title": "Categorie " + i.toString(),
        "description": "Description " + i.toString(),
        "image": "assets/images/people.jpg"
      });
    }
    lieux = datalieux;
    notifyListeners();
  }

  List evenements = evenementdata;
  get getevenement {
    return evenements;
  }

  fetchevenement() {}
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
}
