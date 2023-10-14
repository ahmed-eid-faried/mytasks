import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mytasks/data/model/taskmodel.dart';
import 'package:mytasks/data/model/taskslistdata.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class AddTaskScreenNotifier extends ChangeNotifier {
  CalendarController? calendarController = CalendarController();
  CalendarTapDetails? calendarTapDetails;
  TextEditingController? textEditingController = TextEditingController();
  final box = GetStorage();
  final TasksListData tasksListData;
  AddTaskScreenNotifier({required this.tasksListData});
  void initData() {
    calendarController = CalendarController();
    textEditingController = TextEditingController();
  }

  void save(BuildContext context, {required bool subTasks}) async {
    if (calendarTapDetails != null) {
      try {
        print("indexOfList:- ${box.read('indexOf')}");
        await tasksListData.save(
          context,
          Task(
            desc: textEditingController!.text.toString(),
            isDone: false,
            dateStart: DateTime.now(),
            dateDeadline: calendarTapDetails!.date,
            priority: 0,
          ),
          subTasks: subTasks,
        );
        print("indexOfList:- ${box.read('indexOf')}");
        box.write('indexOf', null);
        notifyListeners();
      } catch (e) {
        print("Error saving task: $e");
      }
    }
  }
}
