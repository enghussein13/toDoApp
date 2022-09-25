import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/components/components.dart';
import '../controller/todo_controller.dart';

class DoneScreen extends StatelessWidget {
  const DoneScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TodoController>(
      builder: (controller)=>Scaffold(
          body: controller.doneTasks.isEmpty?const Center(child: Text('No Done Tasks')):ListView.separated(itemBuilder: (context,index)=>defaultListItem(
              controller.doneTasks[index]),
              separatorBuilder: (context,index)=>divider(), itemCount: controller.doneTasks.length)
      ),
    );
  }
}
