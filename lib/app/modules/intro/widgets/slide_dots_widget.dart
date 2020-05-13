import 'package:flutter/material.dart';
import 'dot_widget.dart';

class SlideDotsWidget extends StatelessWidget {
  final int currentPage;

  const SlideDotsWidget({Key key, this.currentPage}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          DotWidget(
            index: 0,
            isActive: currentPage == 0,
          ),
          DotWidget(
            index: 1,
            isActive: currentPage == 1,
          ),
          DotWidget(
            index: 2,
            isActive: currentPage == 2,
          )
        ]
      ),
    );
  }
}