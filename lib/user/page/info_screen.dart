import 'package:appdemo/home/cubit/cubit.dart';
import 'package:appdemo/user/widget/user_information_widget.dart';
import 'package:appdemo/user/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfoScreen extends StatefulWidget {
  static String routeName = 'info_screen';

  const InfoScreen({super.key});
  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataCubit, UserModel>(builder: (context, user) {
      return Scaffold(
          backgroundColor: Colors.blue,
          appBar: AppBar(
            elevation: 0,
            title: const Text('Cá nhân'),
            centerTitle: true,
          ),
          body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20))),
              child: ListView(children: [
                Column(children: [
                  showUserInformatin(user),
                  
                  displaySetting(context)
                ])
              ])));
    });
  }
}
