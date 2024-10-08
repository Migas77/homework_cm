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
    storeImagePath: "assets/images/miniprecoStore1.jpg",
    logoImagePath: "assets/images/miniPrecoLogo.png",
    distance: 3.2,
  ),
  Supermarket(
    name: "Minipreço",
    locale: "Aveiro",
    storeImagePath: "assets/images/miniPrecoStore2.jpg",
    logoImagePath: "assets/images/miniPrecoLogo.png",
    distance: 4.7,
  ),
];