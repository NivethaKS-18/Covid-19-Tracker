import 'package:flutter/material.dart';



 
class IndiaPanel extends StatelessWidget {
    final Map IndiaData;
    const IndiaPanel({Key key, this.IndiaData}) : super(key: key);
 

    @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 2),
        children: <Widget>[
          StatusPanel(
            title: 'CONFIRMED',
            panelColor: Colors.red[200],
            textColor: Colors.red,
            count: IndiaData['confirmed'].toString(),
          ),
          StatusPanel(
            title: 'ACTIVE',
            panelColor: Colors.blueAccent[100],
            textColor: Colors.blueAccent[400],
            count: IndiaData['active'].toString(),
          ),
          StatusPanel(
            title: 'RECOVERED',
            panelColor: Colors.green[200],
            textColor: Colors.green,
            count: IndiaData['recovered'].toString(),
          ),
          StatusPanel(
            title: 'DEATHS',
            panelColor: Colors.grey[400],
            textColor: Colors.grey[900],
            count: IndiaData['deaths'].toString(),
          ),
        ]
      ), 
     
    );
  }
}
class StatusPanel extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  const StatusPanel({Key key,this.panelColor,this.textColor,this.title,this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width= MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(8),
      height: 100,width: width/2,
      color: panelColor,
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color:textColor),),Text(count,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color:textColor),)],
      ),
    );
  }
}    