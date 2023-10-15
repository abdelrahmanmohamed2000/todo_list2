class Task {
  static const String collectionName="tasks";
  String? id;
  String? title;
  String? desc;
  bool isDone;
   Task({this.id,this.title,this.desc,this.isDone=false});
  Task.fromFireStore(Map <String,dynamic>?data ):
      this(
        id: data?['id'],
        title: data?['title'],
        desc: data?['desc'],
        isDone: data?['isDone'],

      );
  Map<String,dynamic>toFireStore(){
    return{
      'id':id,
      'title':title,
      'desc':desc,
      'isDone':isDone,

    };
  }






}