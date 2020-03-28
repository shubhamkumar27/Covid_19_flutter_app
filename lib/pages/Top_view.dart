import 'package:flutter/material.dart';

class Top_bar extends StatefulWidget {
  var info;
  Top_bar({@required this.info});

  @override
  _Top_barState createState() => _Top_barState();
}

class _Top_barState extends State<Top_bar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20)
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(height: 10,),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width*0.5,
              color: Colors.white,
              height: 1,
            ),
          ),
          SizedBox(height: 10,),
          Center(
            child: Text("Total Cases", style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 25,
                fontWeight: FontWeight.bold
            ),),
          ),
          Center(
            child: Text(widget.info['cases'].toString(), style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),),
          ),
          SizedBox(height: 20,),
          Row(
            children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width*0.5,
                  child: Center(child: Text("Total Deaths", style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                  ),))
              ),
              Expanded(
                child: Center(child: Text("Recovered", style: TextStyle(
                    color: Colors.green,
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                ),)),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width*0.5,
                  child: Center(child: Text(widget.info['deaths'].toString(), style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),))
              ),
              Expanded(
                child: Center(child: Text(widget.info['recovered'].toString(), style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),)),
              )
            ],
          ),
        ],
      ),
    );
  }
}

