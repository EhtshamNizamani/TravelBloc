import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:travelapp/model/data_model.dart';

class DataServices {
  String baseUrl = 'http://mark.bslmeiyu.com/api';

  Future<List<DataModel>> getInfo() async {
    String endPoint = '/getplaces';
    http.Response response = await http.get(Uri.parse(baseUrl + endPoint));

    try {
      if (response.statusCode == 200) {
        List<dynamic> list = jsonDecode(response.body);
        List<DataModel> data = list.map((e) {
          return DataModel.fromJson(e);
        }).toList();

        return data;
      }
      return <DataModel>[];
    } catch (e) {
      // ignore: avoid_print
      print(e);
      return <DataModel>[];
    }
  }
}
