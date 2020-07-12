import 'dart:convert';
import 'search.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StatePage extends StatefulWidget {
  StatePage({Key key}) : super(key: key);

  @override
  _StatePageState createState() => _StatePageState();
}

class _StatePageState extends State<StatePage> {

   List StateData;
  fetchStateData()async{
    http.Response response = await http.get('https://api.covidindiatracker.com/state_data.json');
    setState(() {
      StateData = jsonDecode(response.body);
      
    });
  } 
  @override
  void initState() {
    fetchStateData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       actions: <Widget>[
         IconButton(icon: Icon(Icons.search),onPressed: (){

            showSearch(context: context, delegate: Search(StateData));

         },)
       ],
     title:Text('State Stats'),
     ),
   body: StateData==null?Center(child: CircularProgressIndicator(),): ListView.builder(
     
     itemBuilder: (context,index){
     return Card(
            child: Container(
         color: Colors.black26,     
         height: 130,
         margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
         
         child: Row(
         children: <Widget>[
           Container(
             
             width: 200,
             margin: EdgeInsets.symmetric(horizontal: 10,),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 Icon(Icons.place,size: 50,),
                 SizedBox(height: 7,),
                 Text(StateData[index]['state'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)
               ]
             )
           ),
           Expanded(child: Container(

             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children:<Widget>[
                 Text('CONFIRMED:' + StateData[index]['confirmed'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                 Text('ACTIVE:' + StateData[index]['active'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),),
                 Text('RECOVERED:' + StateData[index]['recovered'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),),
                 Text('DEATHS:' + StateData[index]['deaths'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).brightness==Brightness.light?Colors.grey[100]:Colors.grey[900]),),
               ]
             ),
           ),)
         ]
       ),
       ),
     );
   },
               itemCount: StateData==null?0:StateData.length,
         ),
   );
 }
}