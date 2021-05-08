import 'package:flutter/material.dart';

 
class DetailData extends StatefulWidget {
final  name;
final  address;
final  tel;
final  mail;
  DetailData({
    Key key,
    @required this.name,
    this.address,
    this.tel,
    this.mail, 
  }) : super(key: key);
  @override
  _DetailDataState createState() => _DetailDataState();
}

class _DetailDataState extends State<DetailData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'รายละเอียดข้อมูล',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 15,
          child: Padding(
            padding: const EdgeInsets.all(17.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/user.png',
                      width: 20,
                      height: 20,
                      fit: BoxFit.fill,
                    ),
                    Text(
                      '  ชื่อ-สกุล :',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      ' ${widget.name}',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                 Container(
                  height: 30,
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.grey[400]))),
                ),
               SizedBox(
                  height: 25,
                ),
                Row(
                  children: <Widget>[
                     Image.asset(
                      'assets/images/home.png',
                      width: 20,
                      height: 20,
                      fit: BoxFit.fill,
                    ),
                    Text(
                      '  ที่อยู่ :',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                     ' ${widget.address}',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
               Container(
                  height: 30,
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.grey[400]))),
                ),
               SizedBox(
                  height: 25,
                ),
                Row(
                  children: <Widget>[
                     Image.asset(
                      'assets/images/call.png',
                      width: 20,
                      height: 20,
                      fit: BoxFit.fill,
                    ),
                    Text(
                      '  เบอร์โทร :',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                       ' ${widget.tel}',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 30,
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.grey[400]))),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: <Widget>[
                     Image.asset(
                      'assets/images/gmail.png',
                      width: 20,
                      height: 20,
                      fit: BoxFit.fill,
                    ),
                    Text(
                      '  E-mail :',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                       ' ${widget.mail}',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 30,
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.grey[400]))),
                ),
              
              ],
            ),
          ),
        ),
      ),
    );
  }
}
