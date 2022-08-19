import 'dart:convert';
import 'first_screen.dart';

class UserListModel {
  //the class that make the parsing from json to dart and contain the loop for the user model
  List<UserModel>? userList;

  UserListModel.fromJson(Map<String, dynamic>json){
    //هنا هنرببط الuserlistmodel مع Json
    userList = []; //initial value of an empty array
    json['data'].forEach((element) {
      userList!.add(UserModel.fromJson(element));
    }
    );
  }


}
class UserModel{
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  UserModel.fromJson(Map<String,dynamic>json){
    id=json['id'];
    email=json['email'];
    firstName=json['first_name'];
    lastName=json['last_name'];
    avatar=json['avatar'];


  }
}
// "id": 7,
// "email": "michael.lawson@reqres.in",
// "first_name": "Michael",
// "last_name": "Lawson",
// "avatar": "https://reqres.in/img/faces/7-image.jpg"
