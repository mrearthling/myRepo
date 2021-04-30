//Öğrenci bilgileri dart kodu
class Student {
  int id;
  String firstName;
  String lastName;
  int grade;
  String _status;

  Student.withId(int id, String firsName, String lastName, int grade) {
    this.id = id;
    this.firstName = firsName;
    this.lastName = lastName;
    this.grade = grade;
  }

  Student(String firsName, String lastName, int grade) {
    this.firstName = firsName;
    this.lastName = lastName;
    this.grade = grade;
  }

  Student.withoutInfo() {}

  String get getStatus {
    if (this.grade >= 60) {
      _status = "Dersten Geçti";
    } else if (this.grade >= 45) {
      _status = "Şartlı geçer";
    } else {
      _status = "Dersten Kaldı";
    }
    return _status;
  }
}