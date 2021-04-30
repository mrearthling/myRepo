import 'package:flutter/material.dart';
import 'package:ogrenci_takip/models/exams.dart';

class ExamsAdd extends StatefulWidget {
  List<Exams> exams;

  ExamsAdd(List<Exams> exams) {
    this.exams = exams;
  }

  @override
  State<StatefulWidget> createState() {
    return _ExamsAddState(exams);
  }
}
//
class _ExamsAddState extends State {
  List<Exams> exams;
  var exam = new Exams.withoutInfo();
  var formKey = GlobalKey<FormState>();
  DateTime _dateTime = new DateTime.now();
  TimeOfDay _time = new TimeOfDay.now();

  _ExamsAddState(List<Exams> exams) {
    this.exams = exams;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Yeni Sınav Ekle"),
      ),
      body: Container(
        margin: EdgeInsets.all(25),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              buildExamNameField(),
              _buildTimeandDate(context),
              buildSumbitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildExamNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Sınav Adı:", hintText: "..."),
      validator: validateExamName,
      onSaved: (String value) {
        exam.examName = value;
      },
    );
  }

  Widget buildSumbitButton() {
    return RaisedButton(
      child: Text("Kaydet"),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          setState(() {
            exams.add(exam);
            Navigator.pop(context);
          });
        }
      },
    );
  }

  Future _selectdata(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context, initialDate: _dateTime, firstDate: new DateTime(2021), lastDate: new DateTime(2022));
    if (picked != null && picked != _dateTime) {
      print('Date Selected:${_dateTime.toString()}');
      setState(() {
        _dateTime = picked;
      });
    }
  }

  Future _selecttime(BuildContext context) async {
    TimeOfDay timeOfDay = await showTimePicker(context: context, initialTime: _time);
    if (timeOfDay != null && timeOfDay != true) {
      print("Time Selected ${_time.toString()}");
      setState(() {
        _time = timeOfDay;
      });
    }
  }

  Widget _buildTimeandDate(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(32.0),
      child: new Column(
        children: [
          new Text(
            'Tarih',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            textAlign: TextAlign.left,
          ),
          new RaisedButton(
              child: Text("Tarih belirleyiniz"),
              onPressed: () {
                _selectdata(context);
              }),
          Padding(
            padding: EdgeInsets.all(16),
          ),
          new Text(
            'Zaman',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            textAlign: TextAlign.left,
          ),
          new RaisedButton(
              child: new Text("Zaman belirleyiniz:"),
              onPressed: () {
                _selecttime(context);
              }),
        ],
      ),
    );
  }

  String validateExamName(String value) {
    if (value.length < 1) {
      return "Sınav adı boş bırakılamaz.";
    }
  }
}
