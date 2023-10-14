import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 import 'package:mytasks/view/screen/stopwatch.dart';

class TitleOfTasksList extends StatelessWidget {
  const TitleOfTasksList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.checklist_outlined, color: Colors.white, size: 50.r),
        SizedBox(width: 15.w),
        Text(
          'Todo List',
          style: TextStyle(
              color: Colors.white,
              fontSize: 33.sp,
              fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        IconButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const StopWatch()),
                (route) => false,
              );
            },
            icon: Icon(
              Icons.timer_outlined,
              color: Colors.white,
              size: 45.r,
            )),
        SizedBox(width: 8.w),
      ],
    );
  }
}

 