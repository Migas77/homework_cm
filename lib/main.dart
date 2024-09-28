import 'package:flutter/material.dart';

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Card(
                        clipBehavior: Clip.hardEdge,
                        child: InkWell(
                          splashColor: const Color(0x1F0000FF), // Equivalent to Colors.blue.withAlpha(30)
                          onTap: () {
                            debugPrint('Card tapped.');
                          },
                          child: 
                            SizedBox(
                              width: 250,
                              height: 177,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Stack(
                                    children: [
                                      Image.asset("assets/images/AuchanAveiro.jpg", fit: BoxFit.cover, width: 250, height: 100),
                                      Positioned(
                                        top: 5,  
                                        right: 5,
                                        child: IconButton.filled(
                                          padding: const EdgeInsets.all(3),
                                          constraints: const BoxConstraints(maxHeight: 36),
                                          onPressed: () { debugPrint('Favorite tapped.'); },
                                          icon: const Icon(
                                            Icons.favorite_border_outlined,
                                            color: Colors.white
                                          ),
                                          // remove splash effect
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                        )
                                      ),
                                      Positioned(
                                        top: 5,
                                        left: 5,
                                        child: Container(
                                          margin: const EdgeInsets.all(40),
                                          width: 115,
                                          height: 20,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF4AAEFD), //blue
                                            borderRadius: BorderRadius.circular(45),
                                          ),
                                          child: const Text(
                                            '3 Surprise Bags',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              color: Colors.white,
                                            ),
                                          ),
                                        )

                                      )

                                      
                                    ]
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        Text("Suprise Bag", style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        )),
                                        Text("Recolher hoje 21:30 - 22:00", style: TextStyle(
                                          color: Color.fromARGB(255, 112, 112, 112),
                                          fontSize: 12,
                                        )),
                                        Row(
                                          children: [
                                            Expanded(child: 
                                              Row(
                                                children: [
                                                  Icon(Icons.star, color: Colors.green, size: 18,),
                                                  SizedBox(width: 5),
                                                  Text("4,7", style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                  )),
                                                  SizedBox(
                                                    height: 18,
                                                    child: VerticalDivider(
                                                      thickness: 0.35,
                                                      color: Colors.grey,
                                                    )
                                                  ),
                                                  Text("4,1 Km", style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                  )),
                                                ],
                                              )
                                            ),
                                            Align(alignment: Alignment.centerRight, child:
                                              Text("4,99 €", style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17,
                                                color: Color.fromARGB(255, 3, 44, 4)
                                              )),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ),
                        )
                        
                      )
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
