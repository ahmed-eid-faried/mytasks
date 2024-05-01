import 'package:flutter/material.dart';
import 'package:mytasks/controller/stopwatch_model.dart';
import 'package:mytasks/core/function/alertexitapp.dart';
import 'package:provider/provider.dart';

class StopWatch extends StatelessWidget {
  const StopWatch({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => backAppHome(context),
      child: Scaffold(
        appBar: AppBar(title: const Text('Stopwatch')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Elapsed Time:',
                style: TextStyle(fontSize: 20),
              ),
              StreamBuilder<Duration>(
                stream: context.watch<StopwatchModel>().elapsedTimeStream,
                initialData: Duration.zero,
                builder: (context, snapshot) {
                  final elapsedTime = snapshot.data;
                  return Text(
                    '${elapsedTime!.inMinutes}:${(elapsedTime.inSeconds % 60).toString().padLeft(2, '0')}.${(elapsedTime.inMilliseconds % 1000).toString().padLeft(3, '0')}',
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      final stopwatchModel =
                          Provider.of<StopwatchModel>(context, listen: false);
                      stopwatchModel.startStopwatch();
                    },
                    child: Consumer<StopwatchModel>(
                      builder: (context, stopwatchModel, child) {
                        return Text(
                            stopwatchModel.isRunning ? 'Stop' : 'Start');
                      },
                    ),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      final stopwatchModel =
                          Provider.of<StopwatchModel>(context, listen: false);
                      stopwatchModel.resetStopwatch();
                    },
                    child: const Text('Reset'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
