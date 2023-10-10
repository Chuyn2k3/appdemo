import 'package:appdemo/authentication/page/login_screen.dart';
import 'package:appdemo/data/term/app_term.dart';
import 'package:appdemo/screens/setting_screen.dart';
import 'package:appdemo/services/show_dialog_widget.dart';
import 'package:appdemo/user/bloc/logout_bloc.dart';
import 'package:appdemo/user/bloc/logout_bloc_event.dart';
import 'package:appdemo/user/bloc/logout_bloc_state.dart';
import 'package:appdemo/user/model/user_model.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget showUserInformatin(UserModel user) {
  return Container(
    margin: const EdgeInsets.all(10),
    width: double.infinity,
    height: 450,
    decoration: const BoxDecoration(
        color: Color.fromARGB(255, 244, 242, 242),
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20))),
    child: Column(children: [
      CircleAvatar(
        backgroundColor: const Color.fromARGB(255, 230, 228, 228),
        radius: 60,
        child: CircleAvatar(
          radius: 40,
          child: Image.asset('assets/images/rounded-in-photoretrica.png'),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Text(
        user.data!.displayname!,
        style: const TextStyle(
            fontSize: 27, color: Colors.black, fontWeight: FontWeight.bold),
      ),
      Divider(
        color: Colors.blue[700],
        thickness: 1.4,
        indent: 20,
        endIndent: 20,
      ),
      Container(
          margin:
              const EdgeInsets.only(top: 10, right: 30, left: 30, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Số điện thoại:',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Khoa/Phòng:',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500))
                  ]),
              Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Text(user.data!.phone,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.black)),
                const SizedBox(
                  height: 10,
                ),
                const Text('Không có dữ liệu',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.black))
              ])
            ],
          )),
      Divider(
        color: Colors.blue[700],
        thickness: 1.4,
        indent: 20,
        endIndent: 20,
      ),
      Container(
          margin:
              const EdgeInsets.only(top: 10, right: 30, left: 30, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Chức vụ:',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Giới tính:',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500))
                  ]),
              Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                const Text('Administrator',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.black)),
                const SizedBox(
                  height: 10,
                ),
                Text(user.data!.gender,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.black))
              ])
            ],
          )),
      Divider(
        color: Colors.blue[700],
        thickness: 1.4,
        indent: 20,
        endIndent: 20,
      ),
      Container(
          margin:
              const EdgeInsets.only(top: 10, right: 30, left: 30, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email:',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Địa chỉ:',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500))
                  ]),
              Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Text(user.data!.email,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.black)),
                const SizedBox(
                  height: 10,
                ),
                Text(
                    (user.data!.address == null)
                        ? 'Không có dữ liệu'
                        : user.data!.address,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.black))
              ])
            ],
          )),
    ]),
  );
}

Widget displaySetting(BuildContext context) {
  DataLogoutBloc fetchLogout = DataLogoutBloc();
  return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(255, 234, 231, 231)),
      child: Column(children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, SettingScreen.routeName);
          },
          child: Container(
              height: 40,
              width: double.infinity,
              margin:
                  const EdgeInsets.only(top: 5, bottom: 5, right: 10, left: 10),
              alignment: Alignment.center,
              child: const Stack(
                alignment: Alignment.center,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Icon(Icons.settings),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Cài đặt',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Positioned(
                    right: 3,
                    child: Icon(
                      Icons.keyboard_arrow_right,
                      size: 24.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              )),
        ),
        Divider(
          color: Colors.blue[700],
          thickness: 1.4,
          indent: 20,
          endIndent: 20,
        ),
        GestureDetector(
            onTap: () {
              fetchLogout.add(FetchLogout());
            },
            child: Container(
                height: 40,
                width: double.infinity,
                margin: const EdgeInsets.only(
                    top: 5, bottom: 5, right: 10, left: 10),
                alignment: Alignment.center,
                child: const Stack(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Icon(Icons.logout),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Đăng xuất',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Positioned(
                      right: 3,
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        size: 24.0,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ))),
        BlocConsumer<DataLogoutBloc, DataLogoutState>(
            listener: (context, state) {
              if (state is DataLogoutLoaded) {
                if (state.data.statusCode == 200) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, LoginScreen.routeName, (route) => false);
                }
              } else if (state is DataLogoutError) {
                showDialogCustomize(
                    context, DialogType.error, DialogTitle.error, state.error);
              }
            },
            bloc: fetchLogout,
            builder: (context, state) {
              if (state is DataLogoutLoading) {
                return Positioned(
                  top: 0,
                  left: 170,
                  child: Visibility(
                      visible: true, child: CircularProgressIndicator()),
                );
              }
              return SizedBox();
            })
      ]));
}
