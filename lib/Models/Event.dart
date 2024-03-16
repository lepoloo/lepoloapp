class Event {
  final String id;
  final String name;
  final String description;
  final String multimedia;
  final String stardate;
  final String enddate;
  final String status;
  final String entertainmentid;
  final String label_id;
  Event(
      {required this.id,
      required this.description,
      required this.name,
      required this.multimedia,
      required this.stardate,
      required this.enddate,
      required this.status,
      required this.entertainmentid,
      required this.label_id});
}
