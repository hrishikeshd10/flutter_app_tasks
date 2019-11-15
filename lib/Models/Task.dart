class Task {
  int id;
  String title;
  bool isDone;

  Task({this.id, this.title, this.isDone});

  factory Task.fromDatabaseJson(Map<String, dynamic> data) => Task(
      id: data['id'],
      title: data['title'],
      isDone: (data['isDone']) == 1 ? true : false);

  Map<String, dynamic> toDatabaseJSON() => {
        "id": this.id,
        "title": this.title,
        "isDone": (this.isDone) == true ? 1 : 0
      };
}
