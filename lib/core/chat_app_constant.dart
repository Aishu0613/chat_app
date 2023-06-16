class Constant {
//  static const String BASE_URL = "http://iduudoapi.regenapps.com/";
  static const String BASE_URL = "http://bullzeyedevapi.regenapps.com/";



  static const String LOGIN = "login";
  static const String SIGN_UP = "signup";
  static const String USERS = "users";
  static const String NOTIFICATIONS = "notifications";



  static String getLogin() {
    return BASE_URL + LOGIN;
  }

  static String getSignUp() {
    return BASE_URL + SIGN_UP;
  }

  static String getUsers() {
    return BASE_URL + USERS;
  }

  static String getNotifications() {
    return BASE_URL + NOTIFICATIONS;
  }

  static const String SIGN_UP_FOR_NORMAL = "1";
  static const String SIGN_UP_FORM_FACEBOOK = "2";
  static const String SIGN_UP_FORM_APPLE = "3";

  static const String LOGIN_SCREEN = "LoginFragment";
  static const String SIGN_UP_SCREEN = "SignupFragment";
  static const String CREATE_PASSWORD = "CreatePasswordFragment";
  static const String EVENTS_PAGE = "EventsPageFragment";
  static const String LIVE_EVENTS_PAGE = "LiveEventsPageFragment";
  static const String PROFILE_UPLOAD = "ProfilePicUpload";
  static const String CATEGORY_INTEREST_FRAGMENT = "CategoryInterestFragment";
  static const String CATEGORY_ARTIST_FRAGMENT = "AreYouArtistFragment";
  static const String MENU = "Menu";
  static const String DASHBOARD = "Dashboard";

  static const String HOME_PAGE = "HomePage";
  static const String LOCATION = "LocationFragment";
  static const String SEARCH = "SearchFragment";
  static const String USER_PAGE = "UserPageFragment";
  static const String ARTISTS_PAGE = "ArtistsListingFragment";
  static const String CREATE_POST = "CreatePostFragment";
  static const String HOME_SELECTED="assets/images/home_active.png";
  static const String HOME_NON_SELECTED="assets/images/home_inactive.png";
  static const String LOCATION_SELECTED="assets/images/location_active.png";
  static const String LOCATION_NON_SELECTED="assets/images/location_inactive.png";
  static const String SEARCH_SELECTED="assets/images/search_active.png";
  static const String SEARCH_NON_SELECTED="assets/images/search_inactive.png";




  static const String CREATE_PROFILE = "CreateProfileFragment";
  static const String CREATE_EVENT = "CreateNewEventFragment";
  static const String UPDATE_PROFILE = "UpdateProfileFragment";
  static const String FORGOT_PASSWORD_SCREEN = "ForgotPasswordScreen";
  static const String IMPORT_CONTACTS_SCREEN = "ImportContactsFragment";
  static const String CHOOSE_PATH_FRAGMENT = "ChoosePathFragment";





  static const String MAP_COME_FROM_HOME = "1";
  static const String OTP_SCREEN = "OtpFragment";
  static const String PAST_EVENTS_FRAGMENT = "PastEventsFragment";

  static const String ABOUT_US_MALE_SELECTED = "images/male_active.png";
  static const String ABOUT_US_NEUTRAL_SELECTED =
      "images/neutral_active.png";
  static const String ABOUT_US_FEMALE_SELECTED =
      "images/female_active.png";
  static const String ABOUT_US_MALE_UNSELECTED =
      "images/male_inactive.png";
  static const String ABOUT_US_NEUTRAL_UNSELECTED =
      "images/neutral_inactive.png";
  static const String ABOUT_US_FEMALE_UNSELECTED = "images/female_inactive.png";



  /*.................................Constant key For api response and api request..............................................*/
  static const String OPTION = "option";
  static const String LATITUDE = "latitude";
  static const String LONGITUDE = "longitude";
  static const String DEVICE_ID = "deviceId";
  static const String DEVICE_TYPE = "deviceType";
  static const String APP_VERSION = "appVersion";
  static const String EMAIL = "email";
  static const String PASSWORD = "password";
  static const String PUSH_KEY = "pushKey";
  static const String SERVER_URL = "serverUrl";
  static const String USER_TYPE = "userType";
  static const String PROFILE_PIC = "profilePic";
  static const String STATUS = "status";
  static const String MESSAGE = "message";
  static const String PROFILE_COMPLETED = "profileComplete";
  static const String PROFILE_UPDATED = "profileUpdated";
  static const String FIRST_NAME = "firstName";
  static const String LAST_NAME = "lastName";
  static const String USER_ID = "userId";
  static const String SESSION_TOKEN = "sessionToken";
  static const String SIGN_UP_FORM = "signUpFrom";
  static const String API_VER = "apiVer";
  static const String OTP = "otp";
  static const String SOCIAL_MEDIA_ID = "socialMediaId";
  static const String P_KEY = "pkey";
  static const ADDRESS_BOOK = "addressBook";
  static const PAGE = "page";
  static const ARR_DATA = "arrData";




  static const String SIGN_UP_PROFILE_COMPLETE = "1";
  static const String SIGN_UP_UPLOAD_PROFILE_PIC_COMPLETE = "2";
  static const String SIGN_UP_IMPORT_CONSTACT_COMPLETE = "3";
  static const String SIGN_UP_CHOOSE_PATH_COMPLETE = "4";




  /*get event keys*/
  static const EVENT_ID = "eventId";
  static const NAME = "name";
  static const START_DATE = "start_date";
  static const END_DATE = "end_date";
  static const TIMEZONE = "timezone";
  static const DISCRIPTION = "description";
  static const ADDRESS = "address";
  static const CITY = "city";
  static const STATE_ID = "state_id";
  static const COUNTRYID = "country_id";
  static const ZIP = "zip";
  static const CATEGORY_ID = "category_id";
  static const CREATE_ON = "created_on";
  static const EVENT_MIDEA = "eventsMedia";
  static const MIDEA_ID = "mediaId";
  static const URL = "url";
  static const THUMB_URL = "thumb_url";
  static const MIDEA_TYPE_ID = "media_type_id";
  static const EVENT_MEDIA_CATEGORY_ID = "event_media_category_id";
  static const ARR_EVENT_USERS_POST = "arrEventsUsersPost";
  static const POST_ID = "postId";
  static const String CREATE_LOCATION = "CreateLocation";


  static const String TIME_ZONE = "timezone";
  static const String DESCRIPTION = "description";



  static const String MEDIA_TYPE_ID = "media_type_id";

  static const String CREATED_ON = "created_on";
  static const String EVENTS_MEDIA = "eventsMedia";
  static const String MEDIA_ID = "mediaId";



  //  Update Profile API Keys //
  static const String GENDER = "gender";
  static const String DOB = "dob";
  static const String MOBILE = "mobile";
  static const String ABOUT_ME = "aboutMe";
  static const String PROFILE_ID = "profileId";
  static const String N_FOLLOW="nFollow";
  static const String ID="id";
  static const String APP_USER_NAME="appUserName";
  static const String ARR_USER_PROFILE="arrUserProfile";

  static const  signUpFormEmail = "1";
  static const  signUpFormGoogle = "4";
  static const  signUpFormLinkDin = "5";
  static const  signUpFormApple = "2";
  static const  signUpFormFacebook = "3";
  static const String APP_KEY = "app_key";
  static const String USER_EXISTS = "userExists";


  //get user profile//
  static const String ARR_EVENTS_ATTENDED= "arrEventsAttended";
  static const String SHOW_UP_ID= "showUpId";
  static const String EVENT_NAME= "eventName";
  static const String SHOW_UP= "showUp";
  static const String TOTAL_SHOW_UP_COUNT= "totalShowUpCount";
  static const String USERS_ATTENDING= "usersAttending";
  static const String USERS_ATTENDING_SHOW_UP_ID= "userAttendingShowUpId";
  static const String FOLLOWER_COUNT= "followerCount";
  static const String FOLLOWING_COUNT= "followingCount";
  static const String COUNTRY_ID= "countryId";
  static const String COUNTRY_CODE= "countryCode";
  static const String ARR_COUNTRIES= "arrCountries";
  static const String ARR_COUNTRIES_STATES= "arrCountriesStates";
  static const String STATE_CODE= "stateCode";
  static const String STATEID= "stateId";
  static const String ARR_EVENTS_USERS_POST = "arrEventsUsersPost";
  static const String LIKE_COUNT = "likeCount";
  static const String POSTS_MEDIA = "postsMedia";
  static const String COMMENT_ID = "commentId";
  static const String COMMENTS = "comments";
  static const String LIKED_BY_ME = "likedByMe";
  static const String COMMENT_COUNT = "commentCount";
  static const String CURRENT_PASSWORD = "currentPassword";
  static const String NEW_PASSWORD = "newPassword";
  static const String FOLLOWER_ID = "followerId";
  static const String ARTIST_PROFILE_FRAGMENT = "ArtistProfileFragment";

  //______Get Event Api Key______//
  static const String APPVERSION = "appVersion";
  static const String SEARCH_TEXT = "searchText";
  static const String EVENT_FLAG = "eventFlag";
  static const String FIRSTNAME = "firstName";
  static const String LASTNAME = "lastName";
  static const String EVENT_MEDIA = "eventsMedia";

  //______Get Link Api Key______//
  static const String STR_LINKS = "strLinks";
  static const String PRIVACY_LINK = "privacyLink";
  static const String TERMS_LINK = "termsLink";
  static const String TITLE = "title";
  static const String POST_LIKED_COUNT = "postLikedCounts";
  static const String POST_LIKEDBY_USER = "postLikedByUser";



  static const String INTEREST_CATEGORY_ID = "interestCategoryId";
  static const String INTEREST_CATEGORY_IDS = "interestCategoryIds";


  static const String SUBJECT = "subject";

  //______Get Artist  Key______//
  static const String ARTIST_ID = "artistId";
  static const String NICK_NAME = "nick_name";
  static const String COVER_PIC = "cover_pic";
  static const String ARTIST_INTERESTS = "artistInterests";
  static const String ARTIST_INTERESTS_CATEGORY_ID = "artistInterestCategoryId";
  static const String INTERESTS_NAME= "interestName";
  static const String IS_ARTIST = "isArtist";
  static const String ARTIST = "artist";
  static const String ISARTIST = "is_artist";
  static const String COUNT = "count";

  //______Get All Notification  Key______//
  static const String NOTIFICATION_ID = "notificationId";
  static const String NOTIFICATION_FOR = "notificationFor";
  static const String SEEN = "seen";
  static const String CREATEDON = "createdOn";
  static const String CREATED_BY = "createdBy";
  static const String DATA = "data";
  static const String SENT_BY_ADMIN = "sentByAdmin";
  static const String RECORD_ID = "recordId";
  static const String TABLE_ID = "tableId";
  static const String FULL_NAME = "fullName";



  static const String USER = 'users';
  static const String HOME_PAGE_FRAGMENT = "homePageFragment";
  static const String PROFILE_FRAGMENT = "ProfileMainPage";
  static const String EVENTS = "EventsFragment";
  static const String MAPS = "Maps";













}