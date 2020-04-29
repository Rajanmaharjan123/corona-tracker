import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:coronatracker/pages/faqs.dart';

class InfoPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder:(context) =>FAQPage() ));
            },
            child: Card(
              elevation: 10,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                color: Colors.white12,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('FAQS',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
                      Icon(Icons.arrow_forward_ios,color: Colors.red,),
                    ],
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              launch('https://covid19responsefund.org/');
            },
            child: Card(
              elevation: 10,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                color: Colors.white12,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('DONATE',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
                      Icon(Icons.arrow_forward_ios,color: Colors.red,),
                    ],
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              launch('https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters');
            },
            child: Card(
              elevation: 10,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                color: Colors.white12,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('MYTH BUSTERS',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
                      Icon(Icons.arrow_forward_ios,color: Colors.red,),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

