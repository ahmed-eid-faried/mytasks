
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mytasks/controller/tasks_notifier.dart';
import 'package:mytasks/core/constant/color.dart';
import 'package:mytasks/data/model/sub_tasks.dart';
import 'package:mytasks/data/model/taskmodel.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    super.key,
    required this.subTasks,
    required this.subTaskslist,
    required this.index,
    required this.taskslist,
    required this.tasksNotifier,
  });

  final bool subTasks;
  final List<SubTasksModel> subTaskslist;
  final int index;
  final List<Task> taskslist;
  final TasksNotifierImp tasksNotifier;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          (subTasks == true ? subTaskslist[index].desc : taskslist[index].desc),
          style: (subTasks == true
                  ? subTaskslist[index].isDone
                  : taskslist[index].isDone)
              ? TextStyle(
                  decoration: TextDecoration.lineThrough,
                  decorationColor: AppColor.primaryColor,
                  decorationThickness: 2.0.w,
                  decorationStyle: TextDecorationStyle.wavy,
                )
              : const TextStyle(decorationColor: Colors.white),
        ),
        const Spacer(),
        Checkbox(
          value: (subTasks == true
              ? subTaskslist[index].isDone
              : taskslist[index].isDoneValue),
          onChanged: (state) =>
              tasksNotifier.checkbox(index, state: state, subTasks: subTasks),
        ),
      ],
    );
  }
}
