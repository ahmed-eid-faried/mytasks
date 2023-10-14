import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mytasks/core/constant/color.dart';
import 'package:mytasks/core/constant/routes.dart';
import 'package:mytasks/core/function/alertexitapp.dart';
import 'package:mytasks/view/widget/home/custom_paths_home.dart';
import 'package:mytasks/view/widget/listoftasks/custom_list_of_tasks.dart';
import 'package:mytasks/view/widget/custom_numbers_of_tasks.dart';
import 'package:mytasks/view/widget/title_of_tasks_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => alertExitApp(context),
      child: SafeArea(
        child: Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoute.addTask,
                  (route) => false,
                );
              },
              child: Icon(Icons.add, size: 30.r),
            ),
            body: Stack(
              children: [
                const CustomPathsHome(),
                Container(color: AppColor.primaryColor.withOpacity(0.2)),
                Padding(
                  padding: EdgeInsets.all(15.0.h),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      const TitleOfTasksList(),
                      SizedBox(height: 5.h),
                      const CustomNumbersOfTasks(),
                      SizedBox(height: 5.h),
                      const CustomListOfTasks(),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
