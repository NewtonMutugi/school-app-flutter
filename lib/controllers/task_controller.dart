import 'package:get/get.dart';
import 'package:school_app/models/task.dart';
import 'package:school_app/services/api.dart';
import 'package:school_app/services/api_service.dart';
//import 'package:school_app/services/api_service.dart';

class TasksController extends GetxController {
  final ApiService apiService = Get.put(ApiService()); // inject ApiService
  RxList<Task> tasks = <Task>[].obs; // observables list of tasks
  RxBool isLoading = true.obs; // observable boolean for loading state

  @override
  void onInit() {
    super.onInit();
    fetchTasks();
  }

  // fetch tasks from API
  Future<void> fetchTasks() async {
    try {
      isLoading.value = true;
      tasks.value = await apiService.getTasks(); // update tasks list
    } catch (error) {
      Get.snackbar('Error', 'Failed to fetch tasks: $error');
    } finally {
      isLoading.value = false;
    }
  }

  // add new task
  Future<void> addTask(Task task) async {
    try {
      final newTask = await apiService.createTask(task); // create new task in API
      tasks.add(newTask); // add new task to tasks list
      Get.back(); // navigate back to previous screen
      Get.snackbar('Success', 'Task created successfully!');
    } catch (error) {
      Get.snackbar('Error', 'Failed to create task: $error');
    }
  }

  // update task
  Future<void> updateTask(Task task) async {
    try {
      await apiService.updateTask(task); // update task in API
      final index = tasks.indexWhere((t) => t.id == task.id); // find index of updated task in list
      tasks[index] = task; // update task in tasks list
      Get.snackbar('Success', 'Task updated successfully!');
    } catch (error) {
      Get.snackbar('Error', 'Failed to update task: $error');
    }
  }

  // delete task
  Future<void> deleteTask(int id) async {
    try {
      await apiService.deleteTask(id); // delete task in API
      tasks.removeWhere((task) => task.id == id); // remove task from tasks list
      Get.snackbar('Success', 'Task deleted successfully!');
    } catch (error) {
      Get.snackbar('Error', 'Failed to delete task: $error');
    }
  }
}
