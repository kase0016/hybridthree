import 'dart:convert';

class Student {
  List<Map<String, String>> people;

  Student(this.people);

  void output() {
    for (var student in people) {
      print(student);
    }
  }

  void plus(Map<String, String> person) {
    people.add(person);
  }

  void remove(String field) {
    people.removeWhere((student) => student['name'] == field);
  }

  void sort(String field) {
    people.sort((a, b) => a[field]!.compareTo(b[field]!));
  }
}

void main() {
  String json = '''[
  {"first":"Steve", "last":"Griffith", "email":"griffis@algonquincollege.com"},
  {"first":"Adesh", "last":"Shah", "email":"shaha@algonquincollege.com"},
  {"first":"Tony", "last":"Davidson", "email":"davidst@algonquincollege.com"},
  {"first":"Adam", "last":"Robillard", "email":"robilla@algonquincollege.com"}
]''';

  // Convert the JSON string into a List<Map<String, String>>
  List<dynamic> jsonData = jsonDecode(json);
  List<Map<String, String>> studentsList = List<Map<String, String>>.from(
      jsonData.map((item) => Map<String, String>.from(item)));

  // Pass the List<Map<String, String>> to the Students class constructor
  Student students = Student(studentsList);

  // Call the sort method to sort by first name
  students.sort("first");
  print("\n");
  students.output();

  // Call the plus method to add a new student
  students.plus({
    "first": "Emily",
    "last": "Johnson",
    "email": "johnsoe@algonquincollege.com"
  });
  print("\n");
  students.output();

  // Call the remove method to remove a student by first name
  students.remove("Steve");
  print("\n");
  students.output();
}
