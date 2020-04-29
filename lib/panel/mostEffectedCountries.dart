import 'package:flutter/material.dart';

class MostEffectedPanel extends StatelessWidget {
  final List countryData;

  const MostEffectedPanel({Key key, this.countryData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context,index){
       return Container(
         padding: EdgeInsets.symmetric(horizontal: 10),
         decoration: BoxDecoration(
           color: Colors.black26,
           borderRadius: BorderRadius.circular(10)
         ),
         margin: EdgeInsets.symmetric(vertical: 5,horizontal: 15),
         child: Row(
           children: <Widget>[
             Image.network(countryData[index]['countryInfo']['flag'],height: 25,),
             SizedBox(width: 10),
             Text(countryData[index]['country'],style: TextStyle(fontWeight: FontWeight.bold),),
             SizedBox(width: 10),
             Text('Cases:' + countryData[index]['cases'].toString(),style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
             SizedBox(width: 10),
             Text('Deaths:' + countryData[index]['deaths'].toString(),style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
           ],
         ),
       );
      },
        itemCount: 10,
      ),
    );
  }
}
