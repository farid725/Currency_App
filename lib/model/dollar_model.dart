// To parse this JSON data, do
//
//     final dollarRate = dollarRateFromJson(jsonString);

import 'dart:convert';

DollarRate dollarRateFromJson(String str) =>
    DollarRate.fromJson(json.decode(str));

String dollarRateToJson(DollarRate data) => json.encode(data.toJson());

class DollarRate {
  DollarRate({
    required this.title,
    required this.code,
    required this.cbPrice,
    required this.nbuBuyPrice,
    required this.nbuCellPrice,
    required this.date,
  });

  String? title;
  String? code;
  String? cbPrice;
  String? nbuBuyPrice;
  String? nbuCellPrice;
  String? date;

  factory DollarRate.fromJson(Map<String, dynamic> json) => DollarRate(
        title: json["title"],
        code: json["code"],
        cbPrice: json["cb_price"],
        nbuBuyPrice: json["nbu_buy_price"],
        nbuCellPrice: json["nbu_cell_price"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "code": code,
        "cb_price": cbPrice,
        "nbu_buy_price": nbuBuyPrice,
        "nbu_cell_price": nbuCellPrice,
        "date": date,
      };
}
