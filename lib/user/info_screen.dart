import 'package:appdemo/screens/login_screen.dart';
import 'package:appdemo/screens/setting_screen.dart';
import 'package:appdemo/services/api.dart';
import 'package:appdemo/user/logout_model.dart';
import 'package:appdemo/user/user_model.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {
  static String routeName = 'info_screen';

  const InfoScreen({super.key});
  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
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
            child: FutureBuilder<UserModel?>(
                future: DemoAPI().dioGetlogin(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView(children: [
                      Column(children: [
                        Container(
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
                              backgroundColor:
                                  const Color.fromARGB(255, 230, 228, 228),
                              radius: 60,
                              child: CircleAvatar(
                                radius: 40,
                                child: Image.asset(
                                    'assets/images/rounded-in-photoretrica.png'),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              snapshot.data!.data!.displayname!,
                              style: const TextStyle(
                                  fontSize: 27,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Divider(
                              color: Colors.blue[700],
                              thickness: 1.4,
                              indent: 20,
                              endIndent: 20,
                            ),
                            Container(
                                margin: const EdgeInsets.only(
                                    top: 10, right: 30, left: 30, bottom: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Số điện thoại:',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text('Khoa/Phòng:',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500))
                                        ]),
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(snapshot.data!.data!.phone,
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
                                margin: const EdgeInsets.only(
                                    top: 10, right: 30, left: 30, bottom: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Chức vụ:',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text('Giới tính:',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500))
                                        ]),
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          const Text('Administrator',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.black)),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(snapshot.data!.data!.gender,
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
                                margin: const EdgeInsets.only(
                                    top: 10, right: 30, left: 30, bottom: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Email:',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text('Địa chỉ:',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500))
                                        ]),
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(snapshot.data!.data!.email,
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.black)),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                              (snapshot.data!.data!.address ==
                                                      null)
                                                  ? 'Không có dữ liệu'
                                                  : snapshot
                                                      .data!.data!.address,
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.black))
                                        ])
                                  ],
                                )),
                          ]),
                        ),
                        Container(
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color:
                                    const Color.fromARGB(255, 234, 231, 231)),
                            child: Column(children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, SettingScreen.routeName);
                                },
                                child: Container(
                                    height: 40,
                                    width: double.infinity,
                                    margin: const EdgeInsets.only(
                                        top: 5, bottom: 5, right: 10, left: 10),
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
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500),
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
                                  onTap: () async {
                                    try {
                                      LogoutModel? log= await DemoAPI().dioLogout();
                                      if(log!.statusCode==200){
                                      Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        LoginScreen.routeName,
                                        (route) => false);
                                    }
                                    } catch (e) {
                                           showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const AlertDialog(
                                  title: Text('Thông báo'),
                                  content: Text('Đăng xuất thất bại'),
                                );
                              },
                            );
                                    }
                                    
                                  },
                                  child: Container(
                                      height: 40,
                                      width: double.infinity,
                                      margin: const EdgeInsets.only(
                                          top: 5,
                                          bottom: 5,
                                          right: 10,
                                          left: 10),
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
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w500),
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
                            ]))
                      ])
                    ]);
                  } else {
                    return const Text('error');
                  }
                })));
  }
}
