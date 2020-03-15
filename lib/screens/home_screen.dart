import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sabelas/global%20widgets/record_widget.dart';
import 'package:sabelas/screens/records_screen.dart';
import 'package:sabelas/models/record_model.dart' as RecorModel;

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> _months = [
    'Jan',
    'Fev',
    'Mar',
    'Abr',
    'Mai',
    'Jun',
    'Jul',
    'Ago',
    'Set',
    'Out',
    'Nov',
    'Dez'
  ];
  int _selectedMonth = 0;

  Widget _createMonthsValuesContainer(int type, double value) {
    Color lightColor;
    Color darkColor;
    IconData icon;
    IconData signIcon;

    if (type == RecorModel.TYPE_PROFIT) {
      lightColor = Color(0xFF91F699);
      darkColor = Color(0xFF5DB064);
      icon = Icons.trending_up;
      signIcon = Icons.add;
    } else {
      lightColor = Color(0xFFF39595);
      darkColor = Color(0xFFBD7575);
      icon = Icons.trending_down;
      signIcon = Icons.remove;
    }

    String formattedValue = value.toStringAsFixed(2);

    return Container(
      width: 160.0,
      height: 160.0,
      decoration: BoxDecoration(
          color: lightColor,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                offset: Offset(0.0, 2.0),
                blurRadius: 2.0)
          ]),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 15.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80.0), color: Colors.white),
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Icon(
                icon,
                size: 60.0,
                color: lightColor,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  signIcon,
                  color: darkColor,
                  size: 35.0,
                ),
                Text(
                  'R\$$formattedValue',
                  style: TextStyle(
                      color: darkColor,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget records = ListView.builder(
      padding: EdgeInsets.all(0.0),
      itemCount: RecorModel.records.length,
      itemBuilder: (BuildContext context, int index) {
        return RecordWidget(record: RecorModel.records[index]);
      }
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu),
          iconSize: 40.0,
          onPressed: () => print('Hey'),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 80.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 15.0, top: 5.0),
              child: Text(
                'JUNHO',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Valor total:',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      color: Color(0xFF5D5D5D)),
                ),
                SizedBox(width: 10.0),
                Text(
                  'R\$ 700,00',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      color: Color(0xFF5DB064)),
                )
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _createMonthsValuesContainer(0, 50.0),
                _createMonthsValuesContainer(1, 30.0)
              ],
            ),
            SizedBox(height: 20.0),
            Container(
              height: 20.0,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _months.length,
                  itemBuilder: (BuildContext context, int index) {
                    Color color = index == _selectedMonth
                        ? Theme.of(context).primaryColor
                        : Color(0xFFCCCCCC);
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedMonth = index;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          _months[index],
                          style: TextStyle(
                              color: color,
                              fontWeight: FontWeight.w800,
                              fontSize: 18.0),
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Total do mês:',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Color(0xFFCCCCCC)),
                ),
                SizedBox(width: 10.0),
                Text(
                  'R\$ 100,00',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Color(0xFF9ACD99),
                  ),
                )
              ],
            ),
            SizedBox(height: 20.0),
            Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Hero(
                  tag: 'registerList',
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40.0),
                            topRight: Radius.circular(40.0)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0.0, -4.0),
                              blurRadius: 2.0)
                        ]),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 15.0),
                          child: Container(
                            width: 90.0,
                            height: 10.0,
                            decoration: BoxDecoration(
                                color: Color(0XFF5D5D5D),
                                borderRadius:
                                    BorderRadiusDirectional.circular(10.0)),
                          ),
                        ),
                        Container(
                          height: 200.0,
                          child: NotificationListener<ScrollNotification>(
                            onNotification: (scrollNotification) {
                              if (scrollNotification is ScrollStartNotification) {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => RecordScreen()));
                              }

                              return true;
                            },
                            child: records,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: -20.0,
                  right: 15.0,
                  child: Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0.0, 0.0),
                              blurRadius: 5.0)
                        ]),
                    child: Icon(
                      Icons.add,
                      size: 80.0,
                      color: Color(0xFFCCCCCC),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
