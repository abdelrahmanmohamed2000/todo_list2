import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_list/database/model/task.dart';
import 'package:todo_list/database/model/user.dart';

class MyDataBase{

  // static CollectionReference<User> getUserCollection(){
  //   return  FirebaseFirestore .instance.collection(User.collectionName)
  //       .withConverter<User>(
  //     fromFirestore: (snapshot, options)  =>User.fromFireStore(snapshot.data()),
  //     toFirestore: (user ,options) => user.toFireStore() ,);}

  // static Future<void> addUser (User user) {
  //   var collection =getUserCollection();
  //   return  collection./*add(user);*/doc(user.id).set(user);
  //
  // }
  // static Future<User?> readUser(String id )async{
  //   var collection = getUserCollection();
  //   var docSnapshot=await collection.doc(id).get();
  //   return docSnapshot.data();
  // }



  static CollectionReference<Task>getTaskCollection(){
    return FirebaseFirestore.instance

        .collection(Task.collectionName)
        .withConverter<Task>(fromFirestore: (snapshot, options) =>Task.fromFireStore(snapshot.data()) ,
       toFirestore: (task, options) => task.toFireStore(),);
  }
  static Future<void> addTask(Task task){
    var newTaskDoc = getTaskCollection()
        .doc();
    task.id=newTaskDoc.id;
    return newTaskDoc.set(task);

  }
  static Stream<QuerySnapshot<Task>> getRealTimeUpdate( ){
    return getTaskCollection()
        .snapshots();
  }
  static Future<QuerySnapshot<Task>> getTask( ){
    return getTaskCollection()
        .get();
  }
  static Future<void> deleteTask(String taskId){
    return getTaskCollection()
        .doc(taskId)
        .delete();
  }

}