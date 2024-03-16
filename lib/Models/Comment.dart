import 'package:lepolo/Models/EntertainmentSite.dart';

class Comment {
  final String id;
  final String content;
  final String note;
  final EntertainmentSite entertainmentSite;
  Comment(
      {required this.id,
      required this.content,
      required this.note,
      required this.entertainmentSite});
}
