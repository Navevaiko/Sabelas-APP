import 'package:flutter/material.dart';
import 'package:sabelas/models/record_model.dart';

class RecordWidget extends StatelessWidget {
  RecordWidget({this.record});

  final RecordModel record;

  @override
  Widget build(BuildContext context) {
    String prefix = record.type == TYPE_PROFIT ? '+' : '-';
    Color priceColor =
        record.type == TYPE_PROFIT ? Color(0xFF5DB064) : Color(0xFFBD7575);

    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 70.0,
            height: 70.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70),
                border: Border.all(width: 2.0, color: record.group.color)),
            child: Icon(
              record.group.icon,
              size: 40.0,
              color: record.group.color,
            ),
          ),
          SizedBox(width: 5.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Material(
                child: Text(
                  record.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      color: Color(0xFF5D5D5D)),
                ),
              ),
              Material(
                child: Text(
                  record.date,
                  style: TextStyle(
                    color: Color(0xFF5D5D5D),
                    fontStyle: FontStyle.italic,
                  ),
                ),
              )
            ],
          ),
          SizedBox(width: 40.0),
          Material(
            child: Text(
              '$prefix R\$ ${record.getFormattedPrice()}',
              style: TextStyle(
                color: priceColor,
                fontSize: 20.0,
                fontWeight: FontWeight.w800,
              ),
            ),
          )
        ],
      ),
    );
  }
}
