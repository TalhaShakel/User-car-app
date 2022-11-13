
import 'package:firebase_auth/firebase_auth.dart';
import 'package:users_app/models/user_model.dart';
import '../models/directions_details_info.dart';

final FirebaseAuth fAuth = FirebaseAuth.instance;
User? currentFirebaseUser;
UserModel? userModelCurrentInfo;
bool ? block ;
List dList = []; //online/active drivers Information List
DirectionDetailsInfo? tripDirectionDetailsInfo;
String? chosenDriverId="";
String cloudMessagingServerToken = "key=AAAALBO6RNI:APA91bH_BNX3U9ksiF6ajyDhMHGlfd4cOGEgF2Tt10zxsBgImtY-ww7xj2cbRisa9Zxb13t7yqdF7tLSj7AxV2p9njL4koxIx05xHOhj4q6aJql0VTQ4eoAuAJ066S-U7CmhOMohX95k";
String userDropOffAddress="";
String driverCarDetails="";
String driverName="";
String driverPhone="";
double countRatingStars=0.0;
String titleStarsRating="";