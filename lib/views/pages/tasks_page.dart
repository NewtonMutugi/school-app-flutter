import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/controllers/task_controller.dart';

import 'package:school_app/models/task.dart';

class TasksPage extends StatelessWidget {
  final taskController = Get.find<TasksController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks'),
      ),
      body: Obx(() {
        if (taskController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: taskController.tasks.length,
            itemBuilder: (context, index) {
              Task task = taskController.tasks[index];
              return ListTile(
                title: Text(task.name),
                subtitle: Text(task.description),
                trailing: Checkbox(
                  value: task.completed,
                  onChanged: (value) {
                    task.completed = value!;
                    taskController.updateTask(task);
                  },
                ),
                onTap: () {
                  // Navigate to task detail page
                },
              );
            },
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to add task screen
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
