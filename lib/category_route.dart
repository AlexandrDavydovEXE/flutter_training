import 'package:flutter/material.dart';

import 'category.dart';

final _backgroundColor = Colors.blue[10];

class CategoryRoute extends StatelessWidget {
  const CategoryRoute();

  static const _categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];

  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

  Widget _buildCategoryWidgets(List<Widget> categories) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => categories[index],
      itemCount: categories.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    final categories = <Category>[];

    for(var i = 0; i < _categoryNames.length; i++){
      categories.add(Category(
        name: _categoryNames[i],
        color: _baseColors[i],
        iconLocation: Icons.collections,
      ));
    }

    final listView = Container(
      color: _backgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: _buildCategoryWidgets(categories),
    );

    final appBar = AppBar (
      elevation: 0.0,
      title: Text(
        'Main Page',
        style: TextStyle(
          color: Colors.red,
          fontSize: 30.0,
        )
      ),
      centerTitle: true,
      backgroundColor: Colors.blue,
    );

    return Scaffold(
      appBar: appBar,
      body: listView,
    );
  }
}
