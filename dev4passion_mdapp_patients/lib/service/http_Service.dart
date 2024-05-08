import 'dart:convert';

//import 'package:flutter/cupperting.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_easylading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;


class HttpService {

    static final _client = http.Client();

    // http://ec2-35-164-174-170.us-west-2.compute.amazonaws.com:5000/question

    static var _questionUrl = Uri.parse('http://ec2-35-164-174-170.us-west-2.compute.amazonaws.com:5000/question');

    static question(age, name, country, language, medical_history, details) async {

        http.Response response = await _client.post(_questionUrl, body: {
            'age': age,
            'name': name,
            'country': country,
            'language': language,
            'medical_history': medical_history,
            'details': details
        });

        if (response.statusCode == 200) {
            var json = jsonDecode(response.body);
            print(json);
        }

    }

}