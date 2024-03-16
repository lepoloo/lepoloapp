class EntertainmentSite {
  final String id;
  final String name;
  final String description;
  final String image;
  final String status;
  final String address;
  final double longitude;
  final double latitude;
  final List shedules;
  final List products;
  final String location;
  final String owner;
  EntertainmentSite(
      {required this.id,
      required this.name,
      required this.description,
      required this.image,
      required this.status,
      required this.address,
      required this.longitude,
      required this.latitude,
      required this.shedules,
      required this.products,
      required this.location,
      required this.owner});
}
