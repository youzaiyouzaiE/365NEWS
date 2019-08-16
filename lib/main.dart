import 'package:flutter/material.dart';
import 'package:t_s_f_news/TableBarPag.dart';
import 'package:t_s_f_news/LifeCycleManager.dart';

void main()  {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return LifeCycleManager(
      child:MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: new TableBarPage(),
      ),
    );

  }
}


