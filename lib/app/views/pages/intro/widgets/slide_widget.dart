import 'package:flutter/material.dart';
import '../../../../core/consts/assets_const.dart';
import '../../../../core/localization/app_translate.dart';
import 'slide_page_widget.dart';

class SlideWiget extends StatelessWidget {
  final ValueChanged<int> onPageChanged;

  const SlideWiget({Key key, this.onPageChanged}) : super(key: key); 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.4,
        child: PageView(
          physics: BouncingScrollPhysics(),
          onPageChanged: onPageChanged,
          children: <Widget> [
            SlidePageWidget(
              text: AppTranslate(context).text('intro.text_step1'),
              asset: AssetsConst.step1
            ),
            SlidePageWidget(
              text: AppTranslate(context).text('intro.text_step2'),
              asset: AssetsConst.step2
            ),
            SlidePageWidget(
              text: AppTranslate(context).text('intro.text_step3'),
              asset: AssetsConst.step3
            ),
          ]
        ),
      ),
    );
  }
}