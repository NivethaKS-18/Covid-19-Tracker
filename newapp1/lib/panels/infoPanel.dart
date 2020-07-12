import 'package:flutter/material.dart';
import 'package:newapp1/datasource.dart';
import 'package:newapp1/pages/faqs.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPanel extends StatelessWidget {
  const InfoPanel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          GestureDetector(
             onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>FAQPage()));
             } ,         
             child: Container(
              padding: EdgeInsets.symmetric(horizontal:10,vertical:12),
              margin: EdgeInsets.symmetric(horizontal:10,vertical:5),
              color: primaryBlack,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('FAQS',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                  Icon(Icons.arrow_forward,color:Colors.white,),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              launch('https://www.pmcares.gov.in/en/web/contribution/donate_india');
            },
              child: Container(
              padding: EdgeInsets.symmetric(horizontal:10,vertical:12),
              margin: EdgeInsets.symmetric(horizontal:10,vertical:5),
              color: primaryBlack,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('DONATE',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                  Icon(Icons.arrow_forward,color:Colors.white,),
                ],
              ),
            ),
          ),   
          
             GestureDetector(
                onTap: (){
                  launch('https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters');
                },
              child: Container(
              padding: EdgeInsets.symmetric(horizontal:10,vertical:12),
              margin: EdgeInsets.symmetric(horizontal:10,vertical:8),
              color: primaryBlack,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('MYTH BUSTERS',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                  Icon(Icons.arrow_forward,color:Colors.white,),
                ],
              ),
          ),
         ),
        ]
      ), 
        );
      }
   }