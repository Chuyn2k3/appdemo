import 'package:appdemo/employees/employee_model.dart';
import 'package:appdemo/employees/get_employee_list.dart';
import 'package:appdemo/services/api.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({super.key});
  static String routeName = "employee_screen";
  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  Future<List<EmployeeData>?> DataList() async {
    final List<EmployeeData>? dataList = await getDataEmployeeFromApi();

    // Lọc danh sách dựa trên điều kiện
    return dataList;
  }

  List<EmployeeData> _employee = [];
  void fetchEmployeeData() async {
    _employee = (await DataList())!;
  }

  bool isLoading = false;

  void searchEmployee(String query) async {
    setState(() {
      isLoading = true;
    });
    final List<EmployeeData>? result = await getDataEmployeeFromApi();
    final suggestions = result!.where((element) {
      final employeeTitle = element.displayname.toLowerCase();
      final input = query.toLowerCase();
      return employeeTitle.contains(input);
    }).toList();
    setState(() {
      _employee = suggestions;
      isLoading = false;
    });
  }

  Future<void> _retryDataLoad() async {
    try {
      searchEmployee(_textEditingController.text.toString());
    } catch (error) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Lỗi'),
            content: Text('Đã xảy ra lỗi khi tải dữ liệu: $error'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Đóng hộp thoại lỗi
                },
                child: const Text('Đóng'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    fetchEmployeeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          elevation: 0,
          title: const Text('Nhân Viên'),
          centerTitle: true,
        ),
        body: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Column(children: [
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      margin: const EdgeInsets.only(top: 20, left: 20),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              bottomLeft: Radius.circular(30))),
                      child: TextFormField(
                        onChanged: searchEmployee,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 137, 37, 37)),
                        maxLength: 500,
                        controller: _textEditingController,
                        decoration: const InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(255, 227, 224, 224),
                            contentPadding: EdgeInsets.symmetric(vertical: 15),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  bottomLeft: Radius.circular(30)),
                              borderSide: BorderSide(width: 0.8),
                            ),
                            hintText: 'Tên nhân viên,email,SĐT,...',
                            prefixIcon: Icon(
                              Icons.search,
                              size: 30,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  bottomLeft: Radius.circular(30)),
                              borderSide: BorderSide(width: 0.8),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  bottomLeft: Radius.circular(30)),
                              borderSide: BorderSide(
                                width: 4,
                                color: Colors.blue,
                              ),
                            )),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                        height: 49,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomRight: Radius.circular(30)),
                          color: Color.fromARGB(255, 194, 190, 190),
                        ),
                        margin:
                            const EdgeInsets.only(top: 3, right: 20, bottom: 5),
                        child: TextButton(
                          child: const Text(
                            'Tìm kiếm',
                            style: TextStyle(fontSize: 13, color: Colors.black),
                          ),
                          onPressed: () {
                            searchEmployee(
                                _textEditingController.text.toString());
                          },
                        )),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                      margin: const EdgeInsets.only(left: 30),
                      child: const Text(
                        'Bấm vào thông tin nhân viên để liên lạc',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w400),
                      ))
                ],
              ),
              isLoading
                  ? const CircularProgressIndicator()
                  : Flexible(
                      child: FutureBuilder<EmployeeModel?>(
                          future: DemoAPI().dioGetEmployeeData(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              if (_employee.isNotEmpty) {
                                return ListView.builder(
                                    //shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: _employee.length,
                                    itemBuilder: (context, index) {
                                      if (_employee.isNotEmpty) {
                                        return GestureDetector(
                                            onTap: () {},
                                            child: Container(
                                              margin: const EdgeInsets.all(20),
                                              padding: const EdgeInsets.only(
                                                  right: 30, left: 30),
                                              height: 100,
                                              decoration: BoxDecoration(
                                                  color: const Color.fromARGB(
                                                      255, 241, 239, 239),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Row(
                                                children: [
                                                  const CircleAvatar(
                                                    backgroundImage: AssetImage(
                                                        'assets/images/logo-bo-y-te.jpg'),
                                                    radius: 30,
                                                  ),
                                                  const SizedBox(
                                                    width: 20,
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          _employee[index]
                                                              .displayname,
                                                          style: const TextStyle(
                                                              fontSize: 15,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          children: [
                                                            const Icon(
                                                                Icons
                                                                    .email_outlined,
                                                                size: 17),
                                                            const SizedBox(
                                                              width: 5,
                                                            ),
                                                            GestureDetector(
                                                              onTap: () async{
                                                                String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((MapEntry<String, String> e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}
                                                           final Uri emailUrl = Uri(
                                                      scheme: 'mailto',
                                                      path: _employee[index]
                                                                    .email,
                                                      query: encodeQueryParameters(<String, String>{
      'subject': 'Example Subject & Symbols are allowed!',
    }),    );

                                                   try{
                                                    await launchUrl(emailUrl);
                                                   }catch(e){                                             
                                                     showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Thông báo'),
              content: Text('Lỗi chuyển hướng'),
            );
          },
        );
                                                  }
                                                              },
                                                              child: Text(
                                                                _employee[index]
                                                                    .email,
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                            height: 10),
                                                        Row(
                                                          children: [
                                                            const Icon(
                                                              Icons
                                                                  .phone_android_outlined,
                                                              size: 17,
                                                            ),
                                                            const SizedBox(
                                                              width: 5,
                                                            ),
                                                            GestureDetector(
                                                              onTap: () async{
                                                                 final Uri phoneUrl = Uri(
                                                      scheme: 'tel',
                                                      path:  _employee[index]
                                                                    .phone);

                                                  if (await canLaunchUrl(phoneUrl)) {
                                                    await launchUrl(phoneUrl);
                                                  }
                                                  else {
                                                    showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Thông báo'),
              content: Text('Lỗi chuyển hướng'),
            );
          },
        );
                                                  }
                                                              },
                                                              child: Text(
                                                                _employee[index]
                                                                    .phone,
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ));
                                      } else {
                                        return const Text(
                                            'Không tìm thấy nhân viên');
                                      }
                                    });
                              } else {
                                return Column(
                                  children: [
                                    ElevatedButton(
                                      onPressed: _retryDataLoad,
                                      child: const Text('Tải lại'),
                                    ),
                                    const SizedBox(
                                      height: 50,
                                    ),
                                    const Text('Không có thiết bị cần tìm')
                                  ],
                                );
                              }
                            } else {
                              return const CircularProgressIndicator();
                            }
                          }))
            ])));
  }
}
