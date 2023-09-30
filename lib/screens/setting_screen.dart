import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});
  static String routeName = 'setting_screen';
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isSwitched = false;
  bool isSwitchedKey = false;
  final emailStore = new FlutterSecureStorage();
  final passwordStore = new FlutterSecureStorage();
  bool isLoading = true;
  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
    } else {
      setState(() {
        isSwitched = false;
      });
    }
  }

  void toggleSwitchKey(bool value) {
    if (isSwitchedKey == false) {
      setState(() {
        isSwitchedKey = true;
      });
    } else {
      setState(() {
        isSwitchedKey = false;
      });
    }
  }

  void clearEmailAndPassword() {
    if (isSwitchedKey == false) {
      emailStore.delete(key: 'email1');
      passwordStore.delete(key: 'password1');
      emailStore.delete(key: 'email');
      passwordStore.delete(key: 'password');
    }
  }

  String? email;
  String? password;
  void getSaveEmailAndPassword() async {
    email = await emailStore.read(key: 'email');
    password = await passwordStore.read(key: 'password');
    if (email != null) {
      setState(() {
        isSwitchedKey = true;
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getSaveEmailAndPassword();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          elevation: 0,
          title: const Text('Cài Đặt'),
          centerTitle: true,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20))),
          child: Column(
            children: [
              isLoading?CircularProgressIndicator():
              Container(
                margin: const EdgeInsets.only(
                    top: 10, right: 10, left: 10, bottom: 10),
                height: 190,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 234, 231, 231)),
                child: Column(children: [
                  Container(
                      height: 70,
                      width: double.infinity,
                      margin:
                          const EdgeInsets.only(top: 5, right: 10, left: 10),
                      alignment: Alignment.center,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          const Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Icon(Icons.settings),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Lưu mật khẩu',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Positioned(
                              right: 3,
                              child: Switch(
                                value: isSwitchedKey,
                                onChanged: toggleSwitchKey,
                                activeColor: Colors.blue,
                                activeTrackColor:
                                    const Color.fromARGB(255, 171, 206, 235),
                                inactiveThumbColor:
                                    const Color.fromARGB(255, 234, 231, 231),
                                inactiveTrackColor: Colors.grey,
                              )),
                        ],
                      )),
                  Divider(
                    color: Colors.blue[700],
                    thickness: 1.4,
                    indent: 20,
                    endIndent: 20,
                  ),
                  Container(
                    height: 70,
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 5, right: 10, left: 10),
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        const Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Icon(Icons.logout),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Xác thực bằng vân tay',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Positioned(
                            bottom: -9,
                            right: 3,
                            child: Switch(
                              value: isSwitched,
                              onChanged: toggleSwitch,
                              activeColor: Colors.blue,
                              activeTrackColor:
                                  const Color.fromARGB(255, 171, 206, 235),
                              inactiveThumbColor:
                                  const Color.fromARGB(255, 234, 231, 231),
                              inactiveTrackColor: Colors.grey,
                            )),
                      ],
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ));
  }

  @override
  void dispose() {
    if (isSwitchedKey == false) {
      clearEmailAndPassword();
    }
    super.dispose();
  }
}
