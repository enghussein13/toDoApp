import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/components/components.dart';
import '../controller/todo_controller.dart';

class TasksScreen extends StatelessWidget {
   const TasksScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TodoController>(
      builder: (controller)=>Scaffold(
        body: controller.newTasks.isEmpty?const Center(child: Text('No New Tasks')):ListView.separated(itemBuilder: (context,index)=>defaultListItem(
          controller.newTasks[index]),
            separatorBuilder: (context,index)=>divider(), itemCount: controller.newTasks.length)
      ),
    );
  }
}
