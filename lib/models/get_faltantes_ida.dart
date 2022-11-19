// To parse this JSON data, do
//
//     final faltantesIda = faltantesIdaFromJson(jsonString);

import 'dart:convert';

class FaltantesIda {
    FaltantesIda({
        required this.faltantesIda,
    });

    final List<FaltantesIdaElement> faltantesIda;

    factory FaltantesIda.fromRawJson(String str) => FaltantesIda.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory FaltantesIda.fromJson(Map<String, dynamic> json) => FaltantesIda(
        faltantesIda: List<FaltantesIdaElement>.from(json["faltantesIda"].map((x) => FaltantesIdaElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "faltantesIda": List<dynamic>.from(faltantesIda.map((x) => x.toJson())),
    };
}

class FaltantesIdaElement {
    FaltantesIdaElement({
        required this.id,
        required this.contrato,
        required this.nombre,
        required this.meta,
        required this.tallaAf,
        required this.vueloIda,
        required this.vueloRegreso,
        required this.hotel1,
        required this.hotel2,
        required this.hotel3,
        required this.hotel4,
        required this.abordajeChepe,
        required this.checkIda,
        required this.checkRegreso,
        required this.acompanante,
        required this.tallaAco,
    });

    final String id;
    final String contrato;
    final String nombre;
    final String meta;
    final String tallaAf;
    final String vueloIda;
    final String vueloRegreso;
    final String hotel1;
    final String hotel2;
    final String hotel3;
    final String hotel4;
    final String abordajeChepe;
    final String checkIda;
    final String checkRegreso;
    String? acompanante;
    String? tallaAco;

    factory FaltantesIdaElement.fromRawJson(String str) => FaltantesIdaElement.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory FaltantesIdaElement.fromJson(Map<String, dynamic> json) => FaltantesIdaElement(
        id: json["_id"],
        contrato: json["CONTRATO"] ?? '',
        nombre: json["NOMBRE"] ?? '',
        meta: json["META"] ?? '',
        tallaAf: json["TALLA_AF"] ?? '',
        vueloIda: json["VUELO_IDA"] ?? '',
        vueloRegreso: json["VUELO_REGRESO"] ?? '',
        hotel1: json["HOTEL_1"] ?? '',
        hotel2: json["HOTEL_2"] ?? '',
        hotel3: json["HOTEL_3"] ?? '',
        hotel4: json["HOTEL_4"] ?? '',
        abordajeChepe: json["ABORDAJE_CHEPE"] ?? '',
        checkIda: json["CHECK_IDA"] ?? '',
        checkRegreso: json["CHECK_REGRESO"] ?? '',
        acompanante: json["ACOMPANANTE"] == null ? null : json["ACOMPANANTE"] ?? '',
        tallaAco: json["TALLA_ACO"] == null ? null : json["TALLA_ACO"] ?? '',
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "CONTRATO": contrato,
        "NOMBRE": nombre,
        "META": meta,
        "TALLA_AF": tallaAf,
        "VUELO_IDA": vueloIda,
        "VUELO_REGRESO": vueloRegreso,
        "HOTEL_1": hotel1,
        "HOTEL_2": hotel2,
        "HOTEL_3": hotel3,
        "HOTEL_4": hotel4,
        "ABORDAJE_CHEPE": abordajeChepe,
        "CHECK_IDA": checkIda,
        "CHECK_REGRESO": checkRegreso,
        "ACOMPANANTE": acompanante,
        "TALLA_ACO": tallaAco,
    };
}
