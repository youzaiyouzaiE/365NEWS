import 'package:flutter/material.dart';

class LifeCycleManager extends StatefulWidget {

  final Widget child;
  LifeCycleManager({Key key, this.child}) : super(key: key);

  _LifeCycleManagerState createState() => _LifeCycleManagerState();
}


class _LifeCycleManagerState extends State <LifeCycleManager> with WidgetsBindingObserver {

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.child,
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('state = $state');
    switch (state) {
      case AppLifecycleState.resumed:

      ///可见的，并能响应用户的输入。
        print("Inactive");
        break;
      case AppLifecycleState.inactive:

      ///处在不活动状态，无法处理用户响应。
        print("Paused");
        break;
      case AppLifecycleState.paused:

      ///不可见并不能响应用户的输入，但是在后台继续活动中。
        print("Resumed");
        break;
      case AppLifecycleState.suspending:
        print("Suspending");
        break;
    }
  }
}

//https://medium.com/flutter-community/build-a-lifecycle-manager-to-manage-your-services-b9c928d3aed7