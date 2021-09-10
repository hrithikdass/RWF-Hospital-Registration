class DoctorResponseModel {
  bool? error;
  String? errmsg;
  List<Data>? data;

  DoctorResponseModel({this.error, this.errmsg, this.data});

  DoctorResponseModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    errmsg = json['errmsg'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['errmsg'] = this.errmsg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? duserid;
  String? doctorname;
  String? password;
  String? starttime;
  String? endtime;

  Data(
      {this.duserid,
      this.doctorname,
      this.password,
      this.starttime,
      this.endtime});

  Data.fromJson(Map<String, dynamic> json) {
    duserid = json['duserid'];
    doctorname = json['doctorname'];
    password = json['password'];
    starttime = json['starttime'];
    endtime = json['endtime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['duserid'] = this.duserid;
    data['doctorname'] = this.doctorname;
    data['password'] = this.password;
    data['starttime'] = this.starttime;
    data['endtime'] = this.endtime;
    return data;
  }
}
