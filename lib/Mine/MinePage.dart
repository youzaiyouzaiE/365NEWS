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
      body: CustomScrollView (
        slivers: <Widget>[
        SliverToBoxAdapter(
          child:Stack(
            alignment: Alignment(0,-0.8),
            children: <Widget>[
              Image.asset("resource/images/lake.jpg",
                fit: BoxFit.cover,
//                height: 300,
               ),
              CircleAvatar(
                backgroundImage:AssetImage('resource/images/yuanyuan.png'
                ),
                radius: 70.0,
              ),
            ],
          ),
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
