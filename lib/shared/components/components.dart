import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/controller/todo_controller.dart';

TodoController controller =Get.put(TodoController());

Widget defaultButton({
  Color background=Colors.blue,
  double width=double.infinity,
  required var function ,
  required String text,
})=> Container(
  color: background,
  width: width,
  child:   MaterialButton(
  onPressed: function,
  child:Center(child: Text(text.toUpperCase(),
  style: const TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 20.0
  ),
  ),
  ),
  ),
);

//--------------------------------------------------

Widget defaultTextField({
   var validate,
  required TextEditingController control,
  var onFieldSubmit ,
  var onFieldChange ,
    IconData? suffix,
   var suffixPressed ,
  required String label,
  required IconData icona,
   required TextInputType type,
  bool pwVisible=false,
  var onTap,
})=>TextFormField(
  validator:validate ,
  controller:control ,
  obscureText: pwVisible,
  onFieldSubmitted:onFieldSubmit,
  onChanged:onFieldChange,
  onTap: onTap,
keyboardType:type,
decoration: InputDecoration(
labelText: label,
prefixIcon: Icon(icona),
suffixIcon: suffix != null?IconButton(icon: Icon(suffix), onPressed:suffixPressed):null,

border: const OutlineInputBorder(),
),
);


//------------------------------------------------------------


Widget defaultListItem(Map model)=>Dismissible(
    key: UniqueKey(),
  child:   Padding(
    padding: const EdgeInsets.all(20.0),
    child:   Row(
      children: [
        CircleAvatar(
          radius: 40.0,
          child: Text('${model['time']}'),
        ),
        const SizedBox(width: 20.0,),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('${model['title']}',
                style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                ),),
              Text('${model['date']}',
                style: const TextStyle(
                    color: Colors.grey
                ),),
            ],),
        ),

        IconButton(onPressed: (){
          controller.updateDatabase('done', model['id']);
        }, icon: const Icon(Icons.check_box),color: Colors.green,),
        IconButton(onPressed: (){
          controller.updateDatabase('archived', model['id']);
        }, icon: const Icon(Icons.archive),color: Colors.black54,),

      ],

    ),
  ),

  onDismissed: (direction){
    controller.deleteData(model['id']);

  },
);


//-------------Navigator.push--------------

void navigateTo( context, widget)=>Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context)=>widget
    )
);


//-------------Navigator.push and replacement--------------

void navigateAndFinish(context,widget)=>Navigator.pushAndRemoveUntil(context,
    MaterialPageRoute(
        builder: (context)=>widget
    ),
        (Route<dynamic> route){
      return false;
    }

);







//------------------------------------------------------------





//-----------------API LESSONS----------------------------------

Widget buildArticlesItem(articles,context)=>InkWell(

  onTap:(){
   // navigateTo(context, WebViewScreen(articles['url']));
    //Get.to(()=>WebViewScreen(articles['url']));
  } ,
  child:   Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                  image:articles['urlToImage']==null?const NetworkImage('https://www.publicdomainpictures.net/pictures/280000/velka/not-found-image-15383864787lu.jpg'): NetworkImage('${articles['urlToImage']}'),
                  fit: BoxFit.cover
              )
          ),
        ),
        SizedBox(width: 20.0,),
        Expanded(
          child: Container(
            height: 120.0,
            child: Column(
              //mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text('${articles['title']}',
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 4,
                    overflow:TextOverflow.ellipsis,),
                ),
                Text('${articles['publishedAt']}',style: TextStyle(
                  color: Colors.grey,
                ),)
              ],
            ),
          ),
        )
      ],
    ),
  ),
);

//-------------------Devider----
Widget divider()=>Container(
  width: double.infinity,
  height: 3.0,
  color: Colors.grey,
);

//-------------------BottomSheetWidget----










