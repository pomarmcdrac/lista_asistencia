// To parse this JSON data, do
//
//     final responseModel = responseModelFromJson(jsonString);
import 'dart:convert';

ResponseModel responseModelFromJson(String str) => ResponseModel.fromJson(json.decode(str));

String responseModelToJson(ResponseModel data) => json.encode(data.toJson());

class ResponseModel {
    ResponseModel({
        required this.datosBarrancas,
    });

    final List<DatosBarranca> datosBarrancas;

    factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        datosBarrancas: List<DatosBarranca>.from(json["datosBarrancas"].map((x) => DatosBarranca.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "datosBarrancas": List<dynamic>.from(datosBarrancas.map((x) => x.toJson())),
    };
}

class DatosBarranca {
    DatosBarranca({
        required this.id,
        required this.contrato,
        required this.nombre,
        required this.meta,
        this.acompanante,
        required this.tallaAf,
        this.tallaAco,
        required this.vueloIda,
        required this.vueloRegreso,
        required this.hotel1,
        required this.hotel2,
        required this.hotel3,
        required this.hotel4,
        required this.abordajeChepe,
        required this.checkIda,
        required this.checkRegreso,
    });

    final String id;
    final String contrato;
    final String nombre;
    final String meta;
    final String? acompanante;
    final String tallaAf;
    final String? tallaAco;
    final String vueloIda;
    final String vueloRegreso;
    final String hotel1;
    final String hotel2;
    final String hotel3;
    final String hotel4;
    final String abordajeChepe;
    final String checkIda;
    final String checkRegreso;

    factory DatosBarranca.fromJson(Map<String, dynamic> json) => DatosBarranca(
        id: json["_id"] ?? '',
        contrato: json["CONTRATO"] ?? '',
        nombre: json["NOMBRE"] ?? '',
        meta: json["META"] ?? '',
        acompanante: json["ACOMPANANTE"] ?? '',
        tallaAf: json["TALLA_AF"] ?? '',
        tallaAco: json["TALLA_ACO"] ?? '',
        vueloIda: json["VUELO_IDA"] ?? '',
        vueloRegreso: json["VUELO_REGRESO"] ?? '',
        hotel1: json["HOTEL_1"] ?? '',
        hotel2: json["HOTEL_2"] ?? '',
        hotel3: json["HOTEL_3"] ?? '',
        hotel4: json["HOTEL_4"] ?? '',
        abordajeChepe: json["ABORDAJE_CHEPE"] ?? '',
        checkIda: json["CHECK_IDA"] ?? '',
        checkRegreso: json["CHECK_REGRESO"] ?? '',
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "CONTRATO": contrato,
        "NOMBRE": nombre,
        "META": meta,
        "ACOMPANANTE": acompanante,
        "TALLA_AF": tallaAf,
        "TALLA_ACO": tallaAco,
        "VUELO_IDA": vueloIda,
        "VUELO_REGRESO": vueloRegreso,
        "HOTEL_1": hotel1,
        "HOTEL_2": hotel2,
        "HOTEL_3": hotel3,
        "HOTEL_4": hotel4,
        "ABORDAJE_CHEPE": abordajeChepe,
        "CHECK_IDA": checkIda,
        "CHECK_REGRESO": checkRegreso,
    };
}
