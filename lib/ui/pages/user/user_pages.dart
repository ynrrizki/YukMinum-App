import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yukminum_app/shared/themes/themes.dart';
import 'package:yukminum_app/ui/pages/user/homes/home.dart';
import 'package:yukminum_app/ui/pages/user/locations/store_location.dart';
import 'package:yukminum_app/ui/pages/user/menus/menu.dart';
import 'package:yukminum_app/ui/pages/user/profiles/profile.dart';

class UserPages extends StatefulWidget {
  const UserPages({Key? key}) : super(key: key);

  @override
  State<UserPages> createState() => _UserPagesState();
}

class _UserPagesState extends State<UserPages> {
  AppBar? appBar;
  int _selectedIndex = 0;

  ScrollController? _scrollViewController;
  bool _showAppbar = true;
  bool isScrollingDown = false;

  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    Menu(),
    StoreLocation(),
    Profile(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollViewController = ScrollController();
    _scrollViewController!.addListener(() {
      if (_scrollViewController!.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          setState(() {
            isScrollingDown = true;
            _showAppbar = false;
          });
        }
      }

      if (_scrollViewController!.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          setState(() {
            isScrollingDown = false;
            _showAppbar = true;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollViewController!.dispose();
    _scrollViewController!.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        // extendBodyBehindAppBar: true,
        appBar: AppBar(
          toolbarHeight: _showAppbar ? 70 : 0,
          backgroundColor: bgColorPrimary,
          actions: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              child: TextButton(
                onPressed: () {
                  //! Navigator.pushReplacementNamed(context, '/checkout-page');
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/checkout-page', (route) => false);
                },
                child: const Icon(
                  Icons.add_shopping_cart,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
          ],

          //* -For Menu Page-
          elevation: (_selectedIndex == 1) || (_selectedIndex == 2) ? 1 : 0,
          foregroundColor: colorSecondary,
          titleTextStyle: interTitle,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: 5,
              ),
              SizedBox(
                width: 150,
                height: 45,
                child: Image.asset(
                  'assets/images/AppBar-YukMinum.png',
                ),
              ),
              const SizedBox(
                width: 15,
              ),
            ],
          ),

          //* -For Menu Page-
          bottom: (_selectedIndex == 1)
              ? TabBar(
                  labelColor: Colors.black,
                  indicatorColor: Colors.black,
                  tabs: [
                    Tab(
                      child: Row(children: const [
                        Icon(Icons.discount),
                        SizedBox(width: 10),
                        Text('Promo'),
                      ]),
                    ),
                    Tab(
                      child: Row(children: const [
                        Icon(Icons.coffee),
                        SizedBox(width: 10),
                        Text('Coffee'),
                      ]),
                    ),
                    Tab(
                      child: Row(children: const [
                        Icon(Icons.local_bar),
                        SizedBox(width: 10),
                        Text('Milkshake'),
                      ]),
                    ),
                  ],
                )
              : null,
        ),
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.black,
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            unselectedLabelStyle: GoogleFonts.inter(
              fontWeight: FontWeight.w300,
              fontSize: 12,
            ),
            selectedLabelStyle: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.coffee),
                label: 'Menu',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.location_on_outlined),
                label: 'Store Location',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined),
                label: 'Profile',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.white,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
