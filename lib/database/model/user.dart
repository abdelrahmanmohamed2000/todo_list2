class User{
  String? id;
  static const String collectionName ="users";

  User({this.id});
  User.fromFireStore(Map<String,dynamic>?data):
    this(id: data?['id']);

  Map<String,dynamic>toFireStore(){
    return {
      'id':id
    };
  }

  }
