import 'package:flutter/material.dart';
import 'package:too_good_to_go_clone/widgets/small_store_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints){
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: 
              Column(
                children: [
                  const Text('Glória, Aveiro'),
                  const SearchBar(
                      padding: WidgetStatePropertyAll<EdgeInsets>(EdgeInsets.symmetric(horizontal: 16.0)),
                      leading: Icon(Icons.search),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Recomendações", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ), ),
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(text: "Ver tudo ", style: TextStyle(
                              color: Color.fromARGB(255, 70, 2, 187),
                              fontWeight: FontWeight.bold,
                            )),
                            WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: Icon(Icons.chevron_right, size: 20)
                            ),
                          ],
                        ),
                      ),
                    ]
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SmallStoreCard(
                        storeName: "Auchan - Aveiro",
                        storeImagePath: "assets/images/AuchanAveiro.jpg",
                        storeLogoPath: "assets/images/AuchanLogo.jpg",
                        availableSurpriseBags: 3
                      ),
                    ],  
                  ),
                  
                ],
              ),
          )
        );
      }),
    );
  }
}
