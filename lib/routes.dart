import 'package:flutter/material.dart';
import 'package:mytasks/core/constant/routes.dart';
import 'package:mytasks/view/screen/add_task_screen.dart';
import 'package:mytasks/view/screen/homescreen.dart';
import 'package:mytasks/view/screen/stopwatch.dart';

Map<String, Widget Function(BuildContext)> routes = {
  // AppRoute.home: (p0) => const MyWidget(),
  AppRoute.home: (p0) => const HomeScreen(),
  AppRoute.addTask: (p0) => const AddTaskScreen(subTasks: false),
  AppRoute.stopwatch: (p0) => const StopWatch(),
};
