import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ogrenci_takip/models/exams.dart';
import 'package:ogrenci_takip/models/student.dart';
import 'package:ogrenci_takip/screens/student_add.dart';
import 'package:ogrenci_takip/screens/student_edit.dart';
import 'package:ogrenci_takip/screens/student_exam_dates.dart';
import 'package:ogrenci_takip/screens/notes.dart';
import 'package:ogrenci_takip/screens/drawers/createDrawer.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String mesaj = "";

  Student selectedStudent = Student.withId(0, "", "", 0);

  List<Student> students = [
    Student.withId(1, "Mehmet", "Nalbantoğlu", 100),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: navigationDrawer(),
      //backgroundColor: Colors.greenAccent,
      appBar: AppBar(
//leading: NavigationToolbar(leading: buildBody(context),middle:OgrenciSinavTakvimi(),trailing: TodoList(),),
        title: Text("Öğrenci Takip Sistemi"),
      ),
      body: buildBody(context),
    );
  }

  void mesajGoster(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      title: Text("Silindi"),
      content: Text(mesaj),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget buildBody(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: NetworkImage("https://cdn.pixabay.com/photo/2014/04/03/11/47/person-312160_960_720.png"),
        )),
        child: Column(
          children: <Widget>[
            Expanded(
                child: ListView.builder(
                    itemCount: students.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage("https://cdn.pixabay.com/photo/2014/04/03/10/25/reading-310397_960_720.png"),
                        ),
                        title: Text(students[index].firstName + " " + students[index].lastName),
                        subtitle: Text("Sınavdan alınan not : " +
                            students[index].grade.toString() +
                            " [" +
                            students[index].getStatus +
                            "] "),
                        trailing: buildStatusIcon(students[index].grade),
                        onTap: () {
                          //Build işlemini çalıştırıp içindeki kodu kim kullanıyorsa yeniden çalıştırır.
                          setState(() {
                            selectedStudent = students[index];
                          });
                          print(selectedStudent.firstName + " " + selectedStudent.lastName);
                        },
                      );
                    })),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.purple,
                    child: Text(
                      "Takvim oluştur", /*style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color:
                        Colors
                        .lightBlue),*/
                    ),
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => OgrenciSinavTakvimi(),
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  RaisedButton(
                    color: Colors.purple,
                    child: Text("   Not Defteri   "),
                    onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => TodoList())),
                  ),
                ],
              ),
            ),
            Text(
              "Secili Ogrenci : " + selectedStudent.firstName + " " + selectedStudent.lastName,
              style: TextStyle(fontSize: 22, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
            ),
            Row(
              children: <Widget>[
                Flexible(
                  fit: FlexFit.tight,
                  flex: 3,
                  child: RaisedButton(
                    color: Colors.orange,
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 20,
                        ),
                        Icon(Icons.add),
                        SizedBox(
                          width: 20.0,
                        ),
                        Text("Ekle"),
                      ],
                    ),
                    onPressed: () {
                      setState(() {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => StudentAdd(students)))
                            .then((value) => setState(() {}));
                      });
                    },
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 3,
                  child: RaisedButton(
                    color: Colors.orange,
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.update),
                        SizedBox(
                          width: 20.0,
                        ),
                        Text("Güncelle"),
                      ],
                    ),
                    onPressed: () {
                      setState(() {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => StudentEdit(selectedStudent)))
                            .then((value) => setState(() {}));
                      });
                    },
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 3,
                  child: RaisedButton(
                    color: Colors.orange,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Icon(Icons.delete),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Sil"),
                      ],
                    ),
                    onPressed: () {
                      setState(() {
                        students.remove(selectedStudent);
                      });
                      var mesaj = "Silindi : " + selectedStudent.firstName + " " + selectedStudent.lastName;
                      mesajGoster(context, mesaj);
                    },
                  ),
                )
              ],
            ),
          ],
        ));
    debugPrintThrottled(mesaj);
  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 60) {
      return Icon(Icons.done);
    } else if (grade >= 45) {
      return Icon(Icons.refresh);
    } else {
      return Icon(Icons.clear);
    }
  }
}

class app extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'NavigationDrawer Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: homePage(),
      routes: {
        pageRoutes.home: (context) => homePage(),
        pageRoutes.contact: (context) => contactPage(),
        pageRoutes.event: (context) => eventPage(),
        pageRoutes.profile: (context) => profilePage(),
        pageRoutes.notification: (context) => notificationPage(),
      },
    );
  }
}
