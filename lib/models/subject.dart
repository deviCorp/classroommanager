import 'package:flutter/material.dart';

class Subject {
  final String subject;
  final bool organizer;
  final String classname;
  final String urlAvatar;

  const Subject(
    this.subject,
    this.organizer,
    this.classname,
    this.urlAvatar,
  );

  Subject.fromJson(Map<String, dynamic> json):
        this.subject = json['subject'],
        this.organizer = json['organizer'],
        this.classname = json['classname'],
        this.urlAvatar = json['urlAvatar'];

  Map<String, dynamic> toJson() => {
    "subject": this.subject,
    "organizer": this.organizer,
    "classname": this.classname,
    "urlAvatar": this.urlAvatar
  };
}

class SubjectList {
  final List<Subject> subjects;
  SubjectList(this.subjects);

  SubjectList.fromJson(List<dynamic> subJson) :
        subjects = subJson.map((sub) => Subject.fromJson(sub)).toList();
}