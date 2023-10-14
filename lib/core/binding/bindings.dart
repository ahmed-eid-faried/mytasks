import 'package:mytasks/controller/stopwatch_model.dart';
import 'package:mytasks/core/constant/color.dart';
import 'package:mytasks/controller/tasks_notifier.dart';
import 'package:mytasks/controller/add_task_screen_notifier.dart';
import 'package:mytasks/data/model/taskslistdata.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  //     Get.put(Curd());
  // ChangeNotifierProvider<MyService>(create: (context) => MyService()),
  ChangeNotifierProvider<TasksNotifierImp>(
      create: (context) => TasksNotifierImp(TasksListData(), subTasks: false)),
  ChangeNotifierProvider<AppColor>(create: (_) => AppColor()),
  ChangeNotifierProvider<AddTaskScreenNotifier>(
      create: (_) => AddTaskScreenNotifier(tasksListData: TasksListData())),
// StopwatchModel
  ChangeNotifierProvider<StopwatchModel>(create: (_) => StopwatchModel()),
  
  // ChangeNotifierProvider<AnimationsNotifier>(
  //     create: (context) => AnimationsNotifier()),

  // ChangeNotifierProvider(create: (context) => SliderNotifier()),
];
