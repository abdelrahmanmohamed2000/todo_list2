
import 'package:flutter/material.dart';
import 'package:todo_list/ui/add%20task/add_task_sheet.dart';
import 'package:todo_list/ui/home/todo_list/task_item.dart';
import 'package:todo_list/ui/home/todo_list/todo_list_tab.dart';

class HomePage extends StatefulWidget {
static const String routName = "home page ";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(title:  Text("ToDo ") ) ,
       body: TodoListTap(),


      floatingActionButton:

        FloatingActionButton.extended(
          label: Text("Add Task", style: TextStyle(fontSize: 22),) ,
          shape: const StadiumBorder(
              side: BorderSide(
                color: Colors.white,
                width: 4,
              )),
          onPressed: () {
            showAddTaskSheet();
          },

          icon: Icon( Icons.add,),

        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

    );
  }


void showAddTaskSheet(){
 showModalBottomSheet(context: context, builder: (buildContext){
   return AddTaskSheet();
 });

}
}

