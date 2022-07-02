import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:untitled1/hive.dart';
import 'package:untitled1/userList.dart';
import 'package:untitled1/userList_page.dart';

import 'listpage.dart';

final hive = WHive();
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await hive.initializeHive();

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ListPage(),
    );
  }
}