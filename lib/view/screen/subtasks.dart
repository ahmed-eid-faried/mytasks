import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mytasks/core/function/alertexitapp.dart';
import 'package:mytasks/view/screen/add_task_screen.dart';
import 'package:mytasks/view/widget/subtasks/custom_background_sub_tasks.dart';
import 'package:mytasks/view/widget/listoftasks/custom_list_of_tasks.dart';
import 'package:mytasks/view/widget/custom_numbers_of_tasks.dart';

class SubTasks extends StatelessWidget {
  const SubTasks({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => backAppHome(context),
      child: SafeArea(
        child: Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) =>
                            const AddTaskScreen(subTasks: true)),
                    (route) => false);
              },
              child: Icon(Icons.add, size: 30.r),
            ),
            body: Stack(
              children: [
                const CustomBackgroundSubTasks(),
                Padding(
                  padding: EdgeInsets.all(15.0.h),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Row(
                        children: [
                          Icon(Icons.checklist_outlined,
                              color: Colors.white, size: 50.r),
                          SizedBox(width: 15.w),
                          Text(
                            'SubTasks List',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.h),
                      const CustomNumbersOfTasks(subTasks: true),
                      SizedBox(height: 5.h),
                      const CustomListOfTasks(subTasks: true),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
