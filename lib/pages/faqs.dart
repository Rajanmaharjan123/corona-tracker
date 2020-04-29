import 'package:flutter/material.dart';
import 'package:coronatracker/dataSource.dart';

class FAQPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FAQS'),),
      body: ListView.builder(
          itemCount: DataSource.questionAnswers.length,
          itemBuilder: (context,index){
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
          child: Card(
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 10,
            child: ExpansionTile(title: Text(DataSource.questionAnswers[index]['question'],style: TextStyle(fontSize: 15),),
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(bottom: 20,left: 10,right: 10),
                  child: Text(DataSource.questionAnswers[index]['answer'],style: TextStyle(fontSize: 15, ),)),
            ],
            ),
          ),
        );
      }),
    );
  }
}
