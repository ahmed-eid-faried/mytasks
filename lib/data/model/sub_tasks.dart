import 'package:mytasks/data/model/taskmodel.dart';

class SubTasksModel {
  String desc;
  bool isDone;
  int priority;
  DateTime? dateStart;
  DateTime? dateDeadline;

  SubTasksModel({
    required this.desc,
    required this.isDone,
    required this.priority,
    this.dateStart,
    this.dateDeadline,
  });
  factory SubTasksModel.fromTask(Task subTasksModel) {
    return SubTasksModel(
      desc: subTasksModel.desc,
      isDone: subTasksModel.isDone,
      priority: subTasksModel.priority,
      dateDeadline: subTasksModel.dateDeadline,
      dateStart: subTasksModel.dateStart,
    );
  }
  factory SubTasksModel.fromJson(Map<String, dynamic> json) {
    return SubTasksModel(
      desc: json['desc'] ?? '',
      isDone: json['isDone'] ?? false,
      priority: json['priority'] ?? 0,
      dateStart:
          json['dateStart'] != null ? DateTime.parse(json['dateStart']) : null,
      dateDeadline: json['dateDeadline'] != null
          ? DateTime.parse(json['dateDeadline'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'desc': desc,
      'isDone': isDone,
      'priority': priority,
      'dateStart': dateStart?.toIso8601String(),
      'dateDeadline': dateDeadline?.toIso8601String(),
    };
  }

  double get currentValue {
    if (isDone) {
      return 1;
    } else {
      return 0;
    }
  }

  void changeState() {
    isDone = !isDone;
  }

  void changeStateTrue([bool state = true]) {
    isDone = state;
  }

  void changeStateFalse([bool state = false]) {
    isDone = state;
  }

  void increasePriority() {
    priority++;
  }

  void decreasePriority() {
    if (priority > 0) {
      priority--;
    }
  }
}
