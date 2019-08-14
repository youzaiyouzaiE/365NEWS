import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}


class HomeState extends State <HomePage> with AutomaticKeepAliveClientMixin {

  List<NewModel> newsModel = List<NewModel> ();
  ScrollController _controller = ScrollController();

  double width;
  double height;
  
  final int imageWidth = 60;

  double _listViewOffset = 0;

  @override
  void initState() {
    super.initState();
    print('1111111111    HomeState initState');
    _controller.addListener(() {
      _listViewOffset = _controller.offset;
      print("_listViewOffset = $_listViewOffset");
    }) ;
//    dleRefresh();
  }

  @override
  void dispose() {
    print('eeeeeeeeeee  HomeState dispose');
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    this.width = size.width;
    this.height = size.height;

//    bool get wantKeepAlive=>true;

    return Scaffold (
      appBar: AppBar(
        title: Text("NEWs",),
      ),
      body: ListView.separated(
        addAutomaticKeepAlives: true,
        itemCount: 20,
        controller: _controller,
        itemBuilder:(BuildContext context, int index){
          if (index == 1) {
            return thereImageCell(context,index);
          } else {
            return listItem(context,index);
          }
        },
        separatorBuilder:(BuildContext context, int index) {
            return Divider(color: Colors.black);
        },
      ),
    );
  }

  Widget listItem(BuildContext context, int index) {
//    NewModel aNew = newsModel[index];

  Widget titleImageSection = new Container(
    color: Colors.yellow,
    padding:EdgeInsets.fromLTRB(15, 10, 10, 5),
    child: Row(
      mainAxisAlignment:MainAxisAlignment.spaceAround,
      children: <Widget>[
        Expanded(///Expanded会拉伸该列以使用该行中的所有剩余空闲空间
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("这个是新闻的主标题，可以有两行排列，或一行，但是最多只能有两行，不能再多了",
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
              ),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text("信息来源自XX  XX跟帖",
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
        ),
      Container (
        padding: EdgeInsets.only(left: 5),
        child:new Image.asset("resource/images/wuyanzu.png",width: 80,height: 80,),
      )
      ],
    ),
  );


  Widget contentButton = FlatButton(
    color: Colors.blue,
    child: titleImageSection,
    onPressed: () {
      print("taped Item is :$index");
    },
  );

  return contentButton;
  }

  Widget thereImageCell(BuildContext context, int index) {

    return GestureDetector(
      child: Container(
        padding: EdgeInsets.fromLTRB(15, 10, 10, 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("图片Section的标题，此标题最多也是有两行 ",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              strutStyle: StrutStyle(///设置行间距
                fontSize: 10.0,
                height: 1.3,
              ),
              style: TextStyle(
                fontSize: 24,
                fontWeight:FontWeight.bold ,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Image.asset("resource/images/yoda.png",width: 100,),
                  Image.asset("resource/images/rabbit.png",width: 100,),
                  Image.asset("resource/images/prayer.png",width: 100,),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5),
              child: Text("信息来源自xx  XX跟帖",
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
      ),
      onTap:(){
        print("Image Cell item taped !");
      } ,
    );
  }
}


class NewModel {
  String title;
  String imageUrl;
  String formSource;
  String commitNum;
}