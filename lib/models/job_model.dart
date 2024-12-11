// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';
part 'job_model.g.dart';

@HiveType(typeId: 0)
class JobModel extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String description;

  @HiveField(2)
  String status;
  @HiveField(3)
  DateTime dateTime;
  JobModel(
      {required this.title,
      required this.description,
      required this.status,
      required this.dateTime});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'status': status,
      'dateTime': dateTime
    };
  }

  factory JobModel.fromMap(Map<String, dynamic> map) {
    return JobModel(
      title: map['title'] as String,
      description: map['description'] as String,
      status: map['status'] as String,
      dateTime: map['dateTime'] as DateTime,
    );
  }

  String toJson() => json.encode(toMap());

  factory JobModel.fromJson(String source) =>
      JobModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
