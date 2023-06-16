import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:demo_app/core/app_preference.dart';
import 'package:demo_app/core/chat_app_colors.dart';
import 'package:demo_app/core/chat_app_common.dart';
import 'package:demo_app/core/chat_app_sizeConfig.dart';
import 'package:demo_app/core/chat_app_string_en.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';


class SignUpActivity extends StatefulWidget {
  final String loginUserId;

  const SignUpActivity({Key key, this.loginUserId}) : super(key: key);

  @override
  State<SignUpActivity> createState() => _SignUpActivityState();
}

class _SignUpActivityState extends State<SignUpActivity>
    {
  final ScrollController _controller = ScrollController();
  bool isLoaderShow = false;
  final _mobileFocus = FocusNode();
  final _fullNameFocus = FocusNode();
  final _lastNameFocus = FocusNode();
  final _emailAddressFocus = FocusNode();
  final _referalFocus = FocusNode();

  final mobileController = TextEditingController();
  final fullNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailAddressController = TextEditingController();
  final referalController = TextEditingController();
  bool checked = false;
  bool isMobileValid = false;
  bool isMobileMsgValid = false;

  DataConnectionStatus netStatus;
  bool isNameValid = false;
  bool isNameMagValid = false;
  String chatId = "100";

  String requestName = "";
  String chatIdFor = "";
  String loginUserId = "";
  String friendId = "";
  String friendName = "";
  String profilePic = "";
  String messageCount = "";
  String friendMsgCount = "";
  String isComeFrom = "";
  String strTermsURL = "";
  String strPrivacyURL = "";
  bool isEmailValid = false;
  bool isEmailMagValid = false;
  // _launchURL(String url) async {
  //   if (await canLaunchUrl(Uri.parse(url))) {
  //     await launchUrl(Uri.parse(url));
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  removeErrorOnUserName() {
    if (fullNameController.text.trim().length > 0) {
      if (mounted) {
        setState(() {
          isNameValid = false;
          isNameMagValid = false;
        });
      }
    }
  }

  removeErrorOnMobileNo() {
    if (mobileController.text.trim().length > 0) {
      if (mounted) {
        setState(() {
          isMobileValid = false;
          isMobileMsgValid = false;
        });
      }
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    getLocalInfo();
    fullNameController.addListener(removeErrorOnUserName);
    mobileController.addListener(removeErrorOnMobileNo);

    var now = DateTime.now();
    //var formatter = DateFormat('dd MMMM yyyy/hh:mm a');
    //String formattedDate = formatter.format(now);
    //var arr = formattedDate.split('/');
    //

    //  inserDataOnFirebase();
  }

  bool contact;
  String deviceId = "";

  getLocalInfo() async {
    bool contactBool = await AppPreferences.getConnectScreenStatus();
    String deviceIdFor = await AppPreferences.getDeviceId();
    setState(() {
      contact = contactBool;
      deviceId = deviceIdFor;
    });
    print("getlocalinfodeviceId ${deviceId}");
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      onDoubleTap: () {},
      child: Stack(
        alignment: Alignment.center,
        children: [
          Scaffold(
            resizeToAvoidBottomInset: true,
            body: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(
                  children: [
                    Expanded(
                      child: KeyboardAvoider(
                        autoScroll: true,
                        child: Container(
                          height: SizeConfig.screenHeight * .6,
                          color: Colors.transparent,
                          // padding: EdgeInsets.only(
                          //     bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: ListView(
                            shrinkWrap: true,
                            controller: _controller,
                            physics: ClampingScrollPhysics(),
                            padding: EdgeInsets.only(
                                bottom: SizeConfig.screenHeight * 0.08),
                            children: [
                              getFirstNameField(
                                  SizeConfig.screenHeight, SizeConfig.screenWidth),
                              getLastNameField(
                                  SizeConfig.screenHeight, SizeConfig.screenWidth),
                              getMobileField(
                                  SizeConfig.screenHeight, SizeConfig.screenWidth),
                              getEmailAddressField(
                                  SizeConfig.screenHeight, SizeConfig.screenWidth),
                              getAddSubTextLayout(
                                  SizeConfig.screenHeight, SizeConfig.screenWidth),
                              getSupportLayout(
                                  SizeConfig.screenHeight, SizeConfig.screenWidth),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  color: Colors.white,
                  height: SizeConfig.screenHeight*.08,
                  child: getContinueButton(
                      SizeConfig.screenHeight, SizeConfig.screenWidth),
                ),
              ],
            ),

          ),
          Positioned.fill(child: CommonWidget.isLoader(isLoaderShow)),
        ],
      ),
    );
  }

  Widget getFirstNameField(double parentHeight, double parentWidth) {
    return Padding(
      padding: EdgeInsets.only(
          top: parentHeight * .1,
          left: parentWidth * .1,
          right: parentWidth * .1),
      child: Container(
        alignment: Alignment.center,
        height: parentHeight * .065,
        decoration: BoxDecoration(
          border: Border.all(color: CommonColor.MAIN_COLOR),
          borderRadius: BorderRadius.circular(7),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: parentWidth * .03),
              child: Image(
                image: AssetImage("assets/images/name.png"),
                height: parentHeight * .03,
                width: parentHeight * .03,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: parentWidth * .02),
                child: TextFormField(
                  inputFormatters: [FilteringTextInputFormatter.deny(RegExp('(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'))],
                  textAlignVertical: TextAlignVertical.center,
                  textCapitalization: TextCapitalization.words,
                  focusNode: _fullNameFocus,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  cursorColor: CommonColor.MAIN_COLOR,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.only(left: parentWidth * .02),
                    border: InputBorder.none,
                    counterText: '',
                    isDense: true,
                    hintText:" StringEn.full_name",
                    hintStyle: TextStyle(
                      fontFamily: "Arial_Bold",
                      fontSize: SizeConfig.blockSizeVertical * 2.3,
                      color: CommonColor.BLACK_COLOR,
                    ),
                  ),
                  controller: fullNameController,
                  onEditingComplete: () {
                    _fullNameFocus.unfocus();
                    FocusScope.of(context).requestFocus(_lastNameFocus);
                  },
                  style: TextStyle(
                    fontFamily: "Arial_Bold",
                    fontSize: SizeConfig.blockSizeVertical * 2.3,
                    color: CommonColor.BLACK_COLOR,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getLastNameField(double parentHeight, double parentWidth) {
    return Padding(
      padding: EdgeInsets.only(
          top: parentHeight * .018,
          left: parentWidth * .1,
          right: parentWidth * .1),
      child: Container(
        alignment: Alignment.center,
        height: parentHeight * .065,
        decoration: BoxDecoration(
          border: Border.all(color: CommonColor.MAIN_COLOR),
          borderRadius: BorderRadius.circular(7),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: parentWidth * .03),
              child: Image(
                image: AssetImage("assets/images/name.png"),
                height: parentHeight * .03,
                width: parentHeight * .03,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: parentWidth * .02),
                child: TextFormField(
                  inputFormatters: [FilteringTextInputFormatter.deny(RegExp('(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'))],
                  textAlignVertical: TextAlignVertical.center,
                  textCapitalization: TextCapitalization.words,
                  focusNode: _lastNameFocus,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  cursorColor: CommonColor.MAIN_COLOR,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: parentWidth * .02),
                    border: InputBorder.none,
                    counterText: '',
                    isDense: true,
                    hintText:" StringEn.last_name",
                    hintStyle: TextStyle(
                      fontFamily: "Arial_Bold",
                      fontSize: SizeConfig.blockSizeVertical * 2.3,
                      color: CommonColor.BLACK_COLOR,
                    ),
                  ),
                  controller: lastNameController,
                  onEditingComplete: () {
                    _lastNameFocus.unfocus();
                    FocusScope.of(context).requestFocus(_mobileFocus);
                  },
                  style: TextStyle(
                    fontFamily: "Arial_Bold",
                    fontSize: SizeConfig.blockSizeVertical * 2.3,
                    color: CommonColor.BLACK_COLOR,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getMobileField(double parentHeight, double parentWidth) {
    return Padding(
      padding: EdgeInsets.only(
          top: parentHeight * .018,
          left: parentWidth * .1,
          right: parentWidth * .1),
      child: Container(
        alignment: Alignment.center,
        height: parentHeight * .065,
        decoration: BoxDecoration(
          border: Border.all(color: CommonColor.BLACK_COLOR),
          borderRadius: BorderRadius.circular(7),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: parentWidth * .03),
              child: Image(
                image: AssetImage("assets/images/mobile.png"),
                height: parentHeight * .03,
                width: parentHeight * .03,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: parentWidth * .02),
                child: TextFormField(
                  maxLength: 10,
                  textAlignVertical: TextAlignVertical.center,
                  focusNode: _mobileFocus,
                  keyboardType: TextInputType.numberWithOptions(
                      signed: true, decimal: true),
                  textInputAction: TextInputAction.next,
                  cursorColor: CommonColor.BLACK_COLOR,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.only(left: parentWidth * .02),
                    border: InputBorder.none,
                    counterText: '',
                    isDense: true,
                    hintText: "StringEn.mobile_number",
                    hintStyle: TextStyle(
                      fontFamily: "Arial_Bold",
                      fontSize: SizeConfig.blockSizeVertical * 2.3,
                      color: CommonColor.BLACK_COLOR,
                    ),
                  ),
                  controller: mobileController,
                  onEditingComplete: () {
                    _mobileFocus.unfocus();
                    FocusScope.of(context).requestFocus(_emailAddressFocus);
                  },
                  style: TextStyle(
                    fontFamily: "Arial_Bold",
                    fontSize: SizeConfig.blockSizeVertical * 2.3,
                    color: CommonColor.BLACK_COLOR,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getEmailAddressField(double parentHeight, double parentWidth) {
    return Stack(

      children: [
        Padding(
          padding: EdgeInsets.only(
              top: parentHeight * .018,
              left: parentWidth * .1,
              right: parentWidth * .1),
          child: Container(
            alignment: Alignment.center,
            height: parentHeight * .065,
            decoration: BoxDecoration(
              border: Border.all(color: CommonColor.MAIN_COLOR),
              borderRadius: BorderRadius.circular(7),
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: parentWidth * .03),
                  child: Image(
                    image: AssetImage("assets/images/email.png"),
                    height: parentHeight * .03,
                    width: parentHeight * .03,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: parentWidth * .02),
                    child: TextFormField(
                      inputFormatters: [FilteringTextInputFormatter.deny(RegExp('(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'))],
                      scrollPadding: EdgeInsets.only(bottom: parentHeight * .2),
                      textAlignVertical: TextAlignVertical.center,
                      focusNode: _emailAddressFocus,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      cursorColor: CommonColor.MAIN_COLOR,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: parentWidth * .02),
                        border: InputBorder.none,
                        counterText: '',
                        isDense: true,
                        hintText: "StringEn.email_address",
                        hintStyle: TextStyle(
                          fontFamily: "Arial_Bold",
                          fontSize: SizeConfig.blockSizeVertical * 2.3,
                          color: CommonColor.BLACK_COLOR,
                        ),
                      ),
                      controller: emailAddressController,
                      onEditingComplete: () {
                        _emailAddressFocus.unfocus();
                        // FocusScope.of(context).requestFocus(_referalFocus);
                      },
                      style: TextStyle(
                        fontFamily: "Arial_Bold",
                        fontSize: SizeConfig.blockSizeVertical * 2.3,
                        color: CommonColor.BLACK_COLOR,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

        ),

      ],
    );
  }


  Widget getContinueButton(double parentHeight, double parentWidth) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {


          },
          onDoubleTap: () {},
          child: Padding(
            padding: EdgeInsets.only(left:parentWidth*.075,right: parentWidth * 0.075,bottom: parentHeight*.02),
            child: Container(
              height: parentHeight * .06,
              decoration: BoxDecoration(
                color: CommonColor.BLACK_COLOR,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    StringEn.FOLLOW,
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

  /* Widget Sub Text Layout */
  Widget getAddSubTextLayout(double parentHeight, double parentWidth) {
    return Padding(
      padding: EdgeInsets.only(
          top: parentHeight * .02,
          left: parentWidth * .1,
          right: parentWidth * .06),
      child: GestureDetector(
        onTap: () {
          setState(() {
            checked = !checked;
          });
        },
        onDoubleTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: parentHeight * .01),
              child: checked
                  ? Icon(
                      Icons.check_box,
                      color: CommonColor.BLACK_COLOR,
                      size: parentHeight * .037,
                    )
                  : Icon(
                      Icons.check_box_outline_blank_outlined,
                      color: CommonColor.MAIN_COLOR,
                      size: parentHeight * .037,
                    ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                    left: parentWidth * .02, top: parentHeight * .01),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                         " StringEn.TERMS_AND_CONDITIONS",
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                              fontFamily: "Segoe_Regular",
                              color: CommonColor.BLACK_COLOR,
                              fontWeight: FontWeight.w400,
                              height: 1.5),
                          textAlign: TextAlign.left,
                        ),
                        GestureDetector(
                          onTap: () {
                            //_launchURL(strTermsURL);
                          },
                          onDoubleTap: () {},
                          child: Text(
                           " StringEn.TERMS",
                            style: TextStyle(
                                fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                                fontFamily: "Segoe_Regular",
                                color: CommonColor.MAIN_COLOR,
                                fontWeight: FontWeight.w400,
                                height: 1.5),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "StringEn.AND_TEXT",
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                              fontFamily: "Segoe_Regular",
                              color: CommonColor.BLACK_COLOR,
                              fontWeight: FontWeight.w400,
                              height: 1.5),
                          textAlign: TextAlign.left,
                        ),
                        GestureDetector(
                          onTap: () {
                            //_launchURL(strPrivacyURL);
                          },
                          onDoubleTap: () {},
                          child: Text(
                          "  StringEn.PRIVACY_POLICY_TEXT",
                            style: TextStyle(
                                fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                                fontFamily: "Segoe_Regular",
                                color: CommonColor.MAIN_COLOR,
                                fontWeight: FontWeight.w400,
                                height: 1.5),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getSupportLayout(double parentHeight, double parentWidth) {
    return Padding(
      padding: EdgeInsets.only(top: parentHeight * .08),
      child: GestureDetector(
        onTap: () {
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("assets/images/support.png"),
              height: parentHeight * .038,
              width: parentHeight * .038,
            ),
            Padding(
              padding: EdgeInsets.only(left: parentWidth * .015),
              child: Text(
               " StringEn.CHAT_SUPPORT",
                style: TextStyle(
                  color: CommonColor.BLACK_COLOR,
                  fontSize: SizeConfig.blockSizeVertical * 2.5,
                  fontFamily: 'Segoe_Semibold',
                  fontWeight: FontWeight.w600,
                ),
                textScaleFactor: 1.02,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }


}
