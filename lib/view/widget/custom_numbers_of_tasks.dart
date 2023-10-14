import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mytasks/controller/tasks_notifier.dart';
import 'package:mytasks/core/constant/routes.dart';
import 'package:provider/provider.dart';

class CustomNumbersOfTasks extends StatelessWidget {
  const CustomNumbersOfTasks({
    Key? key,
    this.subTasks = false,
  }) : super(key: key);
  final bool subTasks;

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksNotifierImp>(builder: (context, tasksNotifier, child) {
      final list = subTasks == true
          ? tasksNotifier.tasksListData.tasksListSubTasks
          : tasksNotifier.tasksListData.tasksListTask;
      return Row(
        children: [
          Text(
            '${list.length} Items',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          MaterialButton(
              onPressed: () {
                tasksNotifier.deleteAllTasks(subTasks: subTasks);
                Navigator.of(context).pushReplacementNamed(AppRoute.home);
              },
              child: Row(
                children: [
                  const Icon(Icons.remove_circle_outline, color: Colors.white),
                  SizedBox(width: 4.w),
                  const Text('All', style: TextStyle(color: Colors.white))
                ],
              )),
          MaterialButton(
              onPressed: () {
                tasksNotifier.deleteAllDoneTasks(subTasks: subTasks);
                Navigator.of(context).pushReplacementNamed(AppRoute.home);
              },
              child: Row(
                children: [
                  const Icon(Icons.remove_circle_outline, color: Colors.white),
                  SizedBox(width: 4.w),
                  const Text('AllDone', style: TextStyle(color: Colors.white))
                ],
              )),
        ],
      );
    });
  }
}
