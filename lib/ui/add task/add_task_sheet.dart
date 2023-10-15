





import 'package:flutter/material.dart';

import 'package:todo_list/database/model/task.dart';
import 'package:todo_list/database/model/user.dart';
import 'package:todo_list/database/my_database.dart';

import 'package:todo_list/dialog_utils.dart';
import 'package:todo_list/provider/user_provider.dart';

class AddTaskSheet extends StatefulWidget {
  @override
  State<AddTaskSheet> createState() => _AddTaskSheetState();
}

class _AddTaskSheetState extends State<AddTaskSheet> {
var titleControler=TextEditingController();

var descriptionControler=TextEditingController();

var formkey=GlobalKey <FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(12),
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Add task",
              style: TextStyle(
                fontSize: 21,),),

              TextFormField(
                decoration: InputDecoration(labelText:"Title", ),
                keyboardType: TextInputType.text,
                validator: (text) {
                  if (text==null||text.trim().isEmpty){
                    return 'please Enter the title ';
                  }
                },
                controller: titleControler,



              ),
              TextFormField(
                decoration: InputDecoration(labelText:"Description", ),
                keyboardType: TextInputType.text,

                maxLines: 5,
                // validator: (text) {
                //   if (text==null||text.trim().isEmpty ){
                //     return 'please Enter the description ';
                //   }
                // },
                controller: descriptionControler,

              ),
              SizedBox( height: 50),
              ElevatedButton(onPressed: () {
                AddTask();
              },
                  child: Text("Save",style: TextStyle(fontSize:21 ))),
              TextButton(onPressed: () {
                Navigator.pop(context);
              },
                  child: Text("Cancel",style: TextStyle(fontSize:16 ),)),


            ],
          ),
        ),
      ),
    );
  }

  void AddTask()async{
   if(formkey.currentState?.validate()==false){
     return;
   }


   DialogUtils.showLoadingDialog(context, "Loading");
   Task task=Task(
     title: titleControler.text,
     desc: descriptionControler.text,);


   await MyDataBase.addTask(task);
   DialogUtils.hideDialog(context);
   DialogUtils.showMessage(context, "Task Added Successfuly",
   postActionName: "ok",
   posAction: (){
     Navigator.pop(context);
   });




  }
}
