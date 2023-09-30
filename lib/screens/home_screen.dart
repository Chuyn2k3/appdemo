import 'package:appdemo/departments/department_screen.dart';
import 'package:appdemo/notificaton/notification_screen.dart';
import 'package:appdemo/services/api.dart';
import 'package:appdemo/user/user_model.dart';

import 'package:flutter/material.dart';
import 'package:appdemo/devices/device_screen.dart';
import 'package:appdemo/error/error_screen.dart';
import 'package:appdemo/employees/employee_screen.dart';
import 'package:appdemo/statistic/statistic_screen.dart';
import 'package:appdemo/inventory/myInventory_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String routeName = 'home_screen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime pre_backpress = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          final timegap = DateTime.now().difference(pre_backpress);
          pre_backpress = DateTime.now();
          final canExit = timegap >= const Duration(seconds: 2);
          if (canExit) {
            const snack = SnackBar(
              content: Text('Ấn 2 lần để thoát'),
              duration: Duration(seconds: 2),
            );
            ScaffoldMessenger.of(context).showSnackBar(snack);
            return false;
          } else {
            return true;
          }
        },
        child: FutureBuilder<UserModel?>(
            future: DemoAPI().dioGetlogin(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Scaffold(
                  backgroundColor: Colors.blueAccent,
                  body: Stack(children: [
                    Column(children: [
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 25,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                      radius: 14,
                                      child: Image.asset(
                                          'assets/images/logo-bo-y-te.jpg'),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Row(
                                        children: [
                                          Text('Xin chào',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white)),
                                          Icon(
                                            Icons.back_hand,
                                            size: 20,
                                            color: Colors.yellow,
                                          )
                                        ],
                                      ),
                                      Text(
                                        snapshot.data!.data!.displayname!,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, NotificationScreen.routeName);
                                  },
                                  child: const Icon(
                                    Icons.notifications,
                                    color: Colors.yellow,
                                    size: 45,
                                  ))
                            ],
                          ),
                        ),
                      )
                    ]),
                    const SizedBox(height: 50),
                    Positioned.fill(
                        top: 100,
                        child: Container(
                          height: double.infinity,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25))),
                          child: GridView(
                            padding: const EdgeInsets.only(
                                top: 20, right: 60, left: 60, bottom: 30),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 50,
                                    crossAxisSpacing: 50),
                            children: [
                              InkWell(
                                highlightColor:
                                    Colors.grey, //hiệu ứng khi giữ lâu
                                splashColor: Colors.red, //hiệu ứng khi chạm vào
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, DeviceScreen.routeName);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color:
                                        const Color.fromRGBO(237, 235, 235, 1),
                                  ),
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.medical_services,
                                        size: 60,
                                        color: Color.fromARGB(255, 238, 52, 39),
                                      ),
                                      Text(
                                        "Thiết Bị",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, ErrorScreen.routeName);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color:
                                        const Color.fromRGBO(237, 235, 235, 1),
                                  ),
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.notification_important,
                                        size: 60,
                                        color: Colors.orange,
                                      ),
                                      Text(
                                        "Báo Hỏng",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, DepartmentScreen.routeName);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color:
                                        const Color.fromRGBO(237, 235, 235, 1),
                                  ),
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.business,
                                        size: 60,
                                        color: Color.fromRGBO(110, 139, 61, 1),
                                      ),
                                      Text(
                                        "Khoa Phòng",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, EmployeeScreen.routeName);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color:
                                        const Color.fromRGBO(237, 235, 235, 1),
                                  ),
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.person,
                                        size: 60,
                                        color: Color.fromARGB(255, 33, 180, 38),
                                      ),
                                      Text(
                                        "Nhân Viên",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, StatisticScreen.routeName);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color:
                                        const Color.fromRGBO(237, 235, 235, 1),
                                  ),
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.analytics,
                                        size: 60,
                                        color:
                                            Color.fromARGB(255, 210, 104, 139),
                                      ),
                                      Text(
                                        "Thống Kê",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, myInventoryScreen.routeName);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color:
                                        const Color.fromRGBO(237, 235, 235, 1),
                                  ),
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.inventory,
                                        size: 60,
                                        color: Color(0xFF045EA9),
                                      ),
                                      Text(
                                        "Kiểm kê",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ]),
                );
              } else {
                return const Center(child:CircularProgressIndicator());
              }
            })
        );
  }
}
