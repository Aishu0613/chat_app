import 'package:demo_app/core/app_preference.dart';
import 'package:demo_app/core/chat_app_colors.dart';
import 'package:demo_app/core/chat_app_sizeConfig.dart';
import 'package:demo_app/core/chat_app_string_en.dart';
import 'package:demo_app/features/presentations/login/chat_app_login_fragment.dart';
import 'package:demo_app/features/presentations/signup/chat_app_signup_activity.dart';
import 'package:demo_app/features/presentations/tutorials/chat_app_tutorial_main_activity.dart';
import 'package:flutter/material.dart';


class PreLoginAndSignUpActivity extends StatefulWidget {
 final PreLoginAndSignUpActivityInterface mListener;
  final String comeFor;
  final String loginUserId;

  const PreLoginAndSignUpActivity({Key key, this.comeFor, this.mListener, this.loginUserId}) : super(key: key);

  @override
  State<PreLoginAndSignUpActivity> createState() => _PreLoginAndSignUpActivityState();
}



class _PreLoginAndSignUpActivityState extends State<PreLoginAndSignUpActivity> {
  List<Widget> _pages;
  PageController controller = PageController(initialPage: 0);

  Color buttonTextLogin = CommonColor.WHITE_COLOR ;
  Color buttonColorLogin = CommonColor.BUTTON_ENABLE ;
  Color buttonTextSignUp = CommonColor.CHOOSE_LANG ;
  Color buttonColorSignUp = CommonColor.PRE_LOGIN_DISABLE ;


  bool contact;
  String deviceId = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("widget.loginUserId${widget.loginUserId}");
    getLocalInfo();
    _pages = <Widget>[
      ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: LoginMainFragment(

        ),
      ),
      ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: SignUpActivity(
        ),
      ),

    ];
  }

  getLocalInfo() async {
    bool  contactBool= await AppPreferences.getConnectScreenStatus();
    String deviceIdFor = await AppPreferences.getDeviceId();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Material(
      color: CommonColor.WHITE_COLOR,
      child: Column(
        children: [
          Container(
            height: SizeConfig.screenHeight*.2,
            child: getTopBar(SizeConfig.screenHeight,SizeConfig.screenWidth),
          ),
          Expanded(
            child : Container(
              height: SizeConfig.screenHeight*.8,
              child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                controller: controller,
                itemCount: _pages.length,
                onPageChanged: onPageChanged,
                itemBuilder: (BuildContext context, int index) {
                  return _pages[index % _pages.length];
                },
              ),
            ),
          ),

        ],
      ),
    );
  }


  Widget getTopBar(double parentHeight,double parentWidth){
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          children: [
            GestureDetector(

              onTap: (){
                Navigator.push
                  (context, MaterialPageRoute(builder: (BuildContext context)=> TutorialsParentActivity(
                )));
              },
              onDoubleTap: (){},
              child: Padding(
                padding: EdgeInsets.only(left: parentWidth*.05,bottom:parentHeight*.035),
                child: Container(
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image(image: AssetImage("assets/images/back.png"),
                      height:parentHeight*.036,
                      width: parentHeight*.036,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        getButtons(parentHeight,parentWidth),
      ],
    );
  }

  Widget getButtons(double parentHeight, double parentWidth){
    return Padding(
      padding: EdgeInsets.only(top:parentHeight*.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: (){
              controller.previousPage(duration:const Duration(milliseconds: 300),
                  curve: Curves.easeIn);
            },
            onDoubleTap: (){},
            child: Container(
              height: parentHeight*.06,
              width: parentWidth*.4,
              decoration: BoxDecoration(
                color:buttonColorLogin,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  StringEn.LOGIN,
                  style: TextStyle(
                    color: buttonTextLogin,
                    fontSize: SizeConfig.blockSizeVertical *2.5,
                    fontFamily: 'Segoe_Regular',
                  ),
                  textScaleFactor: 1.02,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              controller.nextPage(duration:const Duration(milliseconds: 300),
                  curve: Curves.easeIn);
            },
            onDoubleTap: (){},
            child: Container(
              height: parentHeight*.06,
              width: parentWidth*.4,
              decoration: BoxDecoration(
                color:buttonColorSignUp,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  StringEn.SIGN_UP,
                  style: TextStyle(
                    color: buttonTextSignUp,
                    fontSize: SizeConfig.blockSizeVertical * 2.5,
                    fontFamily: 'Segoe_Regular',
                  ),
                  textScaleFactor: 1.02,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }




  void onPageChanged(int pageNo) {
    setState(() {
      if (pageNo == 0) {
        buttonColorLogin = CommonColor.BUTTON_ENABLE;
        buttonTextLogin = CommonColor.WHITE_COLOR;
        buttonTextSignUp = CommonColor.CHOOSE_LANG ;
        buttonColorSignUp = CommonColor.PRE_LOGIN_DISABLE ;
      } else if (pageNo == 1) {
        buttonColorSignUp = CommonColor.BUTTON_ENABLE;
        buttonTextSignUp = CommonColor.WHITE_COLOR;
        buttonTextLogin = CommonColor.CHOOSE_LANG ;
        buttonColorLogin = CommonColor.PRE_LOGIN_DISABLE ;

      }
    });
  }

}


abstract class PreLoginAndSignUpActivityInterface {
  backToTutorial();
}