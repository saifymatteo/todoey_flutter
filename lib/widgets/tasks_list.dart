import 'package:flutter/material.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // * [Consumer] let devs to NOT use [Provider.of<T>(context)] anymore
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 80, top: 20),
      child: Consumer<TaskData>(
        builder: (context, taskData, child) {
          // * [ListView.builder] is important to create list builder
          // * or individual TaskTile with the respective constructor
          return ListView.builder(
            itemBuilder: (context, index) {
              final task = taskData.tasks[index]; // * To simplify below
              return TaskTile(
                taskTitle: task.name,
                isChecked: task.isDone,
                checkboxCallback: (checkboxState) {
                  taskData.updateTask(task);
                },
                longPressCallback: () {
                  taskData.removeTask(task);
                },
              );
            },
            itemCount: taskData.taskCount,
          );
        },
      ),
    );
  }
}
