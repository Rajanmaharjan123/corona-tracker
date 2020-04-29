import 'dart:convert';

import 'package:coronatracker/dataSource.dart';
import 'package:coronatracker/pages/faqs.dart';
import 'package:coronatracker/panel/infoPanel.dart';
import 'package:coronatracker/panel/mostEffectedCountries.dart';
import 'package:coronatracker/panel/worldWidePanel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:coronatracker/pages/countryPage.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map worldData;
  fetchWorldWideData()async{
    http.Response response = await http.get('https://corona.lmao.ninja/v2/all');
    setState(() {
      worldData = jsonDecode(response.body);
    });
  }

  List countryData;
  fetchCountryData()async{
    http.Response response = await http.get('https://corona.lmao.ninja/v2/countries?sort=cases');
    setState(() {
      countryData = jsonDecode(response.body);
    });
  }


@override
void initState(){
    fetchWorldWideData();
    fetchCountryData();
    super.initState();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 20,left: 20),
                child: Text('About App Developer :',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,),)),
            UserAccountsDrawerHeader(
              accountName: Text('Rajan Maharjan'),
              accountEmail: Text('rajanmaharjan123@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(
                Icons.person_outline,
                color: Colors.red,
              ),
            )
            ),

            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black87)
              ),
              child: InkWell(
                onTap: () => Navigator.of(context).push(
                    new MaterialPageRoute(builder: (context) => CountryPage())),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: ListTile(
                    title: Text('Country Stats',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    leading: Icon(Icons.flag),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
               border: Border.all(color: Colors.black87)
              ),
              child: InkWell(
                onTap: () => Navigator.of(context).push(
                    new MaterialPageRoute(builder: (context) => FAQPage())),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: ListTile(
                    title: Text('FAQ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    leading: Icon(Icons.question_answer),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black87)
              ),
              child: InkWell(
                onTap: () {
                  launch('https://covid19responsefund.org/');
                },
                  child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: ListTile(
                    title: Text('Donate',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    leading: Icon(Icons.present_to_all),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black87)
              ),
              child: InkWell(
                onTap: () {
                  launch('https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters');
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: ListTile(
                    title: Text('Myth buster',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    leading: Icon(Icons.cloud_queue),
                  ),
                ),
              ),
            ),
          ],
        ),

      ),
      appBar: AppBar(title: Text('Covid 19'),backgroundColor: Colors.black38,),

        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25,vertical: 15),
                padding: EdgeInsets.symmetric(vertical: 60,horizontal: 400),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),boxShadow: [
                  BoxShadow(color: Colors.grey[50],blurRadius:3,offset:Offset(0,2))
                ],
                  image: DecorationImage(
              image: AssetImage('images/corona.jpg'),fit: BoxFit.fill
          )
                ),
              ),
              Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Worldwide',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CountryPage() ));
                        },
                        child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: primaryBlack,
                              borderRadius: BorderRadius.circular(15)
                            ),
                            child: Text('Regional',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),)),
                      ),
                    ],
                  )),
              worldData == null ? CircularProgressIndicator():WorldWidePanel(worldData: worldData,),
              Padding(padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text('Most Affected Countries',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
              SizedBox(height: 10),
             countryData == null ?Container() : MostEffectedPanel(countryData: countryData,),
             InfoPanel(),
              SizedBox(height: 20 ),
              Center(
                  child: Text('Keep calm and carry on. The only thing we have to fear is fear itself.Dont worry, be happy.',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 20,fontStyle: FontStyle.italic),)),
              SizedBox(height: 50 ),
            ],
          ),
        ),
    );
  }
}
