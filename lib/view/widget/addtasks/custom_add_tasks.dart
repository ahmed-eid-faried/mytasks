import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mytasks/controller/add_task_screen_notifier.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CustomAddTasks extends StatelessWidget {
  const CustomAddTasks({
    super.key,
    required this.controller,
    required this.subTasks,
  });

  final AddTaskScreenNotifier controller;
  final bool subTasks;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Center(
          child: Text(
            'Add Task',
            style: TextStyle(
                color: Colors.white,
                fontSize: 33.sp,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 15.h),
        TextFormField(
            controller: controller.textEditingController,
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(10),
                labelText: "Description",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))))),
        SizedBox(height: 15.h),
        Center(
          child: Text(
            'Select Deadline',
            style: TextStyle(
                color: Colors.white,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold),
          ),
        ),
        SfCalendar(
          controller: controller.calendarController,
          onTap: (calendarTapDetails) {
            controller.calendarTapDetails = calendarTapDetails;
          },
          view: CalendarView.month,
        ),
        SizedBox(height: 15.h),
        ElevatedButton(
            onPressed: () {
              controller.save(context, subTasks: subTasks);
            },
            child: const Text("Add")),
      ],
    );
  }
}
