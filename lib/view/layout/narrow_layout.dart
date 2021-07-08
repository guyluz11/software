import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ubuntu_software_store/pages/page_items.dart';

class NarrowLayout extends StatefulWidget {
  final List<PageItem> pageItems;

  NarrowLayout({Key? key, required this.pageItems}) : super(key: key);

  @override
  _NarrowLayoutState createState() => _NarrowLayoutState();
}

class _NarrowLayoutState extends State<NarrowLayout> {
  late int _selectedIndex;
  @override
  void initState() {
    _selectedIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: widget.pageItems[_selectedIndex].builder(context),
            ),
          ),
          BottomNavigationBar(
            items: widget.pageItems
                .map((pageItem) => BottomNavigationBarItem(
                    icon: Icon(pageItem.iconData), label: pageItem.title))
                .toList(),
            currentIndex: _selectedIndex,
            onTap: (index) => setState(() => _selectedIndex = index),
          ),
        ],
      )),
    );
  }
}
