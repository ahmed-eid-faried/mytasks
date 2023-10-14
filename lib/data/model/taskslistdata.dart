import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mytasks/core/constant/routes.dart';
import 'package:mytasks/data/model/sub_tasks.dart';
import 'package:mytasks/data/model/taskmodel.dart';

class TasksListData {
  TasksListData();

  final box = GetStorage();
  List<SubTasksModel> tasksListSubTasks = [];
  List<Task> tasksListTask = [];

  double _sliderValue = 0.0;

  void deleteAllDoneTasks({required bool subTasks}) async {
    int? indexOf = box.read('indexOf');
    if (subTasks == true) {
      if (indexOf != null && indexOf >= 0 && indexOf < tasksListTask.length) {
        var list = tasksListTask[indexOf].subTasks;
        for (int index = 0; index < list.length; index++) {
          if (list[index].isDone == true) {
            list.removeAt(index);
          }
        }
      }
    } else {
      for (int index = 0; index < tasksListTask.length; index++) {
        if (tasksListTask[index].isDone == true) {
          tasksListTask.removeAt(index);
        }
      }
      write(subTasks: subTasks);
      await box.write('indexOf', null);
    }
  }

  void deleteAllTasks({required bool subTasks}) async {
    int? indexOf = box.read('indexOf');
    if (indexOf != null && indexOf >= 0 && indexOf < tasksListTask.length) {
      subTasks == true
          ? tasksListTask[indexOf].subTasks.clear()
          : tasksListTask.clear();
      await write(subTasks: subTasks);
      await box.write('indexOf', null);
    }
  }

  Future<void> read() async {
    final tasksListMap = await box.read("TasksList") ?? [];
    tasksListTask.clear();
    for (var element in tasksListMap) {
      tasksListTask.add(Task.fromJson(element));
    }
    tasksListTask = tasksListTask.toSet().toList();
    int? indexOf = box.read('indexOf');
    if (indexOf != null && indexOf >= 0 && indexOf < tasksListTask.length) {
      tasksListSubTasks = tasksListTask[indexOf].subTasks;
    }
  }

  Future<void> write({required bool subTasks}) async {
    tasksListTask = tasksListTask.toSet().toList();
    sortTasksByPriority(subTasks: subTasks);
    final tasksListMap =
        tasksListTask.map((element) => element.toJson()).toList();
    await box.write("TasksList", tasksListMap);
  }

  Future<void> save(BuildContext context, Task task,
      {required bool subTasks}) async {
    await read();
    int? indexOf = box.read('indexOf');
    if (subTasks) {
      if (indexOf != null && indexOf >= 0 && indexOf < tasksListTask.length) {
        tasksListTask[indexOf].subTasks.add(SubTasksModel.fromTask(task));
      }
    } else {
      tasksListTask.add(task);
    }

    await write(subTasks: subTasks);
    // Navigate to the home screen and remove all previous routes
    Future.microtask(() {
      Navigator.of(context).pushNamedAndRemoveUntil(
        AppRoute.home,
        (route) => false, // This line removes all previous routes
      );
    });
  }

  void sortTasksByPriority({required bool subTasks}) {
    int? indexOf = box.read('indexOf');
    if (subTasks == true) {
      if (indexOf != null && indexOf >= 0 && indexOf < tasksListTask.length) {
        tasksListTask[indexOf]
            .subTasks
            .sort((a, b) => b.priority.compareTo(a.priority));
      }
    } else {
      tasksListTask.sort((a, b) => b.priority.compareTo(a.priority));
    }
  }

  Future<void> intialData({required bool subTasks}) async {
    await read();
    await write(subTasks: subTasks);
  }

  checkbox(int index, {required bool subTasks, bool? state}) async {
    int? indexOf = box.read('indexOf');
    if (subTasks == true) {
      if (indexOf != null && indexOf >= 0 && indexOf < tasksListTask.length) {
        if (index >= 0 && index < tasksListTask[indexOf].subTasks.length) {
          tasksListTask[indexOf].subTasks[index].changeState();
          if (tasksListTask[indexOf].lengthOfDone ==
              tasksListTask[indexOf].subTasks.length) {
            tasksListTask[indexOf].isDone = true;
          } else {
            tasksListTask[indexOf].isDone = false;
          }
        }
      }
    } else {
      if (index >= 0 && index < tasksListTask.length) {
        tasksListTask[index].changeState(state);
        var list = tasksListTask[index].subTasks;
        for (int i = 0; i < list.length; i++) {
          if (tasksListTask[index].isDone) {
            list[i].changeStateFalse(state!);
          } else {
            list[i].changeStateTrue(state!);
          }
        }
      }
    }
    await write(subTasks: subTasks);
  }

  increasePriority(int index, {required bool subTasks}) async {
    int? indexOf = box.read('indexOf');
    if (subTasks == true) {
      if (indexOf != null && indexOf >= 0 && indexOf < tasksListTask.length) {
        if (index >= 0 && index < tasksListTask[indexOf].subTasks.length) {
          tasksListTask[indexOf].subTasks[index].increasePriority();
        }
      }
    } else {
      if (index >= 0 && index < tasksListTask.length) {
        tasksListTask[index].increasePriority();
      }
    }

    if (index >= 0 && index < tasksListTask.length) {
      tasksListTask[index].increasePriority();
    }
    await write(subTasks: subTasks);
  }

  decreasePriority(int index, {required bool subTasks}) async {
    int? indexOf = box.read('indexOf');
    if (subTasks == true) {
      if (indexOf != null && indexOf >= 0 && indexOf < tasksListTask.length) {
        if (index >= 0 && index < tasksListTask[indexOf].subTasks.length) {
          tasksListTask[indexOf].subTasks[index].decreasePriority();
        }
      }
    } else {
      if (index >= 0 && index < tasksListTask.length) {
        tasksListTask[index].decreasePriority();
      }
    }

    if (index >= 0 && index < tasksListTask.length) {
      tasksListTask[index].decreasePriority();
    }
    await write(subTasks: subTasks);
  }

  deleteTasks(int index, {required bool subTasks}) async {
    int? indexOf = box.read('indexOf');
    if (subTasks == true) {
      if (indexOf != null && indexOf >= 0 && indexOf < tasksListTask.length) {
        tasksListTask[indexOf].subTasks.removeAt(index);
      }
    } else {
      tasksListTask.removeAt(index);
    }
    await write(subTasks: subTasks);
  }

  double get sliderValue => _sliderValue;

  resetSlider(double value, {required bool subTasks}) async {
    _sliderValue = value;
    await write(subTasks: subTasks);
  }
}
