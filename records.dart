//Normal what we do in flutter
void main(List<String> args) {
  final (lat: hi, long: ho) = location();
  print(hi);
  print(ho);
}

// Location location() {
//   return Location(lat: '1', long: '2');
// }

// class Location {
//   final String lat;
//   final String long;

//   Location({required this.lat, required this.long});
// }

//With record concept comes into picture we can do like this

({int lat, int long}) location() {
  return (lat: 1, long: 2);
}
