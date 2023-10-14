
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mytasks/controller/tasks_notifier.dart';
import 'package:mytasks/data/model/sub_tasks.dart';
import 'package:mytasks/data/model/taskmodel.dart';
import 'package:mytasks/view/widget/myslider.dart';

class CustomSubTitle extends StatelessWidget {
  const CustomSubTitle({
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
    return Column(
      children: [
        Row(
          children: [
            Text(
                "Priority: ${(subTasks == true ? subTaskslist[index].priority : taskslist[index].priority)}"),
            SizedBox(width: 20.w),
            IconButton(
              onPressed: () =>
                  tasksNotifier.increasePriority(index, subTasks: subTasks),
              icon: const Icon(Icons.arrow_upward_outlined),
            ),
            IconButton(
              onPressed: () =>
                  tasksNotifier.decreasePriority(index, subTasks: subTasks),
              icon: const Icon(Icons.arrow_downward_outlined),
            ),
            SizedBox(width: 65.w),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                  "${(subTasks == true ? 0 : taskslist[index].lengthOfDone)}/${(subTasks == true ? 0 : taskslist[index].length)}"),
            ),
          ],
        ),
        MySlider(
            currentValue: (subTasks == true
                ? subTaskslist[index].currentValue
                : taskslist[index].currentValue)),
      ],
    );
  }
}
