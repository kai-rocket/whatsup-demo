import 'package:flutter/material.dart';

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
  int _selectedNavBarItemIndex = 0;

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
      // TODO(kai): Set body to the Widget that corresponds to the current nav bar index
      body: Center(
        // TODO(kai): Change this to ListView.builder to be more efficient
        child: ListView(children: <Widget>[
          Text('child 1'),
          Text('child 2'),
          Text('child 3'),
          Text('child 4'),
        ]),
      ),
      bottomNavigationBar:
          BottomNavigationBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.chat), title: Text('Chats')),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings), title: Text('Settings'))
      ], currentIndex: _selectedNavBarItemIndex, onTap: _onNavBarItemTapped),
    );
  }
}
