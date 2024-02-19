import "package:flutter/material.dart";
import "package:lepolo/pages/LoginPage.dart";
import "package:lepolo/scoped/mains.dart";
import "package:scoped_model/scoped_model.dart";
import "package:stacked_notification_cards/stacked_notification_cards.dart";

class AnnoncePage extends StatefulWidget {
  const AnnoncePage({Key? key}) : super(key: key);

  @override
  _AnnoncePageState createState() => _AnnoncePageState();
}

class _AnnoncePageState extends State<AnnoncePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      _listannlonces = [
        {
          'lieu': "Douala",
          "data": [
            NotificationCard(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/images/people.jpg"),
              ),
              date: DateTime(2022),
              title: "Festival de la Jeunesse",
              subtitle:
                  "Un festival coloré avec des concerts, des spectacles de danse, des activités sportives et des stands de nourriture.",
            ),
            NotificationCard(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/images/people.jpg"),
              ),
              date: DateTime(2023),
              title: "Carnaval des Jeunes",
              subtitle:
                  "Un défilé festif avec des costumes flamboyants, de la musique en direct et des animations de rue.",
            ),
            NotificationCard(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/images/people.jpg"),
              ),
              date: DateTime(2021),
              title: "Soirée Cinéma en Plein Air",
              subtitle:
                  "Une projection de films populaires sous les étoiles, avec des snacks et des animations avant le film.",
            )
          ]
        },
        {
          'lieu': "Yaoundé",
          "data": [
            NotificationCard(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/images/everybody.jpg"),
              ),
              date: DateTime(2022),
              title: "Concert Live en Plein Air",
              subtitle:
                  "Une soirée de musique live avec des groupes locaux et des artistes émergents.",
            ),
            NotificationCard(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/images/everybody.jpg"),
              ),
              date: DateTime(2023),
              title: "Tournoi de Football de Quartier",
              subtitle:
                  "Un tournoi de football passionnant impliquant des équipes locales dans les quartiers de Yaoundé.",
            ),
            NotificationCard(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/images/everybody.jpg"),
              ),
              date: DateTime(2021),
              title: "Exposition d'Art Contemporain",
              subtitle:
                  "Une exposition mettant en lumière le talent des jeunes artistes camerounais dans différents domaines de l'art contemporain.",
            )
          ]
        },
      ];
    });
  }

  List _listannlonces = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ScopedModelDescendant<Mainscoped>(
      builder: (context, child, model) {
        return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: model.getisconnect
              ? ListView.builder(
                  itemCount: _listannlonces.length,
                  itemBuilder: (context, index) {
                    var annonceslieux = _listannlonces[index];
                    //  List listevenement = [];
                    return StackedNotificationCards(
                      cardClearButton: Icon(Icons.close),
                      clearAllStacked: Icon(
                        Icons.close,
                        size: MediaQuery.of(context).size.height / 55,
                      ),
                      notificationCardTitle: "Promotion",
                      clearAllNotificationsAction: Icon(Icons.close),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          blurRadius: 2.0,
                        )
                      ],
                      notificationCards: annonceslieux["data"],
                      cardColor: Color(0xFFF1F1F1),
                      padding: 16,
                      actionTitle: Text(
                        annonceslieux["lieu"].toString(),
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor),
                      ),
                      showLessAction: Text('Reduire',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 55,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          )),
                      onTapClearAll: () {
                        setState(() {
                          annonceslieux["data"].clear();
                        });
                      },
                      cardViewButton: Text('Afficher'),
                      onTapClearCallback: (index) {
                        print(index);
                        setState(() {
                          annonceslieux["data"].removeAt(index);
                        });
                      },
                      onTapViewCallback: (index) {
                        print("affichage de " + index.toString());
                      },
                    );
                  },
                )
              : Center(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return LoginPage();
                          },
                        ));
                      },
                      child: Text("Se connecter"))),
        );
      },
    ));
  }
}
