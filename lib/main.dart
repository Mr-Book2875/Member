import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:infomation/screen/detaildata.dart';
import 'package:infomation/screen/showdata.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/data",
        routes: <String, WidgetBuilder>{
          "/data": (BuildContext context) => new Data(),
          "/showdata": (BuildContext context) => new ShowData(),
          "/detaildata": (BuildContext context) => new DetailData(),
        });
  }
}

class Data extends StatefulWidget {
  @override
  _DataState createState() => _DataState();
}

class _DataState extends State<Data> {
  TextEditingController _name = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _tel = TextEditingController();
  TextEditingController _mail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'กรอกข้อมูล',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _name,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'ชื่อ-สกุล',
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: _address,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'ที่อยู่',
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: _tel,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'เบอร์โทร',
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: _mail,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'E-mail',
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 50.0,
              width: 250,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
                onPressed: () async {
                 if(_name.text == '' || _address.text == '' || _tel.text == '' || _mail.text == ''   ){
                     Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ShowData()),
                      ); 
                 }else{
                   
            
                    FocusScope.of(context).unfocus();
                  var body = json.encode({
                    'name': _name.text,
                    'address': _address.text,
                    'tel': _tel.text,
                    'mail': _mail.text,
                  });
                  var response = await http.post(
                      'https://ok4pp.com/app_member/insertdata.php',
                      body: body);
                  if (response.statusCode == 200) {
                    var data = jsonDecode(response.body); 
                    print(data);
                    
                    if(data['status'] == 200){
                     _name.text = '';
                     _address.text = '';
                     _tel.text = '';
                     _mail.text = '';
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ShowData()),
                      ); 
                    }
                  } else {
                    throw Exception('Failed to load album');
                  }

                 }
                 
                },
                padding: EdgeInsets.all(10.0),
                color: Color.fromRGBO(0, 160, 227, 1),
                textColor: Colors.white,
                child: Text("Next", style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
