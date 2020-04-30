class Student {
  final int id;
  final String name;
  final int age;
  final String lang;

  Student({this.id, this.name, this.age, this.lang});

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      lang: json['lang'],
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'age': age,
    'lang': lang,
  };
}