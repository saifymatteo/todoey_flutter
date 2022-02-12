import 'package:flutter/material.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:provider/provider.dart';

class TasksList extends StatefulWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    // * [Consumer] let devs to NOT use [Provider.of<T>(context)] anymore
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Consumer<TaskData>(
        builder: (context, taskData, child) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return TaskTile(
                taskTitle: taskData.tasks[index].name,
                isChecked: taskData.tasks[index].isDone,
                checkboxCallback: (checkboxState) {
                  setState(() {
                    taskData.tasks[index].toggleDone();
                  });
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
