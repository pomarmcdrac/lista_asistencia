// To parse this JSON data, do
//
//     final isTure = isTureFromJson(jsonString);

import 'dart:convert';

class IsTrue {
    IsTrue({
        required this.isTrue,
    });

    final bool isTrue;

    factory IsTrue.fromRawJson(String str) => IsTrue.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory IsTrue.fromJson(Map<String, dynamic> json) => IsTrue(
        isTrue: json["isTrue"],
    );

    Map<String, dynamic> toJson() => {
        "isTrue": isTrue,
    };
}
