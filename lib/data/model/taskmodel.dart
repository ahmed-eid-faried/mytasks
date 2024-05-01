import 'package:mytasks/data/model/sub_tasks.dart';

class Task {
  String desc;
  bool isDone;
  int priority;
  DateTime? dateStart;
  DateTime? dateDeadline;
  List<SubTasksModel> subTasks;

  Task({
    required this.desc,
    required this.isDone,
    required this.priority,
    this.dateStart,
    this.dateDeadline,
    this.subTasks = const [],
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    final List<dynamic> subTasksJson = json['subTasks'] ?? [];
    final List<SubTasksModel> subTasks = subTasksJson.map((taskJson) {
      return SubTasksModel.fromJson(taskJson);
    }).toList();

    return Task(
      desc: json['desc'] ?? '',
      isDone: json['isDone'] ?? false,
      priority: json['priority'] ?? 0,
      dateStart:
          json['dateStart'] != null ? DateTime.parse(json['dateStart']) : null,
      dateDeadline: json['dateDeadline'] != null
          ? DateTime.parse(json['dateDeadline'])
          : null,
      subTasks: subTasks,
    );
  }

  Map<String, dynamic> toJson() {
    final List<Map<String, dynamic>> subTasksJson = subTasks.map((subTask) {
      return subTask.toJson();
    }).toList();

    return {
      'desc': desc,
      'isDone': isDone,
      'priority': priority,
      'dateStart': dateStart?.toIso8601String(),
      'dateDeadline': dateDeadline?.toIso8601String(),
      'subTasks': subTasksJson,
    };
  }

  int get length {
    return subTasks.isEmpty ? 1 : subTasks.length;
  }

  int get lengthOfDone {
    int lengthOfDonenum = 0;

    if (subTasks.isNotEmpty) {
      for (var element in subTasks) {
        if (element.isDone == true) {
          lengthOfDonenum++;
        }
      }
    } else {
      if (isDone == true) {
        return 1;
      }
    }

    return lengthOfDonenum;
  }

  bool get isDoneValue {
    if (lengthOfDone == length) {
      return true;
    }
    if (lengthOfDone == 0) {
      if (isDone) {
        return true;
      } else {
        return false;
      }
    } else {
      if (isDone) {
        return true;
      } else {
        if (length != 0) {
          return false;
        } else {
          return false;
        }
      }
    }
  }

  double get currentValue {
    if (lengthOfDone == length) {
      return 1;
    }
    if (lengthOfDone == 0) {
      if (isDone) {
        return 1;
      } else {
        return 0;
      }
    } else {
      if (isDone) {
        return 1;
      } else {
        if (length != 0) {
          return lengthOfDone / length;
        } else {
          return 0;
        }
      }
    }
  }

  void changeState(bool? state) {
    isDone = !isDone;
  }

  void increasePriority() {
    priority++;
  }

  void decreasePriority() {
    if (priority > 0) {
      priority--;
    }
  }

  factory Task.fromSubTasksModel(SubTasksModel subTasksModel) {
    return Task(
      desc: subTasksModel.desc,
      isDone: subTasksModel.isDone,
      priority: subTasksModel.priority,
      dateStart: subTasksModel.dateStart,
      dateDeadline: subTasksModel.dateDeadline,
      subTasks: [],
    );
  }
}

// Task getItemFromIndices(List<int> indices) {
//   indices.removeAt(0);
//   Task currentTask = this;

//   for (final index in indices) {
//     if (index < 0 || index >= currentTask.subTasks.length) {
//       return currentTask;
//     }
//     currentTask = currentTask.subTasks[index];
//   }

//   return currentTask;
// }

// void addSubtaskByIndices(List<int> indices, Task subtask) {
//   Task currentTask = this;
//   Map<String, dynamic> currentTaskMap = toJson();
//   for (int index = 0; index < indices.length; index++) {
//     currentTaskMap['subTasks'][index];

//     // if (index >= 0 && index < currentTask.subTasks.length) {
//     //   currentTask = currentTask.subTasks[index];
//     // } else {
//     //   // Handle the case where the index is out of bounds
//     //   return;
//     // }
//   }

//   // Add the subtask to the current task
//   currentTask.subTasks.add(subtask);
// }

// // void addSubtaskByIndices(List<int> indices, Task subtask) {
// //   indices.removeAt(0);
// //   Task currentTask = this;
// //   for (int i = 0; i < indices.length - 1; i++) {
// //     final index = indices[i];
// //     if (index < 0 || index >= currentTask.subTasks.length) {
// //       return;
// //     }
// //     currentTask = currentTask.subTasks[index];
// //   }
// //   final lastIndex = indices.last;
// //   if (lastIndex < 0 || lastIndex > currentTask.subTasks.length) {
// //     return;
// //   }
// //   currentTask.subTasks.insert(lastIndex, subtask);
// // }

// void removeSubtaskByIndices(List<int> indices) {
//   indices.removeAt(0);
//   Task currentTask = this;

//   for (int i = 0; i < indices.length - 1; i++) {
//     final index = indices[i];
//     if (index < 0 || index >= currentTask.subTasks.length) {
//       return;
//     }
//     currentTask = currentTask.subTasks[index];
//   }

//   final lastIndex = indices.last;
//   if (lastIndex < 0 || lastIndex >= currentTask.subTasks.length) {
//     return;
//   }

//   currentTask.subTasks.removeAt(lastIndex);
// }

// void changeStateByIndices(List<int> indices) {
//   indices.removeAt(0);
//   Task currentTask = this;

//   for (int i = 0; i < indices.length - 1; i++) {
//     final index = indices[i];
//     if (index < 0 || index >= currentTask.subTasks.length) {
//       return;
//     }
//     currentTask = currentTask.subTasks[index];
//   }

//   final lastIndex = indices.last;
//   if (lastIndex < 0 || lastIndex >= currentTask.subTasks.length) {
//     return;
//   }

//   currentTask.subTasks[lastIndex].isDone =
//       !currentTask.subTasks[lastIndex].isDone;
// }

// void increasePriorityByIndices(List<int> indices) {
//   indices.removeAt(0);
//   Task currentTask = this;

//   for (int i = 0; i < indices.length - 1; i++) {
//     final index = indices[i];
//     if (index < 0 || index >= currentTask.subTasks.length) {
//       return;
//     }
//     currentTask = currentTask.subTasks[index];
//   }

//   final lastIndex = indices.last;
//   if (lastIndex < 0 || lastIndex >= currentTask.subTasks.length) {
//     return;
//   }

//   currentTask.subTasks[lastIndex].priority++;
// }

// void decreasePriorityByIndices(List<int> indices) {
//   indices.removeAt(0);
//   Task currentTask = this;

//   for (int i = 0; i < indices.length - 1; i++) {
//     final index = indices[i];
//     if (index < 0 || index >= currentTask.subTasks.length) {
//       return;
//     }
//     currentTask = currentTask.subTasks[index];
//   }

//   final lastIndex = indices.last;
//   if (lastIndex < 0 || lastIndex >= currentTask.subTasks.length) {
//     return;
//   }

//   if (currentTask.subTasks[lastIndex].priority > 0) {
//     currentTask.subTasks[lastIndex].priority--;
//   }
// }
