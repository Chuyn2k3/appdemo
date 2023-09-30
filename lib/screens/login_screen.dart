// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:appdemo/services/api.dart';
import 'package:appdemo/services/store.dart';
import 'package:appdemo/user/user_model.dart';
import 'package:flutter/material.dart';
import 'package:appdemo/screens/Myhome_screen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String routeName = 'login_screen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formfield = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool radioValue = false;
  bool passToggle = true;
  final emailStore = new FlutterSecureStorage();
  final passwordStore = new FlutterSecureStorage();
  final _keyEmail = "email";
  final _keyPassword = "password";
  final _keyEmail1 = "email1";
  final _keyPassword1 = "password1";
  bool isLoading = false;
  String? email;
  String? password;
  void getEmailAndPassword() async {
    email = await emailStore.read(key: _keyEmail);
    password = await passwordStore.read(key: _keyPassword);
    if (email==null) {
      email = await emailStore.read(key: _keyEmail1);
      password = await passwordStore.read(key: _keyPassword1);
    }
    setState(() {
      emailController.text = email!;
      passController.text = password!;
      if (emailController.text.isNotEmpty) {
        setState(() {
          radioValue = true;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getEmailAndPassword();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SingleChildScrollView(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
                child: SafeArea(
                    child: Form(
                  key: _formfield,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/logo-bo-y-te.jpg',
                        width: 100,
                        height: 100,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email),
                        ),
                        validator: (value) {
                          bool emailVaild = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value!);
                          if (value.isEmpty) {
                            return "Nhập email";
                          } else if (!emailVaild) {
                            return "Nhập email hợp lệ";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: passController,
                        keyboardType: TextInputType.text,
                        obscureText: passToggle,
                        decoration: InputDecoration(
                            labelText: 'Mật khẩu',
                            border: const OutlineInputBorder(),
                            prefixIcon: const Icon(Icons.lock),
                            suffix: InkWell(
                              onTap: () {
                                setState(() {
                                  passToggle = !passToggle;
                                });
                              },
                              child: Icon(passToggle
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            )),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Nhập mật khẩu";
                          } else if (passController.text.length < 6) {
                            return "Mật khẩu phải dài hơn 6 ký tự";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Quên mật khẩu',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w200),
                            ),
                            Row(
                              children: [
                                Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.red),
                                  value: radioValue,
                                  groupValue: true,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      radioValue = !radioValue;
                                    });
                                  },
                                  toggleable: true, //giup bat tat button
                                ),
                                const Text(
                                  'Ghi nhớ',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300),
                                )
                              ],
                            ),
                          ]),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () async {
                          if (_formfield.currentState!.validate()) {
                            try {
                              setState(() {
                                isLoading = true;
                              });
                              StoreLogin.setLoginUser(
                                  emailController.text, passController.text);
                              UserModel? loginResult = await DemoAPI().diologin(
                                  emailController.text.toString(),
                                  passController.text.toString());
                              if (loginResult!.statusCode == 200) {
                                await emailStore.write(
                                    key: _keyEmail1,
                                    value: emailController.text);
                                await passwordStore.write(
                                    key: _keyPassword1,
                                    value: passController.text);
                                if (radioValue == true) {
                                  await emailStore.write(
                                      key: _keyEmail,
                                      value: emailController.text);
                                  await passwordStore.write(
                                      key: _keyPassword,
                                      value: passController.text);
                                } else if (radioValue == false) {
                                  emailStore.delete(key: _keyEmail);
                                  passwordStore.delete(key: _keyPassword);
                                }
                                Navigator.pushNamedAndRemoveUntil(context,
                                    MyhomeScreen.routeName, (route) => false);
                              }
                            } catch (e) {
                              setState(() {
                                isLoading = false;
                              });
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return const AlertDialog(
                                    title: Text('Thông báo'),
                                    content: Text(
                                        'Tài khoản hoặc mật khẩu không chính xác'),
                                  );
                                },
                              );
                              Future.delayed(const Duration(milliseconds: 500), () {
                                Navigator.of(context).pop();
                              });
                            }
                          }
                        },
                        child: Container(
                            height: 50,
                            decoration: const BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                            ),
                            child: Center(
                                child: Text(
                              'ĐĂNG NHẬP',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ))),
                      )
                    ],
                  ),
                )))),
        Positioned(
          top: 330,
          left: 170,
          child: Visibility(
              visible: isLoading, child: CircularProgressIndicator()),
        )
      ],
    ));
  }
}
