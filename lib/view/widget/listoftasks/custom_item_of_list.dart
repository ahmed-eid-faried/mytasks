import 'package:flutter/material.dart';
import 'package:mytasks/controller/tasks_notifier.dart';
import 'package:mytasks/core/constant/color.dart';
import 'package:mytasks/data/model/sub_tasks.dart';
import 'package:mytasks/data/model/taskmodel.dart';
import 'package:mytasks/view/widget/listoftasks/custom_sub_title.dart';
import 'package:mytasks/view/widget/listoftasks/custom_title.dart';

class CustomItemOfList extends StatelessWidget {
  const CustomItemOfList({
    super.key,
    required this.subTasks,
    required this.subTaskslist,
    required this.taskslist,
    required this.index,
    required this.tasksNotifier,
  });
  final TasksNotifierImp tasksNotifier;
  final bool subTasks;
  final List<SubTasksModel> subTaskslist;
  final List<Task> taskslist;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Container(color: AppColor.primaryColor),
      key: ValueKey(index),
      onDismissed: (direction) {
        if (index >= 0 && index < taskslist.length) {
          tasksNotifier.deleteTasks(context, index, subTasks: subTasks);
        }
      },
      child: ListTile(
        onTap: () {
          if (subTasks == false) {
            tasksNotifier.goToSubTasks(
              index,
              context,
            );
          }
        },
        title: CustomTitle(
            subTasks: subTasks,
            subTaskslist: subTaskslist,
            index: index,
            taskslist: taskslist,
            tasksNotifier: tasksNotifier),
        subtitle: CustomSubTitle(
            subTasks: subTasks,
            subTaskslist: subTaskslist,
            index: index,
            taskslist: taskslist,
            tasksNotifier: tasksNotifier),
      ),
    );
  }
}
