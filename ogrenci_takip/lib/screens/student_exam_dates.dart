import 'package:flutter/material.dart';
import 'package:ogrenci_takip/models/exams.dart';
import 'package:ogrenci_takip/screens/exams_add.dart';
//
class OgrenciSinavTakvimi extends StatefulWidget {
  @override
  _OgrenciSinavTakvimiState createState() => _OgrenciSinavTakvimiState();
}

class _OgrenciSinavTakvimiState extends State<OgrenciSinavTakvimi> {
  static DateTime dateTime;
  static TimeOfDay timeOfDay;

  @override
  void initState() {
    super.initState();
    setState(() {
      asyncMethod();
    });
  }

  void asyncMethod() async {
    dateTime = await DateTime.now();
    timeOfDay = await TimeOfDay.now();
    debugPrint("$dateTime");
  }

  List<Exams> exams = [
    Exams.withId(1, "C#", dateTime, timeOfDay),
    Exams.withId(2, "Nesneye Yönelik Programlama", dateTime, timeOfDay),
    Exams.withId(3, "Mobil Programlama", dateTime, timeOfDay),
    Exams.withId(4, "Kriptoloji", dateTime, timeOfDay),
  ];
  Exams selectedExams = Exams.withId(1, "ss", null, null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Sınav Takvimi Oluştur"),
      ),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: <Widget>[
            Expanded(
                child: ListView.builder(
                    itemCount: exams.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: Icon(Icons.date_range),
                        title: Text(exams[index].examName),
                        subtitle: Text("Sınav Tarihi : " + exams[index].examDate.toString()),
                      );
                    })),
            Row(
              children: <Widget>[
                Flexible(
                  fit: FlexFit.tight,
                  flex: 3,
                  child: RaisedButton(
                    color: Colors.purple,
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ExamsAdd(exams)))
                            .then((value) => setState(() {}));
                      });
                    },
                  ),
                ),

              ],
            ),
          ],
        ),
      ],
    );
  }
}
