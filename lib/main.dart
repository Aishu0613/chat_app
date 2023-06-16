import 'dart:async';
import 'dart:io';
import 'package:demo_app/core/app_preference.dart';
import 'package:demo_app/core/chat_app_colors.dart';
import 'package:demo_app/core/chat_app_common.dart';
import 'package:demo_app/core/chat_app_sizeConfig.dart';
import 'package:demo_app/core/chat_app_string_en.dart';
import 'package:demo_app/features/presentations/tutorials/chat_app_tutorial_main_activity.dart';
import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info/package_info.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static void setLocale(BuildContext context, Locale newLocale) {
    var state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }


  @override
  void didChangeDependencies()   {
    /*getLocale().then((locale) {
      setState(() {
        _locale = locale;

      });
    });*/
    /*getLocale().then((locale) {
      setState(() {
        _locale = locale;

      });
    });*/


    super.didChangeDependencies();
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          // '/languageSelection': (BuildContext context) => LanguageSelectionActivity(),
          '/tutorialActivity': (BuildContext context) => TutorialsParentActivity(),
        }
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key,  this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // SystemChrome.setEnabledSystemUIOverlays([]);
    CommonWidget.getPlayerId();
    startTimer();
    getDeviceType();
    getDeviceID();
    getAppVersion();
  }

  /*Function for get Device Type is IOS or androoid*/
  getDeviceType() {
    if (Platform.isAndroid) {
      AppPreferences.setDeviceType("2");

    } else if (Platform.isIOS) {
      print("getDeviceType...");

      AppPreferences.setDeviceType("1");
    }
  }

  getDeviceID()   {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isIOS) {
      deviceInfo.iosInfo.then((iosInfo) {
        AppPreferences.setDeviceId(iosInfo.identifierForVendor);
      });
    } else {
      deviceInfo.androidInfo.then((androidInfo) {
        AppPreferences.setDeviceId(androidInfo.id);

      });

    }

  }

  /*set app version*/
  getAppVersion() {

    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      String appName = packageInfo.appName;
      String packageName = packageInfo.packageName;
      String version = packageInfo.version;
      String buildNumber = packageInfo.buildNumber;
      AppPreferences.setAppVersion(version);
    });
  }



  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: CommonColor.MAIN_COLOR,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          getAddMainImageLayout(SizeConfig.screenHeight,SizeConfig.screenWidth),
        ],
      ),
    );
  }

  /* Widget for Add Main Image Layout */
  Widget getAddMainImageLayout(double parentHeight, double parentWidth){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          StringEn.APP_NAME,
          style: TextStyle(
            color: CommonColor.WHITE_COLOR,
            fontSize: SizeConfig.blockSizeVertical * 7.0,
            fontFamily: 'Inter_Semi_Bold_Italic',
          ),
          textScaleFactor: 1.2,
        ),
      ],
    );
  }

  void navigateSignUpParentPage() {
    Navigator.of(context).pushReplacementNamed('/signUpScreen');
  }

  void navigationLoginPage() {
    Navigator.of(context).pushReplacementNamed('/loginScreen');
  }

  void navigateDashboardScreenPage() {
    Navigator.of(context).pushReplacementNamed('/dashboardScreen');
  }
  void navigateWelcomeScreenPage() {
    Navigator.of(context).pushReplacementNamed('/welcomeScreen');
  }
  void navigateLanguageSelection() {
    Navigator.of(context).pushReplacementNamed('/languageSelection');
  }
  void navigateTutorialActivity() {
    Navigator.of(context).pushReplacementNamed('/tutorialActivity');
  }

  void navigateDIGILocker() {
    Navigator.of(context).pushReplacementNamed('/digiLocker');
  }





  /* Timer */
  startTimer() async {
    var duration =  Duration(seconds: 4);
    try {

      String accessToken = await AppPreferences.getSessionToken();
      String profileFlag = await AppPreferences.getProfileStatus();

      print("accessToken    $accessToken    $profileFlag");
      if (accessToken!="" && profileFlag == "2") {
        return Timer(duration, navigateDashboardScreenPage);
      }/*else if(accessToken=="" && profileFlag== "1") {
        //digi locker
        // return Timer(duration, navigateDIGILocker);
        return Timer(duration, navigateTutorialActivity);
      }*/else if(accessToken!="" && profileFlag== "1") {
        return Timer(duration, navigateTutorialActivity);
      }
    } catch (e) {
      print("error    $e");
    }

    return Timer(duration, navigateTutorialActivity);
  }





}
