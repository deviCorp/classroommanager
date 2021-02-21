import 'dart:convert';
import 'package:classroommanager/models/subject.dart';
import 'package:flutter/services.dart';

class SubjectProvider {
  final String _dataPath = "assets/subjects.json";
  List<Subject> subjects;

  Future<List<Subject>> loadSubjectData( ) async {
    try {
      var dataString = await loadAsset();
      Map<String, dynamic> jsonSubData = jsonDecode(dataString);
      subjects = SubjectList.fromJson(jsonSubData['subjects']).subjects;
      print('done loading subjects!' + jsonEncode(subjects));
      return subjects;
    } catch (e) {
      print(e.toString());
    }
  }

  Future<String> loadAsset() async {
    return await Future.delayed(Duration(seconds: 5), () async {
      return await rootBundle.loadString(_dataPath);
    });
  }
}