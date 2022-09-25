import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/todo_controller.dart';


class TodoHomeLayout extends StatelessWidget {
  const TodoHomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TodoController>(
      init: TodoController(),
      builder: (controller)=>Scaffold(
        key: controller.scaffoldKey,
        appBar: AppBar(
          title:  Text(controller.todoTitle[controller.currentIndex]),
          leading: const Icon(Icons.menu),),
        floatingActionButton:FloatingActionButton(
          onPressed: (){
            controller.bottomSheetSwap();
          },
          child: controller.bottomSheetOpened?    const Icon(Icons.add): const Icon(Icons.edit)

        ) ,
        bottomNavigationBar:BottomNavigationBar(
          currentIndex: controller.currentIndex,
          onTap: (index){
            controller.navChange(index);
          }
          ,items: const [
          BottomNavigationBarItem(icon:Icon(Icons.menu),label: 'Tasks'),
          BottomNavigationBarItem(icon:Icon(Icons.download_done_outlined),label: 'Done'),
          BottomNavigationBarItem(icon:Icon(Icons.archive),label: 'Archived')
        ],) ,
        body: controller.screens[controller.currentIndex],
      ),
    );
  }
}
