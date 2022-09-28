import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/widgets/app_drawer.dart';
import '../models/cart.dart';
import '../screens/cart_screen.dart';
import '../screens/profile_screen.dart';
import '../models/products.dart';
import 'notifications_screen.dart';
import 'product_overview_screen.dart';
import '../widgets/icon_counter.dart';
import '../widgets/badge.dart';

enum FilterOptions {
  Favourites,
  All
}

class Screen {
  final Widget page;
  final String title;

  const Screen({required this.page, required this.title});
}

class TabScreen extends StatefulWidget {
  TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {

  late final List<Screen> pages;
  var _showMoreVertIcon = true;

  @override
  void initState() {
    pages = [
      const Screen(page: ProductOverviewScreen(), title: 'Orion.'),
      const Screen(page: NotificationsScreen(), title: 'Notifications'),
      const Screen(page: ProfileScreen(), title: 'John Doe'),
      const Screen(page: CartScreen(), title: 'Basket'),
    ];
    super.initState();
  }

  int _selectedPageIndex = 0;
  // Flutter provides us with this index
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
      // Decide when to show the more vertical icon
      _showMoreVertIcon = _selectedPageIndex == 0 ? true : false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[_selectedPageIndex].title),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.black,
        elevation: 1,
        actions: [
          // Consumer widget is provided by Provider
          // It only changes the widget within itself
          //IconCounter(icon: Icon(Icons.shopping_cart), counter: 2),
          Consumer<Cart>(
            builder: (ctx, cart, child) => IconCounter(icon: child!, counter: cart.itemsCount,),
            child: IconButton(
                icon: const Icon(Icons.shopping_cart,),
                onPressed: () => Navigator.of(context).pushNamed(CartScreen.routeName),
            ),
          ),
          if(_showMoreVertIcon) Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: PopupMenuButton(
              // This widget gives us the <PopupMenuItem> value selected by the user
                onSelected: (FilterOptions selectedValue) {
                  final productsProvider = Provider.of<Products>(context, listen: false);
                  if (selectedValue == FilterOptions.Favourites) {
                    productsProvider.setShowFavoritesOnly(true);
                  } else {
                    productsProvider.setShowFavoritesOnly(false);
                  }
                },
                child: const Icon(Icons.more_vert),
                itemBuilder: (ctx) => [
                  const PopupMenuItem(child: Text('Show Favourites'), value: FilterOptions.Favourites),
                  const PopupMenuItem(child: Text('Show All'), value: FilterOptions.All)
                ]
            ),
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: pages[_selectedPageIndex].page,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: BottomNavigationBar(
          // gap: 8,iconSize: 26,
          // activeColor: Colors.black,
          // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          // duration: const Duration(milliseconds: 600),
          // //tabBackgroundColor: Colors.grey,
          // selectedIndex: _selectedPageIndex,
          // onTabChange: _selectPage,
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.black,
          unselectedLabelStyle: const TextStyle(color: Colors.black),
          showUnselectedLabels: true,
          selectedItemColor: Colors.amber,
          currentIndex: _selectedPageIndex,
          elevation: 0,
          items: const [
            // GButton(icon: Icons.home, text: 'Home',),
            // GButton(icon: Icons.shopping_basket_rounded, text: 'Basket'),
            // GButton(icon: Icons.notifications, text: 'Noifications'),
            // GButton(icon: Icons.account_circle_sharp, text: 'Profile'),
            BottomNavigationBarItem(icon: Icon(Icons.home, size: 28,), label: 'Home',),
            BottomNavigationBarItem(icon: Icon(Icons.notifications, size: 28), label: 'Noifications'),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle_sharp, size: 28), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
