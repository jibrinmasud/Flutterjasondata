import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'datas.dart';
void main() {
  runApp(MaterialApp(
    home: JsonData(),
  ));
}


class JsonData extends StatefulWidget {
  @override
  _JsonDataState createState() => _JsonDataState();
}

class _JsonDataState extends State<JsonData> {

  Future<List<Data>> _getData() async{
    var udata = await http.get("http://www.json-generator.com/api/json/get/cenmoEIrtu?indent=2");
    var jsonData = json.decode(udata.body);
    List<Data> datas =[];

    for(var d in jsonData){
      Data data = Data();
      datas.add(data);
    }

    print(datas.length);
    //return datas;//
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('JsonData'),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: Container(
        child: FutureBuilder(
          future: _getData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Text("Loading"),
              );
            } else {
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(snapshot.data[index].name),
                  );
                },
                itemCount: snapshot.data.length,);
            }
          }
        ),
      ),

    );
  }
}
