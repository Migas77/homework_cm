import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:too_good_to_go_clone/animations/slide_animations.dart';
import 'package:too_good_to_go_clone/mycolors/colors.dart';
import 'package:too_good_to_go_clone/providers/favorite_stores_state.dart';
import 'package:too_good_to_go_clone/providers/stock_stores_state.dart';
import 'package:too_good_to_go_clone/screens/favorites_screen.dart';
import 'package:too_good_to_go_clone/screens/home_screen.dart';
import 'package:too_good_to_go_clone/screens/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => StockState()),
        ChangeNotifierProvider(create: (context) => FavoriteStoresState()),
      ],

      child: MaterialApp(
        title: 'Too Good To Go Clone',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/',
        onGenerateRoute: (settings) {
          if (settings.name == '/') {
            return createRouteSlideOut(const MyHomePage());
          }
          return null;
        },
      )
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
  final List<Widget> _screens = [
    const HomeScreen(),
    const SearchScreen(),
    const FavoritesScreen(),
    const Placeholder()
  ];

  @override
  Widget build(BuildContext context) {
    Widget screen = _screens[_selectedIndex];

    return Scaffold(
      body: SafeArea(child:
        LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth <= 450) {
              return Row(
                children: [Expanded(child: screen),],
              );
            }
            return Row(
              children: [
                // desktop/view-side friendly
                NavigationRail(
                  destinations:  const [
                    NavigationRailDestination(
                      icon: Icon(Icons.explore_outlined),
                      selectedIcon: Icon(Icons.explore),
                      label: Text('Descobrir'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.shopping_bag_outlined),
                      selectedIcon: Icon(Icons.shopping_bag),
                      label: Text('Pesquisar'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.favorite_border),
                      selectedIcon: Icon(Icons.favorite),
                      label: Text('Favoritos'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.person_outline),
                      selectedIcon: Icon(Icons.person),
                      label: Text('Perfil'),
                    ),
                  ],
                  selectedIndex: _selectedIndex,
                  onDestinationSelected: (index) {
                    setState(() {
                      if(index != 3) {
                      _selectedIndex = index;
                      }
                    });
                  },
                  backgroundColor: Colors.white,
                  selectedIconTheme: const IconThemeData(color: MyColorPalette.darkGreen),
                  unselectedIconTheme: const IconThemeData(color: Colors.black45),
                ),
                Expanded(child: screen),
              ],
            );
          }
        )
      ),

      // mobile friendly
      bottomNavigationBar: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 450){
            return const SizedBox.shrink(); // empty widget
          } else {
            return BottomNavigationBar(
              backgroundColor: Colors.white,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.explore_outlined),
                  activeIcon: Icon(Icons.explore),
                  label: 'Descobrir',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag_outlined),
                  activeIcon: Icon(Icons.shopping_bag),
                  label: 'Pesquisar',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border),
                  activeIcon: Icon(Icons.favorite),
                  label: 'Favoritos',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  activeIcon: Icon(Icons.person),
                  label: 'Perfil',
                ),
              ],
              currentIndex: _selectedIndex,
              onTap: (index) {
                setState(() {
                  if(index != 3) {
                    _selectedIndex = index;
                  }
                });
              },
              type: BottomNavigationBarType.fixed, // disable zoom in animation
              selectedItemColor: MyColorPalette.darkGreen,
              unselectedItemColor: Colors.black45,
              selectedFontSize:12.0,
              unselectedFontSize: 12.0,
            );
          }
        }
      ),
    );
  }
}


