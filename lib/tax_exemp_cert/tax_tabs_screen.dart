import 'package:flutter/material.dart';
import '../home/home_tabs_screen.dart';
import './tax_ffc_screen.dart';
import './tax_ffbl_screen.dart';

class TaxTabsScreen extends StatefulWidget {
  static const routeName = '/taxTabsScrn';

  @override
  State<TaxTabsScreen> createState() => _TaxTabsScreenState();
}

class _TaxTabsScreenState extends State<TaxTabsScreen> {
  //List of widgets to be shown in tab pages
  final List<Map<String, Object>> _pages = [
    {
      'page': TaxFfcScreen(),
      'title': 'FFC',
    },
    {
      'page': TaxFfblScreen(),
      'title': 'FFBL',
    },
  ];
  int _selectedPageIndex = 0;

  //index of the page will be automatically passed to this method by Flutter
  _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.of(context)
                  .pushReplacementNamed(HomeTabsScreen.routeName);
            },
          ),
        ],
      ),
      // drawer: Drawer(
      //   child: MainDrawer(),
      // ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        //Following line added to avoid error Invalid value: Not in range 0..2, inclusive: 3
        type: BottomNavigationBarType.fixed,
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
        currentIndex: _selectedPageIndex,
        //type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(
              Icons.download_outlined,
            ),
            label: 'FFC',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.download_outlined),
            label: 'FFBL',
          ),
        ],
      ),
    );
  }
}
