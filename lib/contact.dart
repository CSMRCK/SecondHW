class Contact {
  String name = "No name";
  String surname;
  String description;
  String image;
  bool isFavourite;

  Contact(
      {this.name = "No name",
      this.surname = "No surname",
      this.description = "",
      this.image = "default.png",
      this.isFavourite = false});
}
