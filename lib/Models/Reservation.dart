import 'package:lepolo/Models/EntertainmentSite.dart';

class Reservation {
  final String id;
  final String date;
  final String hour;
  final String nbr_personnes;
  final EntertainmentSite entertainementSite;
  Reservation(
      {required this.id,
      required this.date,
      required this.hour,
      required this.nbr_personnes,
      required this.entertainementSite});
}
