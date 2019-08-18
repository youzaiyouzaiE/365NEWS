import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return ProfileState();
  }
}


class ProfileState  extends State <ProfilePage> {

  bool _isClearCache = false;
  int _tapCount = 0;

  @override
  void initState() {
    super.initState();
    print("ProfileState  initState !");
  }

 @override
  void didUpdateWidget(ProfilePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("ProfileState  didUpdateWidget !");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("ProfileState  did Change Dependencies Call!");
  }


  @override
  Widget build(BuildContext context) {
    print("ProfileState build!");

    String title = _isClearCache ? "我的" : "个人中心";
    return Scaffold (
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: MyText(count: _tapCount),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _changeTitle,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  _changeTitle() {
    _isClearCache = true;
    _tapCount ++;
    setState(() {

    });
  }

  @override
  void setState(fn) {
    super.setState(fn);
    print("ProfilePage parent setState.");

  }

  Widget _titleItem(IconData icon, String label, bool secure, TextEditingController controller) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children:[
        new Icon(icon, color: Colors.red),
        new Container (
          padding: EdgeInsets.only(left: 10.0),
          width: 60,
          child: new Text(label,
            style: new TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }


  @override
  void deactivate() {
    print("ProfileState deactivate !");
    super.deactivate();
  }

  @override
  void dispose() {
    print("ProfileState dispose!");
    super.dispose();
  }
}

class MyText extends StatefulWidget {
  final int count;
  MyText({Key key, this.count}) : super(key:key);

  @override
  _MyTextState createState() => _MyTextState();
}

class _MyTextState extends State <MyText> {

  @override
  void initState() {
    super.initState();
    print("MyTextState initState。。。");
  }

  @override
  Widget build(BuildContext context) {
    print("MyTextState build。。。");
    return Text('点击按钮次数 count: ${widget.count}');
  }

  //状态改变的时候会调用该方法,比如父类调用了setState
  @override
  void didUpdateWidget(MyText oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("MyTextState didUpdateWidget 。。。");
  }

  //当State对象从树中被移除时，会调用此回调
  @override
  void deactivate() {
    super.deactivate();
    print("MyTextState deactivate 。。。");
  }

  //当State对象从树中被永久移除时调用；通常在此回调中释放资源
  @override
  void dispose() {
    super.dispose();
    print("MyTextState dispose 。。。");
  }

}

