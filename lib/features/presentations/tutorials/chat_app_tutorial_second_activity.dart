import 'package:demo_app/core/chat_app_sizeConfig.dart';
import 'package:flutter/material.dart';

class TutorialSecondActivity extends StatefulWidget {
  const TutorialSecondActivity({Key key}) : super(key: key);

  @override
  State<TutorialSecondActivity> createState() => _TutorialSecondActivityState();
}

class _TutorialSecondActivityState extends State<TutorialSecondActivity> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Material(
      child: Container(
        height: SizeConfig.screenHeight * .85,
        width: SizeConfig.screenWidth ,
        color: Colors.transparent,
        child: Padding(
          padding:  EdgeInsets.only(top:  SizeConfig.screenHeight *.08),
          child: Column(
            children: [
              Container(
                color: Colors.transparent,
                height: SizeConfig.screenHeight * .6,
                width: SizeConfig.screenWidth,
                child: const Image(
                  image: AssetImage(
                    "assets/images/chat_two.jpeg",
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
