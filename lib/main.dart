import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/todo_controller.dart';
import 'shared/styles/themes.dart';
import 'view/todo_home_layout.dart';

void main() async{
//WidgetsFlutterBinding.ensureInitialized();


  runApp(  MyApp());
}

class MyApp extends StatelessWidget {
    MyApp({Key? key}) : super(key: key);
    TodoController controller = Get.put(TodoController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      onInit: (){
        controller.createDatabase();
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      darkTheme: Themes.customDarkThemeGetx,
      theme: Themes.customLightThemeGetx,
      home:     const TodoHomeLayout(),
    );
  }
}
