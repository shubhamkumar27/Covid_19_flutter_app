import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:covid19/objects/Worlddata.dart';
import 'package:covid19/pages/Worldwide.dart';

class Router {
  var _info;
  List _countries = [];
  HashMap _map = new HashMap<String, Country>();

  String url = "https://corona.lmao.ninja/countries?sort=deaths";
  Future<List<Country>> fetchdata() async {
    http.Response response = await http.get(url);
    //String b = response.body.replaceAll('Iran, Islamic Republic of', 'Iran');
    List responseJson = jsonDecode(response.body);
    return responseJson.map((m) => new Country.fromJson(m)).toList();
  }

  Future<http.Response> fetchall(link) async {
    http.Response r =  await http.get(link);
    return r;
  }

  route (BuildContext context) {
    fetchdata().then((value){
      for (var i=0; i<value.length; i++) {
        List l = value[i].name.toString().split(",");
        value[i].name = l[0];
        _countries.add(value[i].name.toString());
        _map[value[i].name.toString()] = value[i];
      }
      fetchall('https://corona.lmao.ninja/all').then((res){
        _info = jsonDecode(res.body.toString());
        return Navigator.push(context,MaterialPageRoute(
            builder: (context) => Worldwide(value: value, info: _info, countries: _countries,map: _map,)));
      });
    });
  }

}