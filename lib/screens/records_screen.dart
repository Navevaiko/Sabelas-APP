import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sabelas/global%20widgets/record_widget.dart';
import 'package:sabelas/models/record_model.dart' as RecordModel;


class RecordScreen extends StatelessWidget {
  ScrollController _scrollController = ScrollController();
  BuildContext buildContext;

  _scrollListener() {
    if(_scrollController.offset <= _scrollController.position.minScrollExtent) {
        Navigator.pop(buildContext);
    }
  }

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(_scrollListener);
    buildContext = context;

    return Scaffold(
      body: Hero(
        tag: 'registerList',
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: Container(
                  width: 90.0,
                  height: 10.0,
                  decoration: BoxDecoration(
                      color: Color(0XFF5D5D5D),
                      borderRadius: BorderRadiusDirectional.circular(10.0)),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  padding: EdgeInsets.all(0.0),
                  itemCount: RecordModel.records.length,
                  itemBuilder: (BuildContext context, int index) {
                    return RecordWidget(record: RecordModel.records[index]);
                  }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
