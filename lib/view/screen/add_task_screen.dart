import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mytasks/controller/add_task_screen_notifier.dart';
import 'package:mytasks/core/function/alertexitapp.dart';
import 'package:mytasks/view/widget/addtasks/custom_add_tasks.dart';
import 'package:mytasks/view/widget/addtasks/custom_background_add_tasks.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({
    Key? key,
    this.subTasks = false,
  }) : super(key: key);
  final bool subTasks;
  @override
  Widget build(BuildContext context) {
    AddTaskScreenNotifier controller =
        Provider.of<AddTaskScreenNotifier>(context);
    controller.initData();
    return WillPopScope(
      onWillPop: () => backAppHome(context),
      child: Scaffold(
        body: Stack(
          children: [
            const CustomBackgroundAddTasks(),
            SafeArea(
              child: Container(
                padding: EdgeInsets.all(15.0.h),
                margin: EdgeInsets.all(15.0.h),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(30)),
                child:
                    CustomAddTasks(controller: controller, subTasks: subTasks),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
