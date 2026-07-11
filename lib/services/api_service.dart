import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {

  // Flutter Web (Chrome)
  static const String baseUrl = "http://127.0.0.1:8000";

  Future<Map<String, dynamic>> predict({
    required int age,
    required double bloodPressure,
    required double bloodSugar,
    required double serumCreatinine,
    required bool hypertension,
  }) async {

    final url = Uri.parse("$baseUrl/predict");


    final response = await http.post(
      url,

      headers: {
        "Content-Type": "application/json",
      },

      body: jsonEncode({

        "age": age,

        "bp": bloodPressure,

        "sg": 1.020,

        "al": 1,

        "su": 0,

        "rbc": "normal",

        "pc": "normal",

        "pcc": "notpresent",

        "ba": "notpresent",

        "bgr": bloodSugar,

        "bu": 30,

        "sc": serumCreatinine,

        "sod": 140,

        "pot": 4.5,

        "hemo": 15,

        "pcv": 44,

        "wc": 7800,

        "rc": 5.2,

        "htn": hypertension ? "yes" : "no",

        "dm": "yes",

        "cad": "no",

        "appet": "good",

        "pe": "no",

        "ane": "no"

      }),
    );

    if (response.statusCode == 200) {

      return jsonDecode(response.body);

    } else {

      throw Exception("Prediction Failed");

    }
  }
}