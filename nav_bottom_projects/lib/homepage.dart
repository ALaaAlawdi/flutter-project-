import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<StatefulWidget> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState
    extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final _pages = <Widget>[
      const Center(
          child: Icon(Icons.cloud, size: 64.0, color: Color.fromARGB(255, 29, 185, 84))),
      const Center(
          child: Icon(Icons.alarm, size: 64.0, color: Color.fromARGB(255, 95, 57, 192))),
      const Center(
          child: Icon(Icons.forum, size: 64.0, color: Color.fromARGB(255, 255, 87, 34))),
    ];
    final _navBarItems = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(icon: Icon(Icons.cloud), label: 'Item 1'),
      const BottomNavigationBarItem(icon: Icon(Icons.alarm), label: 'Item 2'),
      const BottomNavigationBarItem(icon: Icon(Icons.forum), label: 'Item 3'),
    ];
    assert(_pages.length == _navBarItems.length);
    final bottomNavigationBar = BottomNavigationBar(
      items: _navBarItems,
      currentIndex: _selectedIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _selectedIndex = index;
        });
      },
    );
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
