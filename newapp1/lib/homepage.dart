import 'dart:convert';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:newapp1/datasource.dart';
import 'package:newapp1/pages/districtpage.dart';
import 'package:newapp1/pages/statepage.dart';
import 'package:newapp1/panels/Indiapanel.dart';
import 'package:http/http.dart' as http;
import 'package:newapp1/panels/infoPanel.dart';
import 'package:newapp1/panels/mostaffectedstates.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Map IndiaData;
  fetchIndiaData()async{
    http.Response response = await http.get('https://api.covidindiatracker.com/total.json');
    setState(() {
      IndiaData = jsonDecode(response.body);
      
    });
  }
   List StateData;
  fetchStateData()async{
    http.Response response = await http.get('https://api.covidindiatracker.com/state_data.json?');
    setState(() {
      StateData = jsonDecode(response.body);
      
    });
  } 
   @override
  void initState() {
    fetchIndiaData();
    fetchStateData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
         IconButton(
        icon: Icon(Theme.of(context).brightness==Brightness.light?Icons.lightbulb_outline:Icons.highlight),
         onPressed: (){
          DynamicTheme.of(context).setBrightness(Theme.of(context).brightness == Brightness.dark? Brightness.light: Brightness.dark);
         }
         ),
        ],
        centerTitle: false,
        title: Text('COVID_19 TRACKER'),
      ),
      body: SingleChildScrollView(
  child: Column(
crossAxisAlignment: CrossAxisAlignment.start,  
  children: <Widget>[
  Container(
     height: 80,
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      color: Colors.yellow[100],
      child: Text(DataSource.Quote,style: TextStyle(color: Colors.yellow[800],fontWeight: FontWeight.bold,fontSize: 16)),
  ),
  Padding(
     padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
     child:
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[       
        Text('India',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>StatePage()));
            },
                      child: Container(
              decoration: BoxDecoration(
                color: primaryBlack,
                borderRadius: BorderRadius.circular(15)
              ) ,
              padding: EdgeInsets.all(10),
              child: Text('State',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.white),)),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>DistrictPage()));
            },
                      child: Container(
              decoration: BoxDecoration(
                color: primaryBlack,
                borderRadius: BorderRadius.circular(15)
              ) ,
              padding: EdgeInsets.all(10),
              child: Text('District',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.white),)),
          ),
      


        ],
      ),
   ),
  
      IndiaData==null?CircularProgressIndicator():IndiaPanel(IndiaData: IndiaData,),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal:10.0),
        child: Text("Most Affected States",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
      ),
     SizedBox(height: 10,),
     StateData==null?Container():MostAffectedPanel(StateData: StateData,),
     InfoPanel(),
     SizedBox(height: 20,),
     Center(child: Text('TOGETHER WE CAN WIN THIS FIGHT',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)),
     SizedBox(height: 20,),
      Center(child: Text("REACH ME ON:",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,))),
           SizedBox(height: 10,),
           Row( 
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               IconButton(
                 icon: FaIcon(FontAwesomeIcons.instagram), 
                 onPressed: (){
                   launch("https://instagram.com/dharsha_nivi?igshid=y4ai5ke6l3y9");
                 }
                 ),
               IconButton(
                 icon: FaIcon(FontAwesomeIcons.github), 
                 onPressed: (){
                   launch("https://github.com/NivethaKS-18");
                 }
                 ),
               IconButton(
                 icon: Icon(Icons.mail), 
                 onPressed: (){
                   launch("mailto: dharshanivi17@gmail.com");
                 }
                 ), 
             ],
           ),
           SizedBox(height: 20,),

],
),
      ),

    );
  
  }
}
