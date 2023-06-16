import 'package:demo_app/core/chat_app_sizeConfig.dart';
import 'package:flutter/material.dart';

class TutorialOneActivity extends StatefulWidget {
  const TutorialOneActivity({Key key}) : super(key: key);

  @override
  State<TutorialOneActivity> createState() => _TutorialOneActivityState();
}

class _TutorialOneActivityState extends State<TutorialOneActivity> {
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
                    "assets/images/tutorial.png",
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
