import 'package:flutter/material.dart';
import './home_screen.dart';
import '../main_drawer.dart';
import '../my_profile/my_profile_screen.dart';
import '../help/help_content_screen.dart';
import '../dashboard/dashboard_screen.dart';
import '../kashtkaar_desk/kashtkaar_desk_screen.dart';
import '../about.dart';

class HomeTabsScreen extends StatefulWidget {
  static const routeName = '/homeTabsScreen';
  @override
  _HomeTabsScreenState createState() => _HomeTabsScreenState();
}

class _HomeTabsScreenState extends State<HomeTabsScreen> {
  //List of widgets to be shown in tab pages
  final List<Map<String, Object>> _pages = [
    {
      'page': HomeScreen(),
      'title': 'Home',
    },
    {
      'page': MyProfileScreen(),
      'title': 'My Profile',
    },
    {
      'page': DashboardScreen(),
      'title': 'Dashboard',
    },
    {
      'page': KashtkaarDeskScreen(),
      'title': 'Kashtkaar Desk',
    },
    {
      'page': HelpContentScreen(),
      'title': 'App Help',
    },
    // // {
    // //   'page': SaleDistrictProfileScreen(),
    // //   'title': 'Sales District KPIs',
    // // },
    // {
    //   'page': LocateDealerScreen(),
    //   'title': 'Locate Dealer through GPS',
    // },
    // {
    //   'page': HelpContentScreen(),
    //   'title': 'Application Help',
    // },
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
        //title: Text(_pages[_selectedPageIndex]['title']),
        title: Row(
          children: [
            Image.asset(
              'assets/images/ffc.png',
              height: 40,
              width: 70,
              //fit: BoxFit.fill,
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                _pages[_selectedPageIndex]['title'],
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          // DropdownButton(
          //   underline: Container(),
          //   icon: Icon(
          //     Icons.more_vert,
          //     color: Colors.white,
          //   ),
          //   items: [
          //     DropdownMenuItem(
          //       child: Container(
          //         color: Colors.green.shade200,
          //         child: Row(
          //           children: <Widget>[
          //             // Icon(Icons.exit_to_app),
          //             // SizedBox(width: 8),
          //             Text('About'),
          //           ],
          //         ),
          //       ),
          //       value: 'about',
          //     ),
          //     DropdownMenuItem(
          //       child: Container(
          //         child: Row(
          //           children: <Widget>[
          //             // Icon(Icons.exit_to_app),
          //             // SizedBox(width: 8),
          //             Text('About Applicaiton'),
          //           ],
          //         ),
          //       ),
          //       value: 'about1',
          //     ),
          //     DropdownMenuItem(
          //       child: Container(
          //         child: Row(
          //           children: <Widget>[
          //             // Icon(Icons.exit_to_app),
          //             // SizedBox(width: 8),
          //             Text('About'),
          //           ],
          //         ),
          //       ),
          //       value: 'about2',
          //     ),
          //   ],
          //   onChanged: (itemIdentifier) {
          //     if (itemIdentifier == 'about') {
          //       Navigator.pushNamed(context, AboutApplication.routeName);
          //     }
          //   },
          // ),
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {
              Navigator.of(context).pushNamed(AboutApplication.routeName);
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
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
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            //icon: Icon(Icons.perm_contact_cal),
            icon: Icon(Icons.person),
            label: 'My Profile',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.analytics),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.agriculture),
            label: 'Kashtkaar',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.help_center_rounded),
            label: 'Help',
          ),
        ],
      ),
    );
  }
}
