import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mytasks/data/model/taskslistdata.dart';
import 'package:mytasks/view/screen/subtasks.dart';

abstract class TasksNotifier extends ChangeNotifier {
  intialData({required bool subTasks});
  void sortTasksByPriority({required bool subTasks});
  void checkbox(int index, {required bool subTasks});
  void increasePriority(int index, {required bool subTasks});
  void decreasePriority(int index, {required bool subTasks});
  void deleteTasks(BuildContext context, int index, {required bool subTasks});
  void goToSubTasks(int index, BuildContext context);
  void resetSlider(double value, {required bool subTasks});
}

class TasksNotifierImp extends TasksNotifier {
  TasksNotifierImp(this.tasksListData, {required bool subTasks}) {
    tasksListData = TasksListData();
    tasksListData.intialData(subTasks: subTasks);
  }
  final box = GetStorage();
  TasksListData tasksListData;
  // bool dismissed = false;

  @override
  intialData({required bool subTasks}) async {
    await tasksListData.intialData(subTasks: subTasks);
    notifyListeners();
  }

  @override
  void sortTasksByPriority({required bool subTasks}) {
    tasksListData.sortTasksByPriority(subTasks: subTasks);
    notifyListeners();
  }

  @override
  void checkbox(int index, {required bool subTasks, bool? state}) async {
    await tasksListData.checkbox(index, state: state, subTasks: subTasks);
    notifyListeners();
  }

  @override
  void increasePriority(int index, {required bool subTasks}) async {
    await tasksListData.increasePriority(index, subTasks: subTasks);
    notifyListeners();
  }

  @override
  void decreasePriority(int index, {required bool subTasks}) async {
    await tasksListData.decreasePriority(index, subTasks: subTasks);
    notifyListeners();
  }

  @override
  void deleteTasks(BuildContext context, int index,
      {required bool subTasks}) async {
    await tasksListData.deleteTasks(index, subTasks: subTasks);
    await tasksListData.intialData(subTasks: subTasks);
    // Navigator.of(context).pushReplacementNamed(AppRoute.home);
    // await tasksListData.dismissedFun();
    // ignore: use_build_context_synchronously
    // AwesomeDialog(
    //   context: context,
    //   dialogType: DialogType.error,
    //   animType: AnimType.rightSlide,
    //   title: 'Delete Task',
    //   desc: 'Are you sure you want to delete your task?',
    //   btnCancelOnPress: () {
    //     if (subTasks == true) {
    //       Navigator.of(context).pop();
    //     } else {
    //       Navigator.of(context).pushReplacementNamed(AppRoute.home);
    //     }
    //   },
    //   btnOkOnPress: () async {
    //     await tasksListData.deleteTasks(index, subTasks: subTasks);
    //     Navigator.of(context).pushReplacementNamed(AppRoute.home);
    //   },
    // ).show();
  }

  @override
  void goToSubTasks(int index, BuildContext context) {
    int? indexOf = index;
    box.write("indexOf", indexOf);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const SubTasks()));
    print("indexOf:- $indexOf ");
  }

// ///////////////////////////////////////////////////////////////////////////  //
// ///////////////////////////////////////////////////////////////////////////  //
// ///////////////////////////////////////////////////////////////////////////  //
// ///////////////////////////////////////////////////////////////////////////  //
  double get sliderValue => tasksListData.sliderValue;

  @override
  void resetSlider(double value, {required bool subTasks}) async {
    await tasksListData.resetSlider(value, subTasks: subTasks);
    notifyListeners();
  }

  void deleteAllDoneTasks({required bool subTasks}) {
    tasksListData.deleteAllDoneTasks(subTasks: subTasks);
    notifyListeners();
  }

  void deleteAllTasks({required bool subTasks}) {
    tasksListData.deleteAllTasks(subTasks: subTasks);
    notifyListeners();
  }
}
