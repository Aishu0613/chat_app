
import 'package:demo_app/core/app_preference.dart';
import 'package:demo_app/core/chat_app_colors.dart';
import 'package:demo_app/core/chat_app_sizeConfig.dart';
import 'package:demo_app/core/chat_app_string_en.dart';
import 'package:demo_app/features/presentations/pre_login_and_signup/chat_app_prelogin_and_signup_activity.dart';
import 'package:demo_app/features/presentations/tutorials/chat_app_tutorial_first_activity.dart';
import 'package:demo_app/features/presentations/tutorials/chat_app_tutorial_second_activity.dart';
import 'package:demo_app/features/presentations/tutorials/chat_app_tutorial_third_activity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TutorialsParentActivity extends StatefulWidget {
  final TutorialsParentActivityInterface mListener;
  const TutorialsParentActivity({Key key, this.mListener}) : super(key: key);

  @override
  State<TutorialsParentActivity> createState() =>
      _TutorialsParentActivityState();
}



class _TutorialsParentActivityState extends State<TutorialsParentActivity>  {
  List<Widget> _pages;
  PageController controller = PageController(initialPage: 0);
  String strTitleOne = "Lorem ipsum dolor sit amet consectetur. Venenatis.";
  String strTitleTwo = "Lorem ipsum dolor sit amet consectetur. Integer.";
  String strTitleThree = "Lorem ipsum dolor sit amet consectetur. Metus.";
  String strSteps = "1";
  String strDetails = "In publishing and graphic design, Lorem ";
  String strDetailsS =   "is a placeholder text commonly";


  bool contact;
  String deviceId = "";




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocalInfo();
    //CommonWidget.getPlayerId();
    _pages = <Widget>[
      ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: const TutorialOneActivity(
          // key: globalKeyForSearchPetListing,
          // mListener: this,
        ),
      ),
      ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: const TutorialSecondActivity(
          // key: globalKeyForSearchPetListing,
          // mListener: this,
        ),
      ),
      ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: const TutorialThirdActivity(
          // key: globalKeyForSearchPetListing,
          // mListener: this,
        ),
      ),
    ];
  }

  getLocalInfo() async {
    bool  contactBool= await AppPreferences.getConnectScreenStatus();
    String deviceIdFor = await AppPreferences.getDeviceId();
    setState(() {
      contact=contactBool;
      deviceId = deviceIdFor;
    });
  }


  int page = 0;
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Material(
     // color: CommonColor.BACKGROUND,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            physics: const ClampingScrollPhysics(),
            controller: controller,
            itemCount: _pages.length,
            onPageChanged:   /* onPageChanged,*/ (i) {
              if (mounted) {
                setState(() {
                  currentIndex = i;
                });
              }
            },
            itemBuilder: (BuildContext context, int index) {
              return _pages[index % _pages.length];
            },
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: SizeConfig.screenHeight*.35,
                decoration:BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 20.0,
                    ),
                  ],
                  color: CommonColor.MAIN_COLOR,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight:Radius.circular(30.0),
                  ),
                ),
                child: getTutorialTitle(SizeConfig.screenHeight,SizeConfig.screenWidth),
              ),
              Padding(
                padding:  EdgeInsets.only(top:SizeConfig.screenHeight*.2 ),
                child: getButtons(SizeConfig.screenHeight,SizeConfig.screenWidth),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget getTutorialTitle(double parentHeight, double parentWidth){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: parentHeight*.04,left: parentWidth*.04,right: parentWidth*.04),
                      child: Text(
                        currentIndex==0? strTitleOne:currentIndex==1?strTitleTwo:strTitleThree,
                        style: TextStyle(
                          color: CommonColor.WHITE_COLOR,
                          fontSize: SizeConfig.blockSizeVertical * 2.8,
                          height: 1.4,
                          fontFamily: 'Inter_Regular',
                          fontWeight: FontWeight.w500
                        ),
                        textScaleFactor: 1.02,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),

                ],
              ),
              Expanded(
                child : Padding(
                  padding: EdgeInsets.only(top: parentHeight*.03,left: parentWidth*.1,right: parentWidth*.1),
                  child: Column(
                    children: [
                      Text(
                        strDetails,
                        style: TextStyle(
                            color: CommonColor.WHITE_COLOR.withOpacity(0.8),
                          fontSize: SizeConfig.blockSizeVertical * 1.8,
                            fontFamily: 'Inter_Extra_Light',
                            fontWeight: FontWeight.w300
                        ),
                        textScaleFactor: 1.02,
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: parentHeight*.01),
                        child: Text(
                          strDetailsS,
                          style: TextStyle(
                            color: CommonColor.WHITE_COLOR.withOpacity(0.8),
                            fontSize: SizeConfig.blockSizeVertical * 1.8,
                              fontFamily: 'Inter_Extra_Light',
                              fontWeight: FontWeight.w300
                          ),
                          textScaleFactor: 1.02,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ],
    );
  }


  Widget getButtons(double parentHeight, double parentWidth){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
     /*     strSteps=="1"?Container():*/ GestureDetector(
          onTap: (){

            //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Dashboard()));
          /*  if(controller.page==0){
            }
            else{
              controller.previousPage(duration:const Duration(milliseconds: 500),
                  curve: Curves.easeIn);
            }*/

          },
          onDoubleTap: (){},
          child: Container(
            height: parentHeight*.056,
            width: parentWidth*.23,
            decoration: const BoxDecoration(
              color:CommonColor.MAIN_COLOR,
              borderRadius: BorderRadius.horizontal(
                right: Radius.circular(50.0),
              ),
            ),
            child: Center(
              child: Text(
                "Skip",
                style: TextStyle(

                  color:currentIndex == 2?
                  CommonColor.WHITE_COLOR.withOpacity(.6):CommonColor.WHITE_COLOR,
                  fontSize: SizeConfig.blockSizeVertical * 2.2,
                  fontFamily: 'Inter_Regular',
                ),
                textScaleFactor: 1.02,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Container(
          height: parentHeight * .05,
          alignment: Alignment.center,
          color: Colors.transparent,
          child: ListView.builder(
            shrinkWrap: true,
            // controller: _scrollController,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(0.0),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding:
                EdgeInsets.only(left: parentWidth * .018),
                child: Container(
                  height: parentHeight * .009,
                  width: parentHeight * .009,
                  decoration: BoxDecoration(
                      color: currentIndex == index
                          ?  CommonColor.WHITE_COLOR
                          : CommonColor.WHITE_COLOR.withOpacity(.5),
                      shape: BoxShape.circle),
                ),
              );
            },
            itemCount: 3,
          ),
        ),
        GestureDetector(
          onTap: (){
            controller.nextPage(duration:const Duration(milliseconds: 500),
                curve: Curves.easeIn);

            if(controller.page==2){
              Navigator.push
                (context, MaterialPageRoute(builder: (BuildContext context)=> PreLoginAndSignUpActivity(
                //mListener: this,
                //comeFor:"Login_chat",
                //loginUserId: deviceId,
              )));
            }
            else{
              controller.nextPage(duration:const Duration(milliseconds: 500),
                  curve: Curves.easeIn);
            }

          },
          onDoubleTap: (){},
          child: Container(
            height: parentHeight*.056,
            width: parentWidth*.23,
            decoration: const BoxDecoration(
              color:CommonColor.MAIN_COLOR,
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(50.0),
              ),
            ),
            child: Center(
              child: Text(
                StringEn.NEXT,
                style: TextStyle(
                  color: CommonColor.WHITE_COLOR,
                  fontSize: SizeConfig.blockSizeVertical * 2.2,
                  fontFamily: 'Inter_Regular',
                ),
                textScaleFactor: 1.02,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }




  @override
  backToTutorial() {
    // TODO: implement backToTutorial
    if(mounted){
      setState(() {
        Navigator.pop(context);
      });
    }
  }


}


abstract class TutorialsParentActivityInterface {
}