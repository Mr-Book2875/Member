class Data_select {
  int status;
  List<DataRows> dataRows;

  Data_select({this.status, this.dataRows});

  Data_select.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data_rows'] != null) {
      dataRows = new List<DataRows>();
      json['data_rows'].forEach((v) {
        dataRows.add(new DataRows.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.dataRows != null) {
      data['data_rows'] = this.dataRows.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataRows {
  String id;
  String name;
  String address;
  String tel;
  String mail;

  DataRows({this.id, this.name, this.address, this.tel, this.mail});

  DataRows.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    tel = json['tel'];
    mail = json['mail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['tel'] = this.tel;
    data['mail'] = this.mail;
    return data;
  }
}
