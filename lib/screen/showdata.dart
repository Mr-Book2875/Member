import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:infomation/model/data_row.dart';
import 'package:http/http.dart' as http;
import 'package:infomation/screen/detaildata.dart';

class ShowData extends StatefulWidget {
  @override
  _ShowDataState createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  List<DataRows> litems = [];

  @override
  void initState() {
    super.initState();
    loaddata();
  }

  loaddata() async {
    var body = json.encode({});
    var response = await http
        .post('https://ok4pp.com/app_member/selectdata.php', body: body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);

      if (data['status'] == 200) {
        var list = Data_select.fromJson(data);
        litems = list.dataRows;
      }
      setState(() {});
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'แสดงรายชื่อทั้งหมด',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
          itemCount: litems.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return Container(
              color: Colors.white,
              child: Column(
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailData(
                                name: litems[index].name,
                                address: litems[index].address,
                                tel: litems[index].tel,
                                mail: litems[index].mail,
                              ),
                            ));
                      },
                      child: Card(
                        elevation: 15,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(litems[index].name),
                                Image.asset(
                                'assets/images/user.png',
                                width: 20,
                                height: 20,
                                fit: BoxFit.fill,
                              ),
                            ],
                          ),
                        ),
                      ))
                ],
              ),
            );
          }),
    );
  }
}
