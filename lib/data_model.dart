import 'package:flutter/material.dart';
import 'main.dart';
class ShopList {
  int? id;
  String? title;
  dynamic price;
  String? description;
  String? category;
  String? image;
  dynamic rate;
  int? count;

  ShopList.fromJson(Map<String,dynamic>json){
    id=json['id'];
    title=json['title'];
    price=json['price'];
    description=json['description'];
    category=json['category'];
    image=json['image'];
    rate=json['rating']["rate"];
    rate=json['rating']["count"];
  }

}
