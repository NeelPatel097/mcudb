import 'package:mcuapp/data/models/mcu_model.dart';

class McuResultModel {
  List<McuModel> movies;

  McuResultModel({this.movies});

  McuResultModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      movies = new List<McuModel>();
      json['results'].forEach((v) {
        movies.add(McuModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.movies != null) {
      data['results'] = this.movies.map((v) => v.toJson()).toList();
    }
    return data;
  }
}