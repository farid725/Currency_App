import 'dart:convert';

import 'package:currency_app/main_view_model/api_response.dart';
import 'package:currency_app/model/dollar_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class MainView extends ChangeNotifier {
  List<DollarRate> currencyRate = [];
  ApiResponse apiResponse = ApiResponse.initial("Initial");

  ApiResponse get response {
    return apiResponse;
  }

  List<DollarRate> get currencies {
    return currencyRate;
  }

  Future<ApiResponse> fetch() async {
    try {
      String url = "https://nbu.uz/uz/exchange-rates/json/";
      Uri uri = Uri.parse(url);
      var response = await http.get(uri);
      var data2 = jsonDecode(response.body);
      List data = [];
      data2?.forEach((element) {
        currencyRate.add(DollarRate.fromJson(element));
      });
      data.add(data2);
      apiResponse = ApiResponse.succes(currencyRate);

    } catch (e) {
      print(e);
    }
    return apiResponse;
  }
}
