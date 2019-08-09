import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}


class HomeState extends State <HomePage> {

  List<NewModel> newsModel = List<NewModel> ();
  
  double width;
  double height;
  
  final int imageWidth = 60;
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    this.width = size.width;
    this.height = size.height;

    return Scaffold (
      appBar: AppBar(
        title: Text("NEWs",),
      ),
      body: ListView.separated(
        itemCount: 20,
        itemBuilder:(BuildContext context, int index){
         return listItem(context,index);
        },
        separatorBuilder:(BuildContext context, int index) {
            return Divider(color: Colors.black);
        },
      ),
    );
  }

  Widget listItem(BuildContext context, int index) {
//    NewModel aNew = newsModel[index];
    return Row (
      mainAxisAlignment:MainAxisAlignment.spaceAround,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,///决定children的对齐方式
          children: <Widget>[
            Container(
              width: width - imageWidth -15,
              padding:EdgeInsets.fromLTRB(15, 10, 10, 5),
              child:Text("这个是新闻的主标题，可以有两行排列，或一行，但是最多只能有两行，不能再多了",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap:true,
                strutStyle: StrutStyle(///设置行间距
                  fontSize: 10.0,
                  height: 1.3,
                ),
                style: TextStyle(
                  fontSize: 24,
                  fontWeight:FontWeight.bold ,
                ),
              ) ,
            ),
            Container(
//              color: Colors.green,
              padding:EdgeInsets.fromLTRB(15, 5, 10, 5),
              child: Text("信息来源自",
                textAlign: TextAlign.left,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[400],
                ),
              ),
            ),
          ],

        ),
        Container(
          padding: EdgeInsets.only(right: 15),
            child: new Image.asset("resource/images/avatar.png",width: 60,height: 80,),
        ),
      ],
    );

    return ListTile(title: Text("365Nwes"), subtitle: Text("body in ${index}"),);
  }



}


class NewModel {
  String title;
  String imageUrl;
  String formSource;
  String commitNum;
}