import 'package:flutter/material.dart';
import 'data_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Dio dio = Dio();
  String url = 'https://fakestoreapi.com/products';
  List<dynamic> shoplist = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<dynamic> getData() async {
    Response response = await dio.get(url);
    print(response.data);
    print(response.statusCode); //200
    shoplist =
        response.data.map((product) => ShopList.fromJson(product)).toList();
    return shoplist;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(iconTheme: IconThemeData(color: Colors.white),title:Text('@_Home_shopping'),backgroundColor:Colors.grey,),
      drawer: Drawer(child:BackButton( onPressed: null,color: Colors.blue,) ),

      body: SafeArea(
        child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            return snapshot.hasData
                ? ListView.builder(
                    itemCount: shoplist.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(top: 20),
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: ListTile(
                          title: Image.network('${shoplist[index].image}',height: 400.0,),
                          subtitle: Container(
                            alignment: Alignment.center,
                            child: Text('Price :${shoplist[index].price}',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
                          ),
                        ),
                      );
                    },
                  )
                : snapshot.hasError
                    ? Text('Sorry Something Went Wrong')
                    : Center(child: CupertinoActivityIndicator());
          },
        ),
      ),
    );
  }
}
