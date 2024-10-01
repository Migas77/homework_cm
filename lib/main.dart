import 'package:flutter/material.dart';
import 'package:too_good_to_go_clone/screens/home_screen.dart';
import 'package:too_good_to_go_clone/screens/search_screen.dart';
import 'package:too_good_to_go_clone/widgets/stores_map.dart';

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
  int _selectedIndex = 0;
  List<Widget> _screens = [
    HomeScreen(),
    SearchScreen(),
    StoresMap(),
    Placeholder()
  ];

  @override
  Widget build(BuildContext context) {
    Widget screen = _screens[_selectedIndex];

    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints){
        return SafeArea(child: screen);
      }),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            label: 'Descobrir',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Pesquisar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed, // disable zoom in animation
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.black,
      ),
    );
  }
}


