class LocationEntity {
  final String city;
  final String uf;
  final String country; 
  final int lat;
  final int long;
  
  LocationEntity({
    required this.city,
    required this.uf,
    required this.country,
    required this.lat,
    required this.long,
  });
}
