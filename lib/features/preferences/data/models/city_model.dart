class City {
  final int id;
  final String name;
  final double latitude;
  final double longitude;
  final String location;

  City(
      {required this.id,
      required this.name,
      required this.latitude,
      required this.longitude,
      required this.location});
}

List<City> cities = [
  City(
      id: 1,
      name: 'New York',
      latitude: 40.7128,
      longitude: -74.0060,
      location: "New York, USA"),
  City(
      id: 2,
      name: 'Los Angeles',
      latitude: 34.0522,
      longitude: -118.2437,
      location: "California, USA"),
  City(
      id: 3,
      name: 'Chicago',
      latitude: 41.8781,
      longitude: -87.6298,
      location: "Illinois, USA"),
];

String? getCityNameFromId(int? cityId) {
  City? foundCity = cities.firstWhere((city) => city.id == cityId);
  return foundCity.name;
}
