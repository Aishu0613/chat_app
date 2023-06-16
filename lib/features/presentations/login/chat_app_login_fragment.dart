import 'package:demo_app/core/chat_app_colors.dart';
import 'package:demo_app/core/chat_app_common.dart';
import 'package:demo_app/core/chat_app_sizeConfig.dart';
import 'package:demo_app/core/chat_app_string_en.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:keyboard_actions/keyboard_actions_config.dart';

class LoginMainFragment extends StatefulWidget {
  final String comeFrom;
  final String loginUserId;
  const LoginMainFragment({Key key, this.comeFrom, this.loginUserId,}) : super(key: key);


  @override
  State<LoginMainFragment> createState() => _LoginMainFragmentState();
}

class _LoginMainFragmentState extends State<LoginMainFragment>
    {

  bool isLoaderShow = false;
  final _mobileFocus = FocusNode();


  final mobileController = TextEditingController();

  bool isPhoneMsgValid = false;
  bool isPhoneValid = false;
  String requestName="";
  String chatIdFor="";
  String loginUserId="";
  String friendId="";
  String friendName="";
  String profilePic="";
  String messageCount="";
  String friendMsgCount="";
  String isComeFrom="";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  bool contact;
  String deviceId = "";



  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.IOS,
      keyboardBarColor: Colors.grey[200],
      // nextFocus: true,
      actions: [
        KeyboardActionsItem(
          displayArrows: false,
          focusNode:_mobileFocus ,
          toolbarButtons: [
                (node) {
              return GestureDetector(
                onTap: () {
                  _mobileFocus.unfocus();
                },
                onDoubleTap: () {},
                child: Container(
                  color: CommonColor.MAIN_COLOR,
                  padding: const EdgeInsets.all(12.0),
                  child:  Text(
                    StringEn.DELETE_GALLERY_POST,
                    style: TextStyle(
                        color: CommonColor.WHITE_COLOR,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              );
            }
          ],
        ),

      ],
    );
  }






  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      onDoubleTap: () {},
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: KeyboardActions(
          autoScroll: true,
          config: _buildConfig(context),
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: SizeConfig.screenHeight * .6,
                    child: Column(
                      children: [
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: SizeConfig.screenHeight * .05),
                            child: Text(
                              StringEn.LOGIN,
                              style: TextStyle(
                                color: CommonColor.CHOOSE_LANG,
                                fontSize: SizeConfig.blockSizeVertical * 4.0,
                                fontFamily: 'Segoe_Regular',
                              ),
                              textScaleFactor: 1.02,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        getMobileField(
                            SizeConfig.screenHeight, SizeConfig.screenWidth),
                      ],
                    ),
                  ),
                  Container(
                    height: SizeConfig.screenHeight * .2,
                    child: getBottomView(
                        SizeConfig.screenHeight, SizeConfig.screenWidth),
                  ),
                ],
              ),
              Positioned.fill(child: CommonWidget.isLoader(isLoaderShow)),
            ],
          ),
        ),
      ),
    );
  }

  Widget getMobileField(double parentHeight, double parentWidth) {
    return Padding(
      padding: EdgeInsets.only(top: parentHeight * .05,
          left: parentWidth * .1,
          right: parentWidth * .1),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.centerRight,
        children: [
          Container(
            alignment: Alignment.center,
            height: parentHeight * .065,
            decoration: BoxDecoration(
              border: Border.all(color: CommonColor.PRE_LOGIN_DISABLE),
              borderRadius: BorderRadius.circular(7),
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: parentWidth * .03),
                  child: Text(
                    "+91",
                    style: TextStyle(
                      color: CommonColor.CHOOSE_LANG,
                      fontSize: SizeConfig.blockSizeVertical * 2.8,
                      fontFamily: 'Segoe_Regular',
                    ),

                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: parentWidth * .02,top: parentHeight*0.002),
                    child: TextFormField(
                      textAlignVertical: TextAlignVertical.center,
                      focusNode: _mobileFocus,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      cursorColor: CommonColor.CHOOSE_LANG,
                      maxLength: 10,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: parentWidth * .02),
                        border: InputBorder.none,
                        counterText: '',
                        isDense: true,
                        hintText: StringEn.MOBILE_HINT,
                        hintStyle: TextStyle(
                          fontFamily: "Arial_Bold",
                          fontSize: SizeConfig.blockSizeVertical * 2.8,
                          color: CommonColor.PRE_LOGIN_DISABLE,
                        ),
                      ),
                      controller: mobileController,
                      onFieldSubmitted: (term) {
                        _mobileFocus.unfocus();
                      },
                      style: TextStyle(
                        color: CommonColor.CHOOSE_LANG,
                        fontSize: SizeConfig.blockSizeVertical * 2.8,
                        fontFamily: 'Segoe_Regular',
                      ),

                     // textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: isPhoneValid,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: parentHeight * .0, right: parentWidth * .02),
              child: Container(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    if (mounted) {
                      setState(() {
                        isPhoneMsgValid = !isPhoneMsgValid;
                      });
                    }
                  },
                  onDoubleTap: () {},
                  child: Icon(Icons.error, color: Colors.red),
                ),
              ),
            ),
          ),
          CommonWidget.getShowError(
              parentHeight * .045,
              parentWidth * .01,
              SizeConfig.blockSizeHorizontal * 2.5,
              isPhoneMsgValid,
              mobileController.text
                  .trim()
                  .length < 1
                  ? "Please enter a mobile number"
                  : "Please enter a valid mobile number"),
        ],
      ),
    );
  }

  Widget getBottomView(double parentHeight, double parentWidth) {
    return Column(
      children: [
        getContinueButton(parentHeight, parentWidth),
      ],
    );
  }


  Widget getContinueButton(double parentHeight, double parentWidth) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {

          },
          onDoubleTap: () {},
          child: Padding(
            padding: EdgeInsets.only(
                left: parentWidth * .06, right: parentWidth * .06),
            child: Container(
              height: parentHeight * .06,
              decoration: BoxDecoration(
                color: CommonColor.BUTTON_ENABLE,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    StringEn.CONTINUE,
                    style: TextStyle(
                      color: CommonColor.WHITE_COLOR,
                      fontSize: SizeConfig.blockSizeVertical * 2.2,
                      fontFamily: 'Segoe_Regular',
                      fontWeight: FontWeight.w200,
                    ),
                    textScaleFactor: 1.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }



}
