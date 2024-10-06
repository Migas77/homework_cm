class Supermarket {

  final String name;
  final String locale;
  final String storeImagePath;
  final String logoImagePath;
  final double distance;

  Supermarket({
    required this.name,
    required this.locale,
    required this.storeImagePath,
    required this.logoImagePath,
    required this.distance,
  });

}

List<Supermarket> allSupermarketsList = [
  Supermarket(
    name: "Minipreço",
    locale: "Ílhavo",
    storeImagePath: "assets/images/AuchanAveiro.jpg",
    logoImagePath: "assets/images/AuchanLogo.jpg",
    distance: 3.2,
  ),
  Supermarket(
    name: "Minipreço",
    locale: "Aveiro",
    storeImagePath: "assets/images/AuchanAveiro.jpg",
    logoImagePath: "assets/images/AuchanLogo.jpg",
    distance: 4.7,
  ),
];