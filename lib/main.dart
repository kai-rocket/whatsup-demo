import 'package:flutter/material.dart';
import 'package:whatsup_demo/chat_screen.dart';
import 'package:whatsup_demo/nav_bar_item_data.dart';
import 'package:whatsup_demo/settings_screen.dart';

void main() => runApp(WhatsUp());

class WhatsUp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsUp',
      home: WhatsUpRoot(title: 'WhatsUp Chat App'),
    );
  }
}

class WhatsUpRoot extends StatefulWidget {
  WhatsUpRoot({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WhatsUpRootState createState() => _WhatsUpRootState();
}

class _WhatsUpRootState extends State<WhatsUpRoot> {
  int _selectedNavBarItemIndex = 1;

  final List<NavBarItemData> bottomNavBarItemData = [
    NavBarItemData('Chats', Icons.chat, ChatScreen()),
    NavBarItemData('Settings', Icons.settings, SettingsScreen()),
  ];

  void _onNavBarItemTapped(int index) {
    setState(() {
      _selectedNavBarItemIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: bottomNavBarItemData[_selectedNavBarItemIndex].screen,
      bottomNavigationBar: BottomNavigationBar(
          items: bottomNavBarItemData
              .map(
                (NavBarItemData itemData) => BottomNavigationBarItem(
                    icon: Icon(itemData.icon), title: Text(itemData.text)),
              )
              .toList(),
          currentIndex: _selectedNavBarItemIndex,
          onTap: _onNavBarItemTapped),
    );
  }
}
