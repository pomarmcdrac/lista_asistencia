import 'dart:convert';

import 'package:app_asistencia/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:http/http.dart' as http;

import '../theme/app_theme.dart';

PageController _myPage = PageController(initialPage: 0);
final TextEditingController _controller = TextEditingController();
String _contrato = '';

class HomeScreen extends StatefulWidget {

  static const String routerName = 'Home';
   
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
  int indexPage = 0;

class _HomeScreenState extends State<HomeScreen> {

  String nombre = '';
  String acompa = '';
  bool isAcompa = false;
  bool isNombre = false;
  String? opcion;
  List<DatosBarranca> registros = [];

  @override
  void initState(){
    super.initState();
    _myPage = PageController(
      initialPage: 0,
      keepPage: true,
    );
    _controller.text = '';
  }

  @override
  Widget build(BuildContext context) {

    Future _scanCode() async {
      String result = await FlutterBarcodeScanner.scanBarcode( '#3D8BEF', 'Cancelar', false, ScanMode.QR);
      setState(() {
        _contrato = result;
        _controller.text = result;
      });
    }

    void datosAfiliadoContrato( BuildContext context) {
    showDialog(
      barrierDismissible: true,
      context: context, 
      builder: ( context ) {
        return AlertDialog(
          elevation: 5,
          title: const Text(
            'Datos del contrato',
            textAlign: TextAlign.center,
          ),
          titleTextStyle: const TextStyle(
            color: AppTheme.primary,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
          content: SizedBox(
            width: 300,
            height: 420,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Meta',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600]
                          ),
                        ),
                        Text(
                          registros[0].meta,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppTheme.primary,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Contrato',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600]
                          ),
                        ),
                        Text(
                          registros[0].contrato,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppTheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox( height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nombre',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600]
                            ),
                          ),
                          Text(
                            registros[0].nombre,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppTheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          'Clave',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600]
                          ),
                        ),
                        Text(
                          registros[0].tallaAf,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppTheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox( height: 5,),
                if(registros[0].acompanante != '')
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Acompañante',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600]
                            ),
                          ),
                          Text(
                            registros[0].acompanante!,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppTheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          'Clave',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600]
                          ),
                        ),
                        Text(
                          registros[0].tallaAco!,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppTheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox( height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Hotel 1',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600]
                          ),
                        ),
                        Text(
                          registros[0].hotel1,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppTheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox( height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Hotel 2',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600]
                          ),
                        ),
                        Text(
                          registros[0].hotel2,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppTheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox( height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Hotel 3',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600]
                          ),
                        ),
                        Text(
                          registros[0].hotel3,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppTheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox( height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Hotel 4',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600]
                          ),
                        ),
                        Text(
                          registros[0].hotel4,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppTheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox( height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Vuelo Ida',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600]
                          ),
                        ),
                        Text(
                          registros[0].vueloIda,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppTheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Vuelo Regreso',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600]
                          ),
                        ),
                        Text(
                          registros[0].vueloRegreso,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppTheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox( height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Abordo Autobus',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600]
                          ),
                        ),
                        Text(
                          registros[0].abordajeChepe,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppTheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox( height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Check Ida',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600]
                          ),
                        ),
                        Text(
                          registros[0].checkIda,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppTheme.primary,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Check Regreso',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600]
                          ),
                        ),
                        Text(
                          registros[0].checkRegreso,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppTheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), 
              child: const Text('Entendido')
            )
          ],
        );
      }
    );
  }

    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Lista de Asistencia',
        ),
        backgroundColor: AppTheme.primary,
        elevation: 3,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: size.height * 0.8,
          width: size.width,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                SizedBox(
                  width: size.width * 0.8,
                  height: 40,
                  child: DropdownButton(
                    underline: const SizedBox(),
                    value: opcion,
                    isExpanded: true,
                    icon: const Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: AppTheme.primary,
                      size: 30,
                    ),
                    style: const TextStyle(
                      color: AppTheme.primary,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                    hint: const Text(
                      'Elige el check-in...',
                      style: TextStyle(
                        color: AppTheme.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    items: <String>[
                      'Check-In Ida',
                      'Check-In Regreso'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                        opcion = newValue.toString();
                        opcion ??= null;
                      setState(() {
                      });
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: size.width * 0.4,
                      child: TextFormField(
                        controller: _controller,
                        decoration: _InputDecorations._authInputDecoration(
                          hintText: 'Buscar...',
                          labelText: 'Contrato'
                        ),
                        onChanged: (value) async {
                          setState(() {
                            _contrato = value;
                          });
                        },
                      ),
                    ),
                    Container(
                      width: size.width * 0.15,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppTheme.primary,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.3),
                          width: 2,
                        )
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.primary,
                          elevation: 2,
                          padding: const EdgeInsets.all(0),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        ),
                        onPressed: () async {
                          FocusManager.instance.primaryFocus?.unfocus();
                          if (opcion == 'Check-In Ida' || opcion == 'Check-In Regreso') {
                            await _scanCode();
                            if(_contrato != '-1' || _contrato != '') {
                              final List<DatosBarranca> respuesta = await getDatosPorContrato(_contrato);
                              registros = respuesta;
                              if(respuesta.isNotEmpty) {
                                setState(() {
                                  nombre = respuesta[0].nombre;
                                  acompa = respuesta[0].acompanante!;
                                  isAcompa = true;
                                  isNombre = true;
                                });
                              }
                            }
                          } 
                        }, 
                        child: const Icon(
                          Icons.qr_code_rounded,
                          color: Colors.white,
                          size: 30,
                        )
                      ),
                    ),
                    Container(
                      width: size.width * 0.2,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppTheme.primary,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.3),
                          width: 2,
                        )
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.primary,
                          elevation: 2,
                          padding: const EdgeInsets.all(0),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        ),
                        onPressed: () async {
                          FocusManager.instance.primaryFocus?.unfocus();
                          if (opcion == 'Check-In Ida' && _contrato.isNotEmpty || opcion == 'Check-In Regreso' && _contrato.isNotEmpty) {
                            final List<DatosBarranca> respuesta = await getDatosPorContrato(_contrato);
                            registros = respuesta;
                            if(respuesta.isNotEmpty) {
                              setState(() {
                                nombre = respuesta[0].nombre;
                                acompa = respuesta[0].acompanante!;
                                isAcompa = true;
                                isNombre = true;
                              });
                            }
                          }
                        }, 
                        child: const Text('Buscar')
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  height: size.height * 0.1,
                  width: size.width,
                  child: GestureDetector(
                    onTap: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      if(registros.isNotEmpty){
                        datosAfiliadoContrato(context);
                      }
                    },
                    child: Container(
                      height: size.height * 0.2,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Visibility(
                            visible: isNombre,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Afiliado',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  nombre,
                                  style: const TextStyle(
                                    color: AppTheme.primary,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Visibility(
                            visible: isAcompa,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Acompañante',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  acompa,
                                  style: const TextStyle(
                                    color: AppTheme.primary,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                    color: AppTheme.primary,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.3),
                      width: 2,
                    )
                  ),
                  height: 50,
                  width: size.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primary,
                      elevation: 2,
                      padding: const EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    ),
                    onPressed: () async {
                      if (opcion == 'Check-In Ida' && _contrato.isNotEmpty || opcion == 'Check-In Regreso' && _contrato.isNotEmpty) {
                        final List<DatosBarranca> respuesta = await getDatosPorContrato(_contrato);
                        if(respuesta.isNotEmpty) {
                          if(opcion == 'Check-In Ida') {
                            await updateIda(_contrato);
                            setState(() {
                              _controller.text = '';
                              const _RegistradosIda();
                            });
                          }
                          if(opcion == 'Check-In Regreso') {
                            await updateRegreso(_contrato);
                            setState(() {
                              _controller.text = '';
                              const _RegistradosRegreso();                      
                            });
                          }
                        }
                      }
                    }, 
                    child: const Text('Registrar')
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                  height: size.height * 0.38,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: PageView(
                    controller: _myPage,
                    onPageChanged: (value) {
                    },
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      if(opcion == 'Check-In Ida')
                      const _RegistradosIda(),
                      if(opcion == 'Check-In Regreso')
                      const _RegistradosRegreso(),
                      if(opcion == 'Check-In Ida')
                      const _NoRegistradosIda(),
                      if(opcion == 'Check-In Regreso')
                      const _NoRegistradosRegreso(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: AppTheme.primary,
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        child: SizedBox(
          height: size.height * 0.08,
          width: size.width,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
                width: size.width * 0.4,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primary.withOpacity(0.7),
                    elevation: 1,
                    padding: const EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  ),
                  child: const Text(
                    'Registrados',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _myPage.jumpToPage(0);
                    });
                  },
                ),
              ),
              SizedBox(
                height: 40,
                width: size.width * 0.4,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primary.withOpacity(0.7),
                    elevation: 1,
                    padding: const EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  ),
                  child: const Text(
                    'Pendientes',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _myPage.jumpToPage(1);
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class _RegistradosIda extends StatelessWidget {
  const _RegistradosIda({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<RegistradosIdaElement> registradosIda = [];

    return FutureBuilder(
      future: getRegistradosIda(),
      builder: (context, AsyncSnapshot<List<RegistradosIdaElement>> snapshot) {

        if(!snapshot.hasData ) return Container();
        
        registradosIda = snapshot.data!;

        if(registradosIda.isNotEmpty){
          return ListView.builder(
            itemCount: registradosIda.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: const BoxDecoration(
                  border: Border.symmetric(horizontal: BorderSide(width: 0.5, color: Colors.grey))
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      registradosIda[index].nombre,
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          registradosIda[index].contrato,
                          style: const TextStyle(
                            color: AppTheme.secondary,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          registradosIda[index].meta,
                          style: const TextStyle(
                            color: AppTheme.primary,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}
class _RegistradosRegreso extends StatelessWidget {
  const _RegistradosRegreso({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<RegistradosRegresoElement> registradosRegreso = [];

    return FutureBuilder(
      future: getRegistradosRegreso(),
      builder: (context, AsyncSnapshot<List<RegistradosRegresoElement>> snapshot) {

        if(!snapshot.hasData ) return Container();
        
        registradosRegreso = snapshot.data!;

        if(registradosRegreso.isNotEmpty) {

          return ListView.builder(
            itemCount: registradosRegreso.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: const BoxDecoration(
                  border: Border.symmetric(horizontal: BorderSide(width: 0.5, color: Colors.grey))
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      registradosRegreso[index].nombre,
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          registradosRegreso[index].contrato,
                          style: const TextStyle(
                            color: AppTheme.secondary,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          registradosRegreso[index].meta,
                          style: const TextStyle(
                            color: AppTheme.primary,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}

class _NoRegistradosIda extends StatelessWidget {
  const _NoRegistradosIda({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<FaltantesIdaElement> faltantesIda = [];

    return FutureBuilder(
      future: getFaltantesIda(),
      builder: (context, AsyncSnapshot<List<FaltantesIdaElement>> snapshot) {

        if(!snapshot.hasData ) return Container();
        
        faltantesIda = snapshot.data!;
        
        if(faltantesIda.isNotEmpty) {

          return ListView.builder(
            itemCount: faltantesIda.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: const BoxDecoration(
                  border: Border.symmetric(horizontal: BorderSide(width: 0.5, color: Colors.grey))
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      faltantesIda[index].nombre,
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          faltantesIda[index].contrato,
                          style: const TextStyle(
                            color: AppTheme.secondary,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          faltantesIda[index].meta,
                          style: const TextStyle(
                            color: AppTheme.primary,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}

class _NoRegistradosRegreso extends StatelessWidget {
  const _NoRegistradosRegreso({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<FaltantesRegresoElement> faltantesRegreso = [];

    return FutureBuilder(
      future: getFaltantesRegreso(),
      builder: (context, AsyncSnapshot<List<FaltantesRegresoElement>> snapshot) {

        if(!snapshot.hasData ) return Container();
        
        faltantesRegreso = snapshot.data!;

        if(faltantesRegreso.isNotEmpty) {
          
          return ListView.builder(
            itemCount: faltantesRegreso.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: const BoxDecoration(
                  border: Border.symmetric(horizontal: BorderSide(width: 0.5, color: Colors.grey))
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      faltantesRegreso[index].nombre,
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          faltantesRegreso[index].contrato,
                          style: const TextStyle(
                            color: AppTheme.secondary,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          faltantesRegreso[index].meta,
                          style: const TextStyle(
                            color: AppTheme.primary,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}

class _InputDecorations {

  static InputDecoration _authInputDecoration({
    required String hintText,
    required String labelText,
    IconData? prefixIcon
  }) {
    return InputDecoration(
      isDense: true,
      contentPadding: const EdgeInsets.all(5),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppTheme.primary.withOpacity(0.2),
          width: 1,
        )
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppTheme.primary.withOpacity(0.2),
          width: 1,
        )
      ),
      hintText: hintText,
      hintStyle: TextStyle(
        fontSize: 18,
        color: Colors.grey[500],
      ),
      labelText: labelText,
      labelStyle: TextStyle(
        fontSize: 18,
        color: Colors.grey[500],
      ),

      prefixIcon: prefixIcon != null
        ? Icon(prefixIcon, color: AppTheme.secondary.withOpacity(0.5),)
        : null
    );
  }
}

Future<List<DatosBarranca>> getDatosPorContrato(String numero) async {
  //https://sheloapp.herokuapp.com/sheloapp/api/barrancas/getBarrancasPorContrato
  const String baseUrl = 'sheloapp.herokuapp.com';
  const String segmento = '/sheloapp/api/barrancas/getBarrancasPorContrato';
  late List<DatosBarranca> datos = [];
  var url = Uri.https(baseUrl, segmento);
  final response = await http.post(url, body: {
    'contrato':	numero
  });
  Map<String, dynamic> valores = jsonDecode(response.body);
  final responseModel = ResponseModel.fromJson(valores);
  datos = responseModel.datosBarrancas;
  return datos;
}

Future<List<RegistradosIdaElement>> getRegistradosIda() async {
  //https://sheloapp.herokuapp.com/sheloapp/api/barrancas/getRegistradosIdaBarrancas
  const String baseUrl = 'sheloapp.herokuapp.com';
  const String segmento = '/sheloapp/api/barrancas/getRegistradosIdaBarrancas';
  late List<RegistradosIdaElement> datos = [];
  var url = Uri.https(baseUrl, segmento);
  final response = await http.get(url);

  Map<String, dynamic> valores = jsonDecode(response.body);
  final registradosIda = RegistradosIda.fromJson(valores);
  datos = registradosIda.registradosIda;
  return datos;
}
Future<List<RegistradosRegresoElement>> getRegistradosRegreso() async {
  //https://sheloapp.herokuapp.com/sheloapp/api/barrancas/getRegistradosRegresoBarrancas
  const String baseUrl = 'sheloapp.herokuapp.com';
  const String segmento = '/sheloapp/api/barrancas/getRegistradosRegresoBarrancas';
  late List<RegistradosRegresoElement> datos = [];
  var url = Uri.https(baseUrl, segmento);
  final response = await http.get(url);
  Map<String, dynamic> valores = jsonDecode(response.body);
  final registradosRegreso = RegistradosRegreso.fromJson(valores);
  datos = registradosRegreso.registradosRegreso;
  return datos;
}
Future<List<FaltantesIdaElement>> getFaltantesIda() async {
  //https://sheloapp.herokuapp.com/sheloapp/api/barrancas/getFaltantesIdaBarrancas
  const String baseUrl = 'sheloapp.herokuapp.com';
  const String segmento = '/sheloapp/api/barrancas/getFaltantesIdaBarrancas';
  late List<FaltantesIdaElement> datos = [];
  var url = Uri.https(baseUrl, segmento);
  final response = await http.get(url);
  Map<String, dynamic> valores = jsonDecode(response.body);
  final faltantesIda = FaltantesIda.fromJson(valores);
  datos = faltantesIda.faltantesIda;
  return datos;
}
Future<List<FaltantesRegresoElement>> getFaltantesRegreso() async {
  //https://sheloapp.herokuapp.com/sheloapp/api/barrancas/getFaltantesRegresoBarrancas
  const String baseUrl = 'sheloapp.herokuapp.com';
  const String segmento = '/sheloapp/api/barrancas/getFaltantesRegresoBarrancas';
  late List<FaltantesRegresoElement> datos = [];
  var url = Uri.https(baseUrl, segmento);
  final response = await http.get(url);
  Map<String, dynamic> valores = jsonDecode(response.body);
  final faltantesRegreso = FaltantesRegreso.fromJson(valores);
  datos = faltantesRegreso.faltantesRegreso;
  return datos;
}

Future updateIda(String numero) async {
  //https://sheloapp.herokuapp.com/sheloapp/api/barrancas/updateRegistroBarrancasIda
  const String baseUrl = 'sheloapp.herokuapp.com';
  const String segmento = '/sheloapp/api/barrancas/updateRegistroBarrancasIda';
  late bool datos = false;
  var url = Uri.https(baseUrl, segmento);
  final response = await http.post(url, body: {
    'contrato':	numero
  });
  Map<String, dynamic> valores = jsonDecode(response.body);
  final isTrue = IsTrue.fromJson(valores);
  datos = isTrue.isTrue;
  return datos;
}

Future<bool> updateRegreso(String numero) async {
  //https://sheloapp.herokuapp.com/sheloapp/api/barrancas/updateRegistroBarrancasRegreso
  const String baseUrl = 'sheloapp.herokuapp.com';
  const String segmento = '/sheloapp/api/barrancas/updateRegistroBarrancasRegreso';
  late bool datos = false;
  var url = Uri.https(baseUrl, segmento);
  final response = await http.post(url, body: {
    'contrato':	numero
  });
  Map<String, dynamic> valores = jsonDecode(response.body);
  final isTrue = IsTrue.fromJson(valores);
  datos = isTrue.isTrue;
  return datos;
}