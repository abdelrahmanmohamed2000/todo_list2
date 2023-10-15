import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_list/database/model/task.dart';
import 'package:todo_list/database/my_database.dart';
import 'package:todo_list/dialog_utils.dart';

class TaskItem extends StatefulWidget {
Task task;
TaskItem(this.task);


  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      child: Slidable(
         startActionPane: ActionPane(
           extentRatio: .25,
             motion: DrawerMotion(),
             children: [
               SlidableAction(
                   onPressed: (buildContext){
                     deleteTask();
                   },
                 icon: Icons.delete,
                 label: "Delete",
                 backgroundColor: Colors.red,
                 borderRadius: BorderRadius.only(
                   topLeft: Radius.circular(18),
                   bottomLeft: Radius.circular(18),
                 ),

               )
             ]),
        child: Container(
          padding: EdgeInsets.all(12,),

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),),
          child: Row(
            children: [
              Container(

                 width: 8,
                 height: 80,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(18),
                   color: Colors.blue
                 ),

              ),
              SizedBox(width: 12,),

              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${widget.task.title}"),
                  SizedBox(height: 18,),
                  Text("${widget.task.desc}"),
                ],
              )),
              Container (
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(horizontal: 21,vertical: 7),

                child: Image.asset("assets/images/ic_check.png"))
            ],
          ),

        ),
      ),
    );
  }

  void deleteTask(){
    DialogUtils.showMessage(context, "Do you want delete this task ",
      postActionName: "ok",
      posAction: (){
      deleteTaskFromDatabase();
      },
      negActionName: "Cancel",
      
    );
  }
  void deleteTaskFromDatabase()async{
    try{await MyDataBase.deleteTask(widget.task.id??"");
    Fluttertoast.showToast(
        msg: "Task deleted success",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black45,
        textColor: Colors.white,
        fontSize: 16.0
    );
    }
        catch(e){DialogUtils.showMessage(context, "someThing went Wrong");}

  }

}
