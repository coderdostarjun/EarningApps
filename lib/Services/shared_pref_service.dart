import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefenceHelper
{
  static String userIdKey="USERKEY";
  static String userNameKey="USERNAMEKEY";
  static String bankNameKey="BANKNAMEKEY";
  static String accountNumberKey="ACCOUNTNUMBERKEY";

  Future<bool> saveUserId(String getUserId)async
  {
    SharedPreferences prefs=await SharedPreferences.getInstance();
    return prefs.setString(userIdKey, getUserId); //userIdKey should be unique
    //key(unique key) , value pair ma data store hunxa locally
  }
  Future<bool> saveUserName(String getUserName)async
  {
    SharedPreferences prefs=await SharedPreferences.getInstance();
    return prefs.setString(userNameKey,getUserName);
  }
Future<bool> saveBankName(String getBankName)async
  {
    SharedPreferences prefs=await SharedPreferences.getInstance();
    return prefs.setString(bankNameKey,getBankName);
  }

  Future<bool> saveAcoountNumber(String getAccountNumber)async
  {
    SharedPreferences prefs=await SharedPreferences.getInstance();
    return prefs.setString(accountNumberKey,getAccountNumber);
  }

  Future<String?> getUserId() async
  {
    SharedPreferences prefs=await SharedPreferences.getInstance();
    return prefs.getString(userIdKey);
  }
  Future<String?> getUserName() async
  {
    SharedPreferences prefs=await SharedPreferences.getInstance();
    return prefs.getString(userNameKey);
    //tehi key(unique key) ko help le data or value get garna sakxau juna locally store vako thiyo

  }
  Future<String?> getBankName() async
  {
    SharedPreferences prefs=await SharedPreferences.getInstance();
    return prefs.getString(bankNameKey);
  }
  Future<String?> getAccountNumber() async
  {
    SharedPreferences prefs=await SharedPreferences.getInstance();
    return prefs.getString(accountNumberKey);
  }

}