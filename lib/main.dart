import 'package:app_asistencia/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color.fromRGBO(60, 180, 229, 1)
    ));
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // showPerformanceOverlay: true,
      title: 'Asistencia',
      theme: ThemeData(fontFamily: 'Avenir'),
      initialRoute: HomeScreen.routerName,
      routes: {
        HomeScreen.routerName          :( _ ) => const HomeScreen(),
      },
      
    );
  }
  
}