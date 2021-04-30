//sınav bilgileri
import 'package:flutter/material.dart';

class Exams {
  int id;
  String examName;
  DateTime examDate;
  TimeOfDay examTime;

  Exams.withId(int id, String examName, DateTime examDate, TimeOfDay examTime) {
    this.id = id;
    this.examName = examName;
    this.examDate = examDate;
    this.examTime = examTime;
  }

  Exams(String examName, DateTime examDate, TimeOfDay examTime) {
    this.examName = examName;
    this.examDate = examDate;
    this.examTime = examTime;
  }

  Exams.withoutInfo() {}
}
