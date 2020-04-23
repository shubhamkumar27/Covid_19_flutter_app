import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:covid19/pages/Worldwide.dart';
import 'package:covid19/objects/Worlddata.dart';
import 'package:http/http.dart' as http;

class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  var _info;
  List _countries = [];
  HashMap _map = new HashMap<String, Country>();

  String url1 = "https://corona.lmao.ninja/countries?sort=deaths";
  String url = "https://corona.lmao.ninja/v2/countries?sort=deaths";
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

  @override
  void initState() {
    super.initState();
    fetchdata().then((value){
      for (var i=0; i<value.length; i++) {
        List l = value[i].name.toString().split(",");
        value[i].name = l[0];
        _countries.add(value[i].name.toString());
        _map[value[i].name.toString()] = value[i];
      }
      fetchall('https://corona.lmao.ninja/v2/all').then((res){
        _info = jsonDecode(res.body.toString());
        Navigator.pushReplacement(context,MaterialPageRoute(
            builder: (context) => Worldwide(value: value, info: _info, countries: _countries,map: _map,)));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(0, 100, 0, 50),
                child: Image(
                  image: AssetImage('assets/images/covid.jpg'),
                ),
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                  children: <TextSpan> [
                    TextSpan(
                        text: 'STAY ',
                        style: TextStyle(color: Colors.white)),
                    TextSpan(
                        text: 'HOME  ',
                        style: TextStyle(color: Colors.blueAccent)),
                    TextSpan(
                        text: 'STAY ',
                        style: TextStyle(color: Colors.white)),
                    TextSpan(
                        text: 'SAFE',
                        style: TextStyle(color: Colors.green)),
                  ]
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
