class Starships {
  final List<Starship> dataModel;

  Starships({required this.dataModel});

  factory Starships.fromJson(List<dynamic> list) {
    List<Starship> dataList =
        list.map((ship) => Starship.fromJson(ship)).toList();
    return Starships(dataModel: dataList);
  }
}

class Starship {
  final String name;
  final String manufacturer;
  final String crew;
  final String passengers;
  final String hyperdriveRating;

  Starship(
      {required this.name,
      required this.manufacturer,
      required this.crew,
      required this.passengers,
      required this.hyperdriveRating});

  factory Starship.fromJson(Map<String, dynamic> json) {
    return Starship(
        name: json['name'],
        manufacturer: json['manufacturer'],
        crew: json['crew'],
        passengers: json['passengers'],
        hyperdriveRating: json['hyperdrive_rating']);
  }
}
