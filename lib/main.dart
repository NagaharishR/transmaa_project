import 'package:flutter/material.dart';
import 'package:transmaa_project/bottom_nav_screens/buy_sell.dart';
import 'package:transmaa_project/bottom_nav_screens/finance_insurance.dart';
import 'package:transmaa_project/bottom_nav_screens/history.dart';
import 'package:transmaa_project/bottom_nav_screens/loads.dart';
import 'package:transmaa_project/bottom_nav_screens/profile.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  // Define your screen widgets here
  final List<Widget> _screens = [
   loads(),
    buyandsell(),
    financeandinsurance(),
    history(),
    profile()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        leadingWidth: 150,
        leading: Padding(
          padding: EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/logo_removebg.png',
            fit: BoxFit.fitHeight,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () {}, icon:ImageIcon(AssetImage('assets/icons/bell.png')),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {}, icon: ImageIcon(AssetImage('assets/icons/question.png')),
            ),
          ),
        ],
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem( icon: ImageIcon(AssetImage('assets/icons/loads_icon.png')),
            label: 'Loads',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icons/buyandsell_icon.png')),
            label: 'Sell & Buy',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icons/financeandinsurance_icon.png')),
            label: 'Finance & Insurance',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icons/history_icon.png')),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icons/user_icon.png')),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orangeAccent,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
