import 'package:flutter/material.dart';
import 'package:ogrenci_takip/models/student.dart';
import 'package:ogrenci_takip/validation/student_validator';
//
class StudentEdit extends StatefulWidget {
  Student selectedStudent;
  StudentEdit(Student selectedStudent) {
    this.selectedStudent = selectedStudent;
  }
  @override
  State<StatefulWidget> createState() {
    return _StudentEdittate(selectedStudent);
  }
}
//
class _StudentEdittate extends State with StudentValidationMixin {
  Student selectedStudent;
  var formKey = GlobalKey<FormState>();

  _StudentEdittate(Student selectedStudent) {
    this.selectedStudent = selectedStudent;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      initialValue: selectedStudent.firstName,
      decoration:
      InputDecoration(labelText: "Öğrenci Adı", hintText: "Mehmet"),
      validator: validateFirstName,
      onSaved: (String value) {
        selectedStudent.firstName = value;
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      initialValue: selectedStudent.lastName,
      decoration:
      InputDecoration(labelText: "Öğrenci Soyadı", hintText: "Nalbantoğlu"),
      validator: validateLastName,
      onSaved: (String value) {
        selectedStudent.lastName = value;
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      initialValue: selectedStudent.grade.toString(),
      decoration: InputDecoration(labelText: "Aldığı Not", hintText: "50"),
      validator: validateGrade,
      onSaved: (String value) {
        selectedStudent.grade = int.parse(value);
      },
    );
  }

  Widget buildSumbitButton() {
    return RaisedButton(
      child: Text("Kaydet"),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          saveStudent();
          Navigator.pop(context);
        }
      },
    );
  }

  void saveStudent() {
    print(selectedStudent.firstName);
    print(selectedStudent.lastName);
    print(selectedStudent.grade);
  }
}
