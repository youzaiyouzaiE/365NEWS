import 'package:flutter/material.dart';



class MinePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
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
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text("Sliver App Bar"),
            floating: true,
            flexibleSpace: Image.asset("resource/images/lake.jpg",fit: BoxFit.cover,),
            expandedHeight: 300,
          ),
          SliverList(
            delegate:SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(title: Text('Item $index'),);
              },
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
