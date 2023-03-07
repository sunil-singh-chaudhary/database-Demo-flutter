class DB {
  String title;
  DB({required this.title});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
    };
  }

  DB.fromMap(Map<String, dynamic> json) : title = json['title'];
}
