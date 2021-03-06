import 'dart:convert';
import 'package:newapp1/pages/DistrictSubPage.dart';
import 'package:newapp1/pages/searchstate.dart';

import 'TnDistrict.dart';
import 'package:flutter/material.dart';
import 'services.dart';




class DistrictPage extends StatefulWidget {
  @override
  _DistrictPageState createState() => _DistrictPageState();
}

class _DistrictPageState extends State<DistrictPage> {
    
    List<TnDistrict> _DistrictData;
    bool _loading;

  @override
  void initState() { 
    super.initState();
    _loading=true;
    Services.getData().then((DistrictData){
      _DistrictData=DistrictData;
     setState(() {
       _DistrictData=DistrictData;
        _loading=false;
     });
    });
    
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search), 
            onPressed: (){
              showSearch(context: context, delegate: SearchState(_DistrictData));
            },
         ),
        ],
       title: Text("District Stats"),
      ),
      body: _loading?Center(child: CircularProgressIndicator(),):
      ListView.builder(
        itemCount: null==_DistrictData?0:_DistrictData.length,
        itemBuilder: (context, index) {
          TnDistrict data=_DistrictData[index];
           return ListTile(
             onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>DistrictSubPage(districtData: data.districtData,)));
             },
            title: Text(data.state,style: TextStyle(fontWeight: FontWeight.bold),),
            subtitle: Text(data.statecode,style: TextStyle(fontWeight: FontWeight.bold),),
          );
        },
        ),
    );
  }
}









