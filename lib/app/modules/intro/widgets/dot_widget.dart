import 'package:flutter/material.dart';
import '../../../core/consts/colors.conts.dart';

class DotWidget extends StatelessWidget {
  final int index;
  final bool isActive;

  const DotWidget({Key key, this.index, this.isActive}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8, right: 8),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive ? 
            Theme.of(context).primaryColor :
            ColorsConst.grey400 
        ),
        height: 6,
        width: 6,
      ),
    );
  }
}