import 'package:appdemo/employees/employee_model.dart';
import 'package:appdemo/employees/get_employee_list.dart';
import 'package:appdemo/notificaton/notification_model.dart';
import 'package:appdemo/services/api.dart';
import 'package:flutter/material.dart';
class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});
  static String routeName = "notificaton_screen";
  @override
  State<NotificationScreen> createState() => _NotificationScreen();
}

class _NotificationScreen extends State<NotificationScreen> {
  Future<List<EmployeeData>?> DataList() async {
    final List<EmployeeData>? dataList = await getDataEmployeeFromApi();

    return dataList;
  }

  List<EmployeeData> _employee = [];
  void fetchEmployeeData() async {
    _employee = (await DataList())!;
  }

  String getUserNotification(int user_id) {
    String name = '';
    for (EmployeeData employee in _employee) {
      if (employee.id == user_id) {
        name = employee.displayname;
        break;
      }
    }
    return name;
  }


  @override
  void initState() {
    super.initState();
    fetchEmployeeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Thông Báo',
        ),
      ),
      backgroundColor: Colors.blue,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: Colors.white),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Flexible(
              child: FutureBuilder<NotificationModel?>(
                  future: DemoAPI().dioGetNotificationData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data!.data!.isNotEmpty) {
                        return ListView.builder(
                            itemCount: snapshot.data!.total,
                            itemBuilder: (context, index) {  
                              return Container(
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    Container(
                                        padding: EdgeInsets.all(13),
                                        width: 300,
                                        decoration: const BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 242, 241, 241),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Thời gian: ' +
                                                snapshot.data!.data![index].createdAt!),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text('Nội dung: ' +
                                                snapshot.data!.data![index]
                                                    .data!.content!),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text('Người gửi: ' +
                                                getUserNotification(snapshot
                                                    .data!
                                                    .data![index]
                                                    .data!
                                                    .userId!))
                                          ],
                                        )),
                                    SizedBox(
                                      height: 30,
                                    )
                                  ],
                                ),
                              );
                            });
                      } else
                        return Text('Không có thông báo');
                    } else {
                      return Center(child: const CircularProgressIndicator());
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
