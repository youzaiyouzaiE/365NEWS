import 'package:flutter/material.dart';



class MinePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MineState();
  }
}

class MineState extends State <MinePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text("我的",),
      ),

    );
  }
}