class EachFood {
  String name;
  String location;
  String time;

  EachFood(this.name, this.location, this.time);

  static List<EachFood> getList() {
    return [
      EachFood("apple", "choa chu kang avenue 4 #12-123", "12pm to 3pm sat"),
      EachFood("kueh bangkit", "choa chu kang avenue 4 #12-123", "2pm to 5pm mon"),
      EachFood("chocolate cookies", "choa chu kang avenue 4 #12-123", "7pm to 8pm tue"),
      EachFood("grapes", "choa chu kang avenue 4 #12-123", "8am to 9pm sun"),
    ];
  }
}