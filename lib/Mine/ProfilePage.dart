import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {

    return ProfileState();
  }
}


class ProfileState  extends State <ProfilePage> {

  @override
  void initState() {
    super.initState();
    print("ProfileState  111111 initState !");
  }

 @override
  void didUpdateWidget(ProfilePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("ProfileState 2222222 didUpdateWidget !");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("ProfileState 3333333 did Change Dependencies Call!");
  }


  @override
  Widget build(BuildContext context) {
    print("ProfileState 4444444 build!");
    return Scaffold (
      appBar: AppBar(
        title: Text("个人中心"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Text("个人中心"),
      ),
    );
  }

  @override
  void deactivate() {
    print("ProfileState 5555555 deactivate !");
    super.deactivate();
  }

  @override
  void dispose() {
    print("ProfileState 6666666 dispose!");
    super.dispose();
  }

}