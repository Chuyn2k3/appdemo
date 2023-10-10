import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

Future showDialogCustomize(BuildContext context,DialogType dialogType,String title,String desc){
  return AwesomeDialog(
  context: context,
  dialogType: dialogType,
  animType: AnimType.topSlide,
  showCloseIcon: true,
  title: title,
  desc:desc,
  btnCancelOnPress: (){}
  ).show();
}