import 'package:flutter/cupertino.dart';

Map<String, dynamic> validateEmailAddress({required String email}) {
  Map<String, dynamic> result = {'valid' : false, 'sms' : 'No es valido.'};
  const emailRegex =
  r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(email)) {
    result['valid'] = true;
    result['sms'] = '';
    return result;
  } else {
    result['valid'] = false;
    result['sms'] = 'Invalid mail';
    return result;
  }
}


Map<String, dynamic> validatePassword({required String input}) {
  Map<String, dynamic> result = {'valid' : false, 'sms' : 'No es valido.'};
  String oneNumber = r'^.*[0-9].*$';
  String oneLowerCase = r'^.*[a-z].*$';
  String oneUpperCase = r'^.*[A-Z].*$';
  if (input.length < 8) {
    result['valid'] = false;
    result['sms'] = 'Must contain eight (8) characters';
    return result;
  } else if (!RegExp(oneNumber).hasMatch(input)) {
    result['valid'] = false;
    result['sms'] = 'Must contain at least one number';
    return result;
  } else if (!RegExp(oneLowerCase).hasMatch(input)) {
    result['valid'] = false;
    result['sms'] = 'Must contain at least one lowercase letter';
    return result;
  } else if (!RegExp(oneUpperCase).hasMatch(input)) {
    result['valid'] = false;
    result['sms'] = 'Must contain at least one capital letter';
    return result;
  }
  result['valid'] = true;
  result['sms'] = '';
  return result;
}