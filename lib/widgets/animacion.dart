
import 'package:flutter/material.dart';

class Animacion extends StatefulWidget {

  static const String routerName = 'Animacion';
   
  const Animacion({Key? key}) : super(key: key);

  @override
  State<Animacion> createState() => _AnimacionState();
}

class _AnimacionState extends State<Animacion> {

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image(
          height: 850,
          width: 400,
          image: AssetImage('assets/animacion.gif'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
  
  // double _width = 50;
  // double _height = 50;
  // Color _color = Colors.red;
  // BorderRadiusGeometry _borderRadius = BorderRadius.circular(10);

  // void changeShape() {

  //   final random = Random();
  //   _width = random.nextInt(300).toDouble() + 70;
  //   _height = random.nextInt(300).toDouble() + 70;
  //   _color = Color.fromRGBO(
  //     random.nextInt(255), 
  //     random.nextInt(255), 
  //     random.nextInt(255), 
  //     1
  //   );
  //   _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble() + 10 );

  //   setState(() {});
  // }

  // @override
  // Widget build(BuildContext context) {

  //   final Size size = MediaQuery.of(context).size;

  //   return Scaffold(
  //     body: Center(
  //        child: AnimatedContainer(
  //          width: _width,
  //          height: _height,
  //          decoration: BoxDecoration(
  //            color: _color,
  //            borderRadius: _borderRadius,
  //          ), 
  //          duration: const Duration( milliseconds: 500),
  //          curve: Curves.bounceIn,
  //        ),
  //     ),
  //     floatingActionButton: FloatingActionButton(
  //       child: const Icon( Icons.play_circle_outline_outlined, size: 50, ),
  //       onPressed: changeShape,
  //     ),
  //   );
  // }
}