import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:coronatracker/pages/search.dart';

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {

  List countryData;
  fetchCountryData()async{
    http.Response response = await http.get('https://corona.lmao.ninja/v2/countries?sort=cases');
    setState(() {
      countryData = jsonDecode(response.body);
    });
  }

  @override
  void initState() {
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), color: Colors.grey,onPressed: (){
            showSearch(context: context, delegate: Search(countryData));
          },)
        ],
        title: Text('Country Stats'),),
      body:
      countryData == null ? Center(child: CircularProgressIndicator(),) : ListView.builder(itemBuilder: (context,index){
        return Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.grey,boxShadow: [
              BoxShadow(color: Colors.grey[50],blurRadius:5,offset:Offset(0,3))
          ]
          ),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(countryData[index]['country'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10),),
                  Image.network(countryData[index]['countryInfo']['flag'],height: 30,width: 40,),


                  ],
                ),
              ),
              Expanded(child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Confirmed Cases:'+ countryData [index]['cases'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                    Text('Active Cases:'+ countryData [index]['active'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                    Text('Recovered:'+ countryData [index]['recovered'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                    Text('Total Deaths:'+ countryData [index]['deaths'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),)
                  ],
                ),
              ),),
            ],
          ),
        );
      },
        itemCount: countryData == null ?0:countryData.length ,
      ),
    );


  }
}
