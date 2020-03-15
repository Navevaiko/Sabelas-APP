library constants;
import 'package:flutter/material.dart';
import 'dart:math';

const int TYPE_EXPENSES = 1;
const int TYPE_PROFIT = 0;

class Group {
  IconData icon;
  Color color;

  Group({this.icon, this.color});
}

class RecordModel {
  String title;
  String date;
  double price;
  int type;
  Group group;

  RecordModel({this.title, this.date, this.price, this.type, this.group});

  getFormattedPrice() {
    return price.toStringAsFixed(2);
  }
}


List<Group> groups = [
  Group(icon: Icons.attach_money, color: Color(0xFFB1D8B3)),
  Group(icon: Icons.fastfood, color: Color(0xFFE4A3A3)),
  Group(icon: Icons.beach_access, color: Color(0xFF8792DD)),
];

List<RecordModel> records = List.generate(
  20, 
  (index) {
    int groupIndex = Random().nextInt(groups.length - 1);
    double price = Random().nextDouble();
    int date = Random().nextInt(30);

    return RecordModel(
      price: price,
      group: groups[groupIndex],
      title: 'My Item $index',
      date: '$date de junho',
      type: Random().nextInt(2)
    );
  }
);