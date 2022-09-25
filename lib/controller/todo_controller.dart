import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import '../../shared/components/components.dart';
import '../view/done_screen.dart';
import '../view/tasks_screen.dart';
import '../view/archived_screen.dart';

class TodoController extends GetxController
{
  List<String> todoTitle=['Tasks','Done','Archived'];
  List<Widget> screens=[ TasksScreen(), DoneScreen(), ArchivedScreen()];
  int currentIndex=0;
  Database ?database;
  var scaffoldKey=GlobalKey<ScaffoldState>();
  var formKey=GlobalKey<FormState>();
  bool bottomSheetOpened=false;
  List<Map> newTasks=[];
  List<Map> doneTasks=[];
  List<Map> archivedTasks=[];


  void navChange(index){
    currentIndex=index;
    update();
  }



//---------DataBase Functions------------------

  Future delteDatabase()async{
    await deleteDatabase('todo.db');
    if (kDebugMode) {
      print('deleted');
    }
    update();
  }

Future createDatabase()async{
    database=await openDatabase('todo.db',version: 1,
       onCreate: (database,version)async{
      if (kDebugMode) {
        print('database created');
      }
      await database.execute('CREATE TABLE TASKS(id INTEGER PRIMARY KEY,title TEXT,date TEXT,time TEXT,status TEXT)').then((value) { if (kDebugMode) {
        print('Tabled Created');
      }});
    }
    ,onOpen:(database){
           getDataFromDatabase(database);
        } );
}


void insertToDatabase(title,date,time)async{
     await database?.transaction((txn) async {
       txn.rawInsert(
           'INSERT INTO TASKS(title,date,time,status)VALUES("$title","$date","$time","new")').then((value) {
         getDataFromDatabase(database);
       });
     });


}
void updateDatabase(status,id){
    database?.rawUpdate('UPDATE TASKS SET status = ? WHERE id = ?',["$status",id]).then((value){
      getDataFromDatabase(database);

    });
}


void getDataFromDatabase(database){
    newTasks=[];
    doneTasks=[];
    archivedTasks=[];
         database.rawQuery('SELECT * FROM TASKS').then((value) {

           for (var element in value) {
             if(element['status']=='new'){
               newTasks.add(element);
             }else if(element['status']=='done'){
               doneTasks.add(element);
             }else if(element['status']=='archived'){
               archivedTasks.add(element);
             }
           }
           update();

         });
  }
  void deleteData(id){
    database?.rawDelete('DELETE FROM TASKS WHERE id = $id').then((value) => getDataFromDatabase(database));
  }


  TextEditingController titleController=TextEditingController();
  TextEditingController timeController=TextEditingController();
  TextEditingController dateController=TextEditingController();
  TextEditingController statusController=TextEditingController();

void bottomSheetSwap(){

    if(bottomSheetOpened==true){
     if(formKey.currentState!.validate()){
       insertToDatabase(titleController.text,dateController.text,timeController.text);

       Get.back();
       bottomSheetOpened=false;
       update();
       timeController.text=titleController.text=dateController.text='';
     }
    }else{
      scaffoldKey.currentState!.showBottomSheet((context) => Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            defaultTextField(
              validate: (value){
                if(value.isEmpty){
                  return 'Title must not be empty';
                }else{
                  return null;
                }
              },
              control: titleController,
              suffix: Icons.title,
              label: 'Title Task',
              icona: Icons.title,
              type:TextInputType.text,),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
                validator:(value){
                  if(value!.isEmpty){
                    return 'Time must not be empty';
                  }else{
                    return null;
                  }
                } ,
                controller: timeController,
                keyboardType: TextInputType.datetime,
                onTap: (){
                  showTimePicker(context: context,
                      initialTime: TimeOfDay.now()).then((value){
                    timeController.text=value!.format(context).toString();
                  });
                },
                decoration: const InputDecoration(
                    labelText: 'Time Task',
                    prefixIcon: Icon(Icons.watch),
                    border:OutlineInputBorder()
                )

            ),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
                validator:(value){
                  if(value!.isEmpty){
                    return  'Date must not be empty';
                  }else{
                    return null;
                  }
                } ,
                controller: dateController,
                keyboardType: TextInputType.datetime,
                onTap: (){
                  showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100)).then((value){
                    dateController.text='${value?.day}/${value?.month}/${value?.year}';
                  });
                },
                decoration: const InputDecoration(
                    labelText: 'Date Task',
                    prefixIcon: Icon(Icons.calendar_today),
                    border:OutlineInputBorder()
                )

            ),


          ],
        ),
      )).closed.then((value) {
        Get.back();
        bottomSheetOpened=false;
        update();
      });
      bottomSheetOpened=true;
      update();

    }
}








//---------------------------------------------
}