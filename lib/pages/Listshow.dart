import 'package:flutter/material.dart';
import 'package:covid19/pages/Top_view.dart';

class Listshow extends StatefulWidget {
  var value;
  var info;
  Listshow({@required this.value, this.info});

  @override
  _ListshowState createState() => _ListshowState();
}

class _ListshowState extends State<Listshow> {
  @override
  Widget build(BuildContext context) {
    return Column(
    children: <Widget>[
      Container(
        height: 160,
        child: Top_bar(info: widget.info),
      ),

      Expanded(
        child : ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: widget.value.length,
          itemBuilder: ((context, i) {
            return Column(
              children: <Widget>[
                Container(
                  height: 100,
                child: Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        width : 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(29),
                          border: Border.all(
                          color: Colors.grey,
                          width: 2,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 27.0,
                          backgroundColor: Colors.transparent,
                          backgroundImage: NetworkImage(widget.value[i].flag),
                        )),
                      SizedBox(width: 5,),
                      Expanded(
                        child: Column(
                        children: <Widget>[
                          SizedBox(height: 10,),
                          Flexible(
                            child: Center(
                              child: Text(widget.value[i].name,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),),
                            ),
                          ),
                          SizedBox(height: 5,),
                          Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width*0.74,
                              color: Colors.grey[300],
                              height: 1,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              children: <Widget>[
                                Container(
                                    width: MediaQuery.of(context).size.width*0.25,
                                    child: Center(child: Text("Total cases", style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold
                                    ),))
                                ),
                                Container(
                                    width: MediaQuery.of(context).size.width*0.30,
                                    child: Center(child: Text("Deaths", style: TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold
                                    ),))
                                ),
                                Expanded(
                                  child: Center(child: Text("Recovered", style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold
                                  ),)),
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: <Widget>[
                                Container(
                                    width: MediaQuery.of(context).size.width*0.26,
                                    child: Center(child: Text(widget.value[i].cases.toString(), style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold
                                    ),))
                                ),
                                Container(
                                    width: MediaQuery.of(context).size.width*0.30,
                                    child: Center(child: Text(widget.value[i].deaths.toString(), style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold
                                    ),))
                                ),
                                Expanded(
                                  child: Center(child: Text(widget.value[i].recovered.toString(), style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold
                                  ),)),
                                )
                              ],
                            ),
                          ),
                        ],
                      ))
                    ],
                  ),
                ),
//                  decoration: BoxDecoration(
//                    border: Border.all(color: Colors.blueAccent),
//                    borderRadius: BorderRadius.circular(2),
//                    color: Colors.blue[100]
//                  ),
                ),
                SizedBox(height: 5,)
              ],
          );
        })
    ))
    ],
    );
  }
}
