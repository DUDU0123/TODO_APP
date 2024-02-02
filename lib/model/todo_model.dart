class TodoModel {
  final int? id;
  final String? todotext;
  TodoModel({
    this.id,
    this.todotext,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'todotext': todotext,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      id: map['id'],
      todotext: map['todotext'],
    );
  }
}
