import 'highlights.dart';

class Store {

  final String name;
  final String storeImagePath;
  final String logoImagePath;
  String openingRetrievalHours;
  String closingRetrievalHours;
  String address;
  String mealType;
  List<Highlight> top3Highlights;
  int availableSurpriseBags;
  int last6monthsReviewCount;
  double rating;
  double price;
  double discountedPrice;

  Store({
    required this.name,
    required this.storeImagePath,
    required this.logoImagePath,
    required this.openingRetrievalHours,
    required this.closingRetrievalHours,
    required this.address,
    required this.mealType,
    required this.top3Highlights,
    required this.availableSurpriseBags,
    required this.last6monthsReviewCount,
    required this.rating,
    required this.price,
    required this.discountedPrice,
  });

  bool buySurpriseBag() {
    if (availableSurpriseBags > 0) {
      availableSurpriseBags--;
      return true;
    }
    return false;
  }

}

// create a list of Stores
List<Store> stores = [
  Store(
      name: "Auchan - Aveiro",
      storeImagePath: "assets/images/AuchanAveiro.jpg",
      logoImagePath: "assets/images/AuchanLogo.jpg",
      openingRetrievalHours: "18:30",
      closingRetrievalHours: "20:00",
      address: "R. Dom Manuel Barbuda e Vasconcelos",
      mealType: "Mercearia",
      top3Highlights: [hQualityPriceRatio, hDeliciousFood, hFriendlyStaff],
      availableSurpriseBags: 4,
      last6monthsReviewCount: 150,
      rating: 3.5,
      price: 2.9,
      discountedPrice: 5.2
  ),
  Store(
      name: "Saladas +",
      storeImagePath: "assets/images/AuchanAveiro.jpg",
      logoImagePath: "assets/images/AuchanLogo.jpg",
      openingRetrievalHours: "21:30",
      closingRetrievalHours: "22:00",
      address: "Rua São Sebastião n 31",
      mealType: "Menu do dia",
      top3Highlights: [hQualityPriceRatio, hDeliciousFood, hFriendlyStaff],
      availableSurpriseBags: 4,
      last6monthsReviewCount: 290,
      rating: 4.3,
      price: 2.99,
      discountedPrice: 9.00
  ),
  Store(
      name: "Wok Home",
      storeImagePath: "assets/images/AuchanAveiro.jpg",
      logoImagePath: "assets/images/AuchanLogo.jpg",
      openingRetrievalHours: "23:00",
      closingRetrievalHours: "23:15",
      address: "R. Direita de Aradas 103, 3810-005 Aveiro, Portugal",
      mealType: "Jantar",
      top3Highlights: [hQualityPriceRatio, hGoodQuantity, hFastRetrieval],
      availableSurpriseBags: 1,
      last6monthsReviewCount: 213,
      rating: 4.7,
      price: 5.99,
      discountedPrice: 18.00
  ),
  Store(
      name: "Cidadella",
      storeImagePath: "assets/images/AuchanAveiro.jpg",
      logoImagePath: "assets/images/AuchanLogo.jpg",
      openingRetrievalHours: "20:00",
      closingRetrievalHours: "21:00",
      address: "Via Cândido Teles 7, 3830-126 Ílhavo, Portugal",
      mealType: "Pastelaria",
      top3Highlights: [hQualityPriceRatio, hGoodQuantity, hFastRetrieval],
      availableSurpriseBags: 3,
      last6monthsReviewCount: 178,
      rating: 4.6,
      price: 2.99,
      discountedPrice: 9.00
  ),
  Store(
      name: "Comphy",
      storeImagePath: "assets/images/AuchanAveiro.jpg",
      logoImagePath: "assets/images/AuchanLogo.jpg",
      openingRetrievalHours: "14:30",
      closingRetrievalHours: "15:00",
      address: "Centro Comercial Oita, 2.ºpiso, loja 406, Av. Dr. Lourenço Peixinho Loja 406, 3800-140 Aveiro, Portugal",
      mealType: "Refeição",
      top3Highlights: [hQualityPriceRatio, hFriendlyStaff, hDeliciousFood],
      availableSurpriseBags: 4,
      last6monthsReviewCount: 33,
      rating: 4.2,
      price: 2.99,
      discountedPrice: 9.00
  ),
  Store(
      name: "Pizza Hut - Forum Aveiro",
      storeImagePath: "assets/images/AuchanAveiro.jpg",
      logoImagePath: "assets/images/AuchanLogo.jpg",
      openingRetrievalHours: "22:00",
      closingRetrievalHours: "23:00",
      address: "R. do Batalhão de Caçadores 10 2.07, 3810-064 Aveiro, Portugal",
      mealType: "Surprise Bag Média: Pizza à fatia e/ou complementos (Jantar)",
      top3Highlights: [hQualityPriceRatio, hDeliciousFood, hFriendlyStaff],
      availableSurpriseBags: 1,
      last6monthsReviewCount: 15,
      rating: 3.0,
      price: 3.99,
      discountedPrice: 8.00
  ),
  Store(
      name: "Vitaminas - Fórum Aveiro",
      storeImagePath: "assets/images/AuchanAveiro.jpg",
      logoImagePath: "assets/images/AuchanLogo.jpg",
      openingRetrievalHours: "21:30",
      closingRetrievalHours: "22:00",
      address: "R. do Batalhão de Caçadores 10 Store 2.2a, 3810-064 Aveiro, Portugal",
      mealType: "Refeição pequena (excepto saladas)",
      top3Highlights: [hQualityPriceRatio, hFriendlyStaff, hDeliciousFood],
      availableSurpriseBags: 4,
      last6monthsReviewCount: 47,
      rating: 3.8,
      price: 2.99,
      discountedPrice: 9.00
  ),
];