import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/database/model/task.dart';
import 'package:todo_list/database/my_database.dart';
import 'package:todo_list/ui/home/todo_list/task_item.dart';

class TodoListTap extends StatefulWidget {



  @override
  State<TodoListTap> createState() => _TodoListTapState();
}

class _TodoListTapState extends State<TodoListTap> {
List<Task>taskList=[];

  @override
  Widget build(BuildContext context) {
    if(taskList.isEmpty)
    readTasksFromDataBase();

    return Container(
      child: Column(
        children: [
          Expanded(child:
              StreamBuilder<QuerySnapshot<Task>>(
                stream: MyDataBase.getRealTimeUpdate()

                ,builder: (context, snapshot) {
                if(snapshot.hasError){
                  return Center(child: Text(snapshot.error.toString()));}
                // if(snapshot.connectionState==ConnectionState.waiting){
                //   return Center(child: CircularProgressIndicator());
                // }
                var taskList =snapshot.data?.docs.map((doc) => doc.data())
                .toList();
                if(taskList?.isEmpty==true){
                  return Center(child: Text("you dont have any task ''Add Task''"),);
                }
                return ListView.builder(itemBuilder: (_,index){
                  return TaskItem(taskList![index]);

                },itemCount: taskList?.length??0,);
              },)
           )
        ],
      ),);
  }

  readTasksFromDataBase()async{
    var result=await MyDataBase.getTask();
    var tasksList=result.docs.map((docSnapshot) => docSnapshot.data()).toList();
    setState(() {

    });
  }
}

// taskList.isEmpty? Center(child: CircularProgressIndicator()):
// ListView.builder(itemBuilder: (context, index) {
//   return TaskItem(taskList[index]);
//
// },itemCount: taskList.length,))