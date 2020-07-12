import 'package:flutter/material.dart';
class MostAffectedPanel extends StatelessWidget {
  final List StateData;
  const MostAffectedPanel({Key key, this.StateData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context,index){
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
        child: Row(children: <Widget>[
        Icon(Icons.map),
        SizedBox(width:10,),
        Text(StateData[index]['state'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
        Icon(Icons.account_box,size:16,),
        SizedBox(width:10,),
        Text('Confirmed:' + StateData[index]['confirmed'].toString(),style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 18),), 
        ],    
      ), 
     );
    },
      itemCount: 5,
  ),);
  }
}