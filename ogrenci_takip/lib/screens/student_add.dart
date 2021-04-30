import 'package:flutter/material.dart';
import 'package:ogrenci_takip/models/student.dart';
import 'package:ogrenci_takip/validation/student_validator';

class StudentAdd extends StatefulWidget {
  List<Student> students;
  StudentAdd(List<Student> students) {
    this.students = students;
  }
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(students);
  }
}
//
class _StudentAddState extends State with StudentValidationMixin {
  List<Student> students;
  var student = Student.withoutInfo();
  var formKey = GlobalKey<FormState>();

  _StudentAddState(List<Student> students) {
    this.students = students;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        appBar: AppBar(
        title: Text("Yeni Öğrenci Ekle"),
      ),
      body: Container(
        margin: EdgeInsets.all(25),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              buildFirstNameField(),
              buildLastNameField(),
              buildGradeField(),
              buildSumbitButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFirstNameField() {
    return TextFormField(
      decoration:
      InputDecoration(labelText: "Öğrenci Adı", hintText: "ad"),
      validator: validateFirstName,
      onSaved: (String value) {
        student.firstName = value;
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      decoration:
      InputDecoration(labelText: "Öğrenci Soyadı", hintText: "soyad"),
      validator: validateLastName,
      onSaved: (String value) {
        student.lastName = value;
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Aldığı Not", hintText: "0-100"),
      validator: validateGrade,
      onSaved: (String value) {
        student.grade = int.parse(value);
      },
    );
  }

  Widget buildSumbitButton() {
    return RaisedButton(
      child: Text("Kaydet"),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          students.add(student);
          saveStudent();
          Navigator.pop(context);
        }
      },
    );
  }

  void saveStudent() {
    print(student.firstName);
    print(student.lastName);
    print(student.grade);
  }
}