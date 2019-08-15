import 'package:flutter/material.dart';
import 'package:t_s_f_news/Mine/ProfilePage.dart';


class MinePage extends StatefulWidget  {

  @override
  State<StatefulWidget> createState() {
    return MineState();
  }
}

class MineState extends State <MinePage>  with AutomaticKeepAliveClientMixin
{

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    print("MineState 11111111 initState !");
  }

  @override
  void didUpdateWidget(MinePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print(" MineState 111111111  did Update Mine Page Widget!");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("MineState 1111111111 did Change Dependencies Call!");
  }

  @override
  Widget build(BuildContext context) {
    print("MineState 111111111 build call!");
    return Scaffold (
      appBar: AppBar(
        title: Text("我的",),
      ),
      body: CustomScrollView (
        slivers: <Widget>[
        SliverToBoxAdapter(
          child:Stack(//Positioned 控件则用来控制这些子 Widget的位置. Positioned 控件只能在 Stack 中使用
            alignment: Alignment(0,-0.8),
            children: <Widget>[
              Image.asset("resource/images/lake.jpg",
                fit: BoxFit.fill,
//                height: 300,
               ),
              CircleAvatar(///or ClipRRect
                backgroundImage:AssetImage('resource/images/yuanyuan.png'
                ),
                child:ClipRRect(
                    borderRadius: BorderRadius.circular(70),
                    child: Container(
//                      color: Colors.yellow,
                      width: 140,
                      height: 140,
                      child: FlatButton(
                        onPressed:_buttonOnPressed,
                        shape: const RoundedRectangleBorder(
                          side: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(70)),
                        ),
                      ),
                  ),
                ),

                radius: 70.0,
              ),

//              CustomPaint(///自绘控件
//              ),

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

  ///Button action
  void _buttonOnPressed() {
//    print("Profile Tiped !");
    ProfilePage page = ProfilePage();
    Navigator.push(context, new MaterialPageRoute(builder: (context)=> page));
  }

  @override
  void deactivate() {
    print("MineState 11111111 deactivate !");
    super.deactivate();

  }

  @override
  void dispose() {
    print("MineState 1111111111 dispose!");
    super.dispose();

  }

}
