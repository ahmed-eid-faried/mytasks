import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mytasks/controller/tasks_notifier.dart';
import 'package:mytasks/view/widget/listoftasks/custom_item_of_list.dart';
import 'package:provider/provider.dart';

class CustomListOfTasks extends StatelessWidget {
  const CustomListOfTasks({
    Key? key,
    this.subTasks = false,
  }) : super(key: key);
  final bool subTasks;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: subTasks == true
              ? Colors.white.withOpacity(0.2)
              : Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(30.r),
        ),
        height: 540.h,
        child: Padding(
            padding: EdgeInsets.all(15.0.h),
            child: Consumer<TasksNotifierImp>(
                builder: (context, tasksNotifier, child) {
              final taskslist = tasksNotifier.tasksListData.tasksListTask;
              final subTaskslist =
                  tasksNotifier.tasksListData.tasksListSubTasks;
              return FutureBuilder(
                future: tasksNotifier.intialData(subTasks: subTasks),
                builder: (context, snapshot) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount:
                        (subTasks == true ? subTaskslist : taskslist).length,
                    itemBuilder: (BuildContext context, int index) {
                      return CustomItemOfList(
                          tasksNotifier: tasksNotifier,
                          index: index,
                          subTasks: subTasks,
                          subTaskslist: subTaskslist,
                          taskslist: taskslist);
                    },
                  );
                },
              );
            })));
  }
}
