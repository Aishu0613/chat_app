import 'package:shared_preferences/shared_preferences.dart';


class AppPreferences{

  /*get deviceId value in SharedPreferences*/
  static Future<String> getDeviceId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("deviceId") ?? '';
  }

  /*set deviceId value form SharedPreferences*/
  static setDeviceId(String deviceId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("deviceId", deviceId);
  }

  /*get deviceType value in SharedPreferences*/
  static Future<String> getDeviceType() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString("deviceType") ?? '';
  }

  /*set deviceType value form SharedPreferences*/
  static setDeviceType(String deviceType) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("deviceType", deviceType);
  }

  /*get latitude value in SharedPreferences*/
  static Future<String> getLatitude() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("latitude") ?? '';
  }

  /*set latitude value form SharedPreferences*/
  static  setLatitude(String latitude) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("latitude", latitude);
  }

  /*get longitude value in SharedPreferences*/
  static Future<String> getLongitude() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("longitude") ?? '';
  }

  /*set longitude value form SharedPreferences*/
  static   setLongitude(String longitude) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("longitude", longitude);
  }


/*get userId value in SharedPreferences*/
  static Future<String> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("userId") ?? '';
  }

  /*set userId value form SharedPreferences*/
  static setUserId(String userId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("userId", userId);
  }


  /*get session token in shared preferences*/
  static Future<String> getSessionToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("sessionToken") ?? "";
  }
  /*set session token in shared preferences*/
  static   setSessionToken(String sessionToken) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("sessionToken",sessionToken);
  }

  /*get email in shared preferences*/
  static Future<String> getEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("email") ?? "";
  }
  /*set email in shared preferences*/
  static   setEmail(String email) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("email",email);
  }

  /*get FirstName in shared preferences*/
  static Future<String> getFirstName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("firstName") ?? "";
  }
  /*set FirstName in shared preferences*/
  static   setFirstName(String firstName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("firstName",firstName);

  }
  /*get lastName in shared preferences*/
  static Future<String> getLastName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("lastName") ?? "";
  }
  /*set lastName in shared preferences*/
  static  setLastName(String lastName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("lastName",lastName);
  }

  /*get userType in shared preferences*/
  static Future<String> getUserType() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("userType") ?? "";
  }
  /*set userType in shared preferences*/
  static   setUserType(String userType) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("userType",userType);
  }


  /*get mobile in shared preferences*/
  static Future<String> getMobile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("mobile") ?? "";
  }
  /*set mobile in shared preferences*/
  static   setMobile(String mobile) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("mobile",mobile);
  }
  /*get appUserName in shared preferences*/
  static Future<String> getAppUserName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("appUserName") ?? "";
  }
  /*set appUserName in shared preferences*/
  static  setAppUserName(String appUserName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("appUserName",appUserName);
  }
  /*get profilePic in shared preferences*/
  static Future<String> getProfilePic() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("profilePic") ?? "";
  }
  /*set profilePic in shared preferences*/
  static   setProfilePic(String profilePic) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("profilePic",profilePic);
  }


  /*get profilePic in shared preferences*/
  static Future<String> getDob() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("dob") ?? "";
  }
  /*set profilePic in shared preferences*/
  static  setDob(String dob) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("dob",dob);
  }

  /*get zipcode in shared preferences*/
  static Future<String> getZipCode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("zipcode") ?? "";
  }
  /*set zipcode in shared preferences*/
  static   setZipCode(String zipcode) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("zipcode",zipcode);
  }


  /* get distance in shared preferences*/
  static Future<String> getDistance() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("distance") ?? "";
  }
  /*set distance in shared preferences*/
  static  setDistance(String distance) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("distance",distance);
  }

  /*get distance in shared preferences*/
  static Future<int> getDistanceId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt("distance") ?? "";
  }
  /*set distance in shared preferences*/
  static   setDistanceId(int distance) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("distance",distance);
  }

  /*get gender in shared preferences*/
  static Future<String> getGender() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("gender") ?? "0";
  }
  /*set gender in shared preferences*/
  static  setGender(String gender) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("gender",gender);
  }
  /*get gender in shared preferences*/
  static Future<String> getPreferenceGender() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("genderPer") ?? "0";
  }
  /*set gender in shared preferences*/
  static   setPreferenceGender(String gender) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("genderPer",gender);
  }

  /*get gender in shared preferences*/
  static Future<String> getPromoVideo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("promoVideo") ?? "";
  }
  /*set gender in shared preferences*/
  static setPromoVideo(String promoVideo) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("promoVideo",promoVideo);
  }


  /*set userPreference from sharedPreferences*/
  static Future<String> getProfileStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString("profileComplete") ?? '0';
  }

  /*get userPreference value form SharedPreferences*/
  static setProfileStatus(String profileComplete) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("profileComplete", profileComplete);
  }

  /*set pushKey value in SharedPreferences*/
  static Future<String> getPushKey() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("fbpKey") ?? '0';
  }

  /*get pushKey value form SharedPreferences*/
  static setPushKey(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("fbpKey", key);
  }


/*set planeId value in SharedPreferences*/
  static Future<String> getPlaneId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString("planeId") ?? "1";
  }

  /*get planeId value form SharedPreferences*/
  static setPlaneId(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("planeId", key);
  }


  /*set planeId value in SharedPreferences*/
  static Future<String> getLogInFrom() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString("mLogInFrom") ?? "1";
  }

  /*get planeId value form SharedPreferences*/
  static setLogInFrom(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("mLogInFrom", key);
  }

  /*set ConnectScreenStatus value in SharedPreferences*/
  static Future<bool> getConnectScreenStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool("screenStatus") ?? false;
  }

  /*get ConnectScreenStatus value form SharedPreferences*/
  static setConnectScreenStatus(bool screenStatus) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("screenStatus", screenStatus);
  }
  /*set app version value in SharedPreferences*/
  static Future<String> getAppVersion() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString("appVersion") ?? "";
  }

  /*get app version value form SharedPreferences*/
  static setAppVersion(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("appVersion", key);
  }

  /*set app version value in socialMediaId*/
  static Future<String> getSocialMediaId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString("socialMediaId") ?? "";
  }

  /*get app version value form socialMediaId*/
  static setSocialMediaId(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("socialMediaId", key);
  }


  /*set generateBusinessCardStatus value in SharedPreferences*/
  static Future<bool> getBussniessCardStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool("businessCard") ?? false;
  }

  /*get setBusinesssCardStatus value form SharedPreferences*/
  static setBusinessCardStatus(bool businessCard) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("businessCard", businessCard);
  }
  /*get start Date value*/
  static Future<String> getStartDateTime() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString("startDate") ?? "";
  }

  /*set start date*/
  static setStartDateTime(String startDate) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("startDate", startDate);
  }

  /*get start Date value*/
  static Future<String> getEndDateTime() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString("endDate") ?? "";
  }

  /*set start date*/
  static setEndDateTime(String endDate) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("endDate", endDate);
  }

  /*get start Date value*/
  static Future<String> getVistingCardCity() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString("City") ?? "";
  }

  /*set start date*/
  static setVistingCardCity(String City) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("City", City);
  }

  /*get start Date value*/
  static Future<String> getVistingCardEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString("Email") ?? "";
  }

  /*set start date*/
  static setVistingCardEmail(String Email) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("Email", Email);
  }



  static clearAppPreference() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("sessionToken");
    prefs.remove("firstName");
    prefs.remove("lastName");
    prefs.remove("mobile");
    prefs.remove("email");
    prefs.remove("userId");
    prefs.remove("profilePic");
    prefs.remove("userType");
    prefs.remove("gender");
    prefs.remove("zipcode");
    prefs.remove("distance");
    prefs.remove("age");
    prefs.remove("dob");
    prefs.remove("profileComplete");
    prefs.remove("pDistance");
    prefs.remove("pAgeStart");
    prefs.remove("pAgeEnd");
    prefs.remove("planeId");
    prefs.remove("mLogInFrom");
    prefs.remove("startDate");
    prefs.remove("endDate");
    prefs.remove("City");
    prefs.remove("Email");
//    prefs.remove("socialMediaId");

  }

}