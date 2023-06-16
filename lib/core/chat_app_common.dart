
import 'package:demo_app/core/app_preference.dart';
import 'package:demo_app/core/chat_app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class CommonWidget {

  static getCommonPadding(double padding, Color colors) {
    return Container(
      height: padding,
      color: colors,
    );
  }

  static double opacityLevel=0.1;


  static getPlayerId() {
      OneSignal.shared
        .setAppId("4517a9e9-d44b-4444-90f2-9dd0f6f29fc8");

    OneSignal.shared.promptUserForPushNotificationPermission();
    updateToken();
  }


//FUNCTION: Update PlayerID for push notification
  static Future updateToken() async {
    var status;
    var playerId;
    // status = await OneSignal.shared.getDeviceState();
    // var playerId = status.userId;
    status = await OneSignal.shared.getDeviceState();
    playerId = status.userId;
    if (playerId != null) {
      AppPreferences.setPushKey(playerId);
    }
    print("PlayerID_GOT :: $playerId");

  }



  static isLoader(bool isLoaderShows ) {
    return Visibility(
      visible: isLoaderShows,
      child: Container(
          alignment: Alignment.center,
          decoration:  const BoxDecoration(color: Colors.transparent),
          child: const Center(
              child:  CircularProgressIndicator(
                valueColor:
                 AlwaysStoppedAnimation<Color>(CommonColor.MAIN_COLOR),
              ))),
    );
  }

  static Widget getShowError(var topMargin,var rightMargin,var fontSize,bool isVis,String errorMsg){
    return Positioned(
      right: rightMargin,
      top: topMargin,
      child: isVis
          ? Container(
        alignment: Alignment.bottomRight,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.withOpacity(0.2),width:1),
            borderRadius: BorderRadius.circular(8)
        ),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Text(
            errorMsg,
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontFamily: 'Avenir_Heavy',
              fontSize: fontSize,
            ),
            textScaleFactor: 1.02,
          ),
        ),
      )
          : Container(),
    );
  }


}