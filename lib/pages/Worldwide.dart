import 'package:flutter/material.dart';
import 'package:covid19/pages/Listshow.dart';
import 'package:covid19/pages/Country.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:covid19/Dataloader.dart';


class Worldwide extends StatefulWidget {
  var value;
  var info;
  List countries;
  Map map;
  Worldwide({@required this.value, this.info, this.countries, this.map});

  @override
  _WorldwideState createState() => _WorldwideState();
}

class _WorldwideState extends State<Worldwide> {
  Router r = new Router();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var _pages = [
      Listshow(value: widget.value, info: widget.info,),
      Countrydata(value: widget.value, info: widget.info, countries: widget.countries, map: widget.map,),
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Container(),
        backgroundColor: Colors.black,
        title: Image(
          image: AssetImage('assets/images/image.png'),
          height: 52,
        ),
        actions: <Widget>[
          FlatButton(
            child: Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            onPressed: () => r.route(context),
          )
        ],
      ),
      body: _pages[index],
      bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            onTap: (i) {
              setState(() {
                index = i;
              });
            },
            backgroundColor: Colors.black,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.globe, color: Colors.white,),
                title: Text("World Report", style: TextStyle(color: Colors.white),)
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.solidMap, color: Colors.white,),
                title: Text("Country Report", style: TextStyle(color: Colors.white),)
              ),
            ]
          )
    );
  }
}
