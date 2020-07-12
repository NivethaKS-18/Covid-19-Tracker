import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:newapp1/homepage.dart';
import 'package:newapp1/datasource.dart';
void main(){
  runApp(Myapp());                 
       
}

class Myapp extends StatelessWidget {
  const Myapp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      data: (brightness){
        return ThemeData(
          primaryColor: primaryBlack,
          fontFamily: 'Circular',
          brightness: brightness ==Brightness.dark?Brightness.dark:Brightness.light,
          scaffoldBackgroundColor: brightness==Brightness.dark?Colors.blueGrey[900]:Colors.white
        );
      },
          themedWidgetBuilder: (context,theme){
            return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: theme,
            home: HomePage(),
           
               
         );
          },
           
    );
    }
}