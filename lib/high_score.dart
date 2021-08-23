import 'package:minor_project/user_data.dart';

class HighScore{

  static setHigh1(){

  MySharedPreferences.instance.setIntegerValue("java_hs", 0);
  MySharedPreferences.instance.setIntegerValue("py_hs", 0);
  MySharedPreferences.instance.setIntegerValue("c_hs", 0);    
  }

}
