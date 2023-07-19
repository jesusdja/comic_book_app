import 'package:comic_book_app/src/global/config/value_validators.dart';
import 'package:comic_book_app/src/global/widgets_utils/toast_widget.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {

  bool loadSave = false;

  bool _seePass = true;
  bool get seePass => _seePass;
  set seePass(bool value){ _seePass = value; notifyListeners(); }

  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPass = TextEditingController();

  Future<bool> register() async{

    String error = '';
    bool result = false;

    if(controllerEmail.text.isEmpty){
      error = 'Email required';
    }
    if(error.isEmpty && !validateEmailAddress(email: controllerEmail.text)['valid']){
      error = validateEmailAddress(email: controllerEmail.text)['sms'];
    }
    if(controllerPass.text.isEmpty){
      error = 'Password required';
    }
    if(error.isEmpty && !validatePassword(input: controllerPass.text)['valid']){
      error = validatePassword(input: controllerPass.text)['sms'];
    }

    if(error.isEmpty){

    }else{
      showAlert(text: error,isError: true);
    }

    return result;
  }
}
