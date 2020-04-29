import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WorldWidePanel extends StatelessWidget {

  final Map worldData;

  const WorldWidePanel({Key key, this.worldData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 2),
      children: <Widget>[

        Container(
            padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
            child: StatusPanel(
          title: 'Confirmed Cases',
          textColor: Colors.red,
          count: worldData['cases'].toString(),
        )),
        Container(
            padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
            child: StatusPanel(
          title: 'Active Cases',
          textColor: Colors.red,
          count: worldData['active'].toString(),
        )),
        Container(
            padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
            child: StatusPanel(
          title: 'Recovered',
          textColor: Colors.red,
          count: worldData['recovered'].toString(),
        )),
        Container(
            padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
            child: StatusPanel(
          title: 'Deaths',
          textColor: Colors.red,
          count:  worldData['deaths'].toString(),
        )),
        Container(
            padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
            child: StatusPanel(
              title: 'Affected Countries',
              textColor: Colors.red,
              count:  worldData['affectedCountries'].toString(),
            )),
        Container(
            padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
            child: StatusPanel(
          title: 'Cases Today',
          textColor: Colors.red,
          count:  worldData['todayCases'].toString(),
        )),
      ],
      ),
    );
  }
}

class StatusPanel extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  const StatusPanel({Key key, this.panelColor, this.textColor, this.title, this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: Colors.black54,blurRadius:1,offset:Offset(0,3))
          ]
      ),
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.all(1),
      height: 40,
      width: width/2,
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Text(title,
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
        ),Text(count, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: textColor),)],
      ) ,
    );
  }
}
