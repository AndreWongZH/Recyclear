class EachIngredient {
  String name;
  String expiry;
  String location;
  String time;

  EachIngredient(this.name, this.expiry, this.location, this.time);

  static List<EachIngredient> getList() {
    return [
      EachIngredient("cabbage", "30/9/20", "choa chu kang avenue 4 #12-123", "12pm to 3pm sat"),
      EachIngredient("carrots", "15/1/10", "choa chu kang avenue 4 #12-123", "2pm to 5pm mon"),
      EachIngredient("cilantro", "20/3/20", "choa chu kang avenue 4 #12-123", "7pm to 8pm tue"),
      EachIngredient("rice", "29/4/20", "choa chu kang avenue 4 #12-123", "8am to 9pm sun"),
    ];
  }
}