import 'package:flutter/material.dart';

class Search extends SearchDelegate{
  final List countryList;

  Search(this.countryList);

  @override
  ThemeData appBarTheme(BuildContext context) => Theme.of(context);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: Icon(Icons.clear),onPressed: (){
        query ='';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){
      Navigator.pop(context);
    },);
  }

  @override
  Widget buildResults(BuildContext context) {
 return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    final suggestionList = query.isEmpty?countryList: countryList.where((element)=> element['country'].toString().toLowerCase().startsWith(query),).toList();
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context,index){
      return Container(
        margin: EdgeInsets.only(top: 5,bottom: 5),
        padding: EdgeInsets.all(20),
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.grey,boxShadow: [
          BoxShadow(color: Colors.grey[50],blurRadius:10,offset:Offset(0,5))
        ]
        ),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(suggestionList[index]['country'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10),),
                  Image.network(suggestionList[index]['countryInfo']['flag'],height: 50,width: 60,),


                ],
              ),
            ),
            Expanded(child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Confirmed Cases:'+ suggestionList [index]['cases'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                  Text('Active Cases:'+ suggestionList [index]['active'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                  Text('Recovered:'+ suggestionList [index]['recovered'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                  Text('Total Deaths:'+ suggestionList [index]['deaths'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),)
                ],
              ),
            ),),
          ],
        ),
      );
    },
    );
  }

}