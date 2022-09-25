import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/components/components.dart';
import '../controller/todo_controller.dart';

class ArchivedScreen extends StatelessWidget {
  const ArchivedScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TodoController>(
      builder: (controller)=>Scaffold(
          body: controller.archivedTasks.isEmpty?const Center(child: Text('No Archived Tasks')):ListView.separated(itemBuilder: (context,index)=>defaultListItem(
              controller.archivedTasks[index]),
              separatorBuilder: (context,index)=>divider(), itemCount: controller.archivedTasks.length)
      ),
    );
  }
}
