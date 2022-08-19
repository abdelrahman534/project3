// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'user_model.dart';
// import 'package:loading_indicator/loading_indicator.dart';
// import 'package:flutter/cupertino.dart';
//
// main(){
//   runApp(MaterialApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomeScreen(),
//     );
//   }
// }
//
//
//
// class HomeScreen extends StatefulWidget {
//   //consists of two classes (private & public one)
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// //stateful's private class
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   Dio dio = Dio();
//
//   //create an object called dio
//   String url = 'https://reqres.in//api/users';
//   UserListModel? usersListModel;
//
//   @override
//   void initState() {
//     super.initState();
//     getData();
//   }
//
//
//   Future<UserListModel> getData() async {
//     Response response = await dio.get(url);
//     usersListModel = UserListModel.fromJson(response.data);
//     return usersListModel!;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('API'),
//       ),
//       body: FutureBuilder(
//         builder: ((context, snapshot) {
//           return snapshot.hasData
//               ? ListView.builder(
//             itemCount: usersListModel!.userList!.length,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 trailing:
//                 Text(usersListModel!.userList![index].id.toString()),
//                 leading: CircleAvatar(
//                   radius: 30,
//                   backgroundImage: NetworkImage(
//                       usersListModel!.userList![index].avatar!),
//                 ),
//                 subtitle: Text(usersListModel!.userList![index].email!),
//                 title: Text(
//                     '${usersListModel!.userList![index].firstName!} ${usersListModel!.userList![index].lastName!}'),
//               );
//             },
//           )
//               : snapshot.hasError
//               ? Text('Sorry, Someting went')
//               : Center(child: CupertinoActivityIndicator());
//         }),
//       ),
//     );
//   }
// }
