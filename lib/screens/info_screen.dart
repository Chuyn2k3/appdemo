import 'package:appdemo/screens/login_screen.dart';
import 'package:appdemo/screens/setting_screen.dart';
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
          //automaticallyImplyLeading: false,
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
                      backgroundColor: const Color.fromARGB(255, 230, 228, 228),
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
                    const Text(
                      'Pham Thanh Long',
                      style: TextStyle(
                          fontSize: 27,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Divider(
                      //Divider tạo dòng kẻ ngang
                      color: Colors.blue[700], // Màu của dòng kẻ
                      thickness: 1.4, // Độ dày của dòng kẻ
                      indent: 20, // Khoảng cách từ lề trái
                      endIndent: 20, // Khoảng cách từ lề phải
                    ),
                    Container(
                        margin: const EdgeInsets.only(
                            top: 10, right: 30, left: 30, bottom: 10),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Số điện thoại:',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text('Khoa/Phòng:',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500))
                                ]),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('0342702590',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black)),
                                  Text('Không có dữ liệu',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black))
                                ])
                          ],
                        )),
                    Divider(
                      //Divider tạo dòng kẻ ngang
                      color: Colors.blue[700], // Màu của dòng kẻ
                      thickness: 1.4, // Độ dày của dòng kẻ
                      indent: 20, // Khoảng cách từ lề trái
                      endIndent: 20, // Khoảng cách từ lề phải
                    ),
                    Container(
                        margin: const EdgeInsets.only(
                            top: 10, right: 30, left: 30, bottom: 10),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Chức vụ:',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text('Giới tính:',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500))
                                ]),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('Administrator',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black)),
                                  Text('Không có dữ liệu',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black))
                                ])
                          ],
                        )),
                    Divider(
                      //Divider tạo dòng kẻ ngang
                      color: Colors.blue[700], // Màu của dòng kẻ
                      thickness: 1.4, // Độ dày của dòng kẻ
                      indent: 20, // Khoảng cách từ lề trái
                      endIndent: 20, // Khoảng cách từ lề phải
                    ),
                    Container(
                        margin: const EdgeInsets.only(
                            top: 10, right: 30, left: 30, bottom: 10),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Email:',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text('Địa chỉ:',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500))
                                ]),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('chuyenp32@gmail.com',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black)),
                                  Text('Bách khoa,Hà Nội',
                                      style: TextStyle(
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
                        color: const Color.fromARGB(255, 234, 231, 231)),
                    child: Column(children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, SettingScreen.routeName);
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
                        //Divider tạo dòng kẻ ngang
                        color: Colors.blue[700], // Màu của dòng kẻ
                        thickness: 1.4, // Độ dày của dòng kẻ
                        indent: 20, // Khoảng cách từ lề trái
                        endIndent: 20, // Khoảng cách từ lề phải
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, LoginScreen.routeName);
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
                              ))),
                    ]))
              ])
            ])));
  }
}
