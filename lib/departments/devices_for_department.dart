// ignore_for_file: avoid_unnecessary_containers
import 'package:appdemo/services/api.dart';
import 'package:appdemo/devices/model/device_model.dart';
import 'package:appdemo/departments/department_model.dart';
import 'package:appdemo/devices/get_device_list.dart';
import 'package:flutter/material.dart';
import 'package:appdemo/devices/page/devices/detail_screen.dart';

class DeviceInDepartmentScreen extends StatefulWidget {
  final DepartmentData getDepartmentData;
  const DeviceInDepartmentScreen({super.key, required this.getDepartmentData});
  @override
  State<DeviceInDepartmentScreen> createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceInDepartmentScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  bool isLoading = false;

  Future<List<DeviceData>?> DataList() async {
    final List<DeviceData>? dataList = await getDataFromApi();
    return dataList;
  }

  List<DeviceData> _devices = [];
  List<DeviceData> _defaultDevice = [];

  void fetchData() async {
    _defaultDevice = (await DataList())!;
    _devices = _defaultDevice
        .where(
            (element) => (element.departmentId == widget.getDepartmentData.id))
        .toList();
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> _retryDataLoad() async {
    try {
      reApplySelection();
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
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          elevation: 0,
          title: const Text('Danh Sách Thiết Bị'),
          centerTitle: true,
        ),
        body: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Column(children: [
              Container(
                margin: const EdgeInsets.all(8),
                alignment: Alignment.center,
                child: Text(
                  '--- ${widget.getDepartmentData.title} ---',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
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
                        onChanged: searchDevice,
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
                            hintText: 'Tên thiết bị,mã thiết bị,...',
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
                        height: 49.55,
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
                            searchDevice(
                                _textEditingController.text.toString());
                          },
                        )),
                  ),
                ],
              ),
              isLoading
                  ? const CircularProgressIndicator()
                  : Flexible(
                      child: FutureBuilder<DeviceModel?>(
                          future: DemoAPI().dioGetDeviceData(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              if (_devices.isNotEmpty) {
                                return ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: _devices.length,
                                    itemBuilder: (context, index) {
                                      if (_devices.isNotEmpty) {
                                        return GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          DetailsScreen(
                                                              _devices[
                                                                  index])));
                                            },
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
                                              child: Expanded(
                                                child: Row(
                                                  children: [
                                                    const CircleAvatar(
                                                      backgroundImage: AssetImage(
                                                          'assets/images/logo-bo-y-te.jpg'),
                                                      radius: 30,
                                                    ),
                                                    const SizedBox(
                                                      width: 30,
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
                                                            _devices[index]
                                                                .title,
                                                            style: const TextStyle(
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                          Text(
                                                            'Model: ${_devices[index].model}',
                                                            style: const TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                          Text(
                                                            'Serial: ${_devices[index].serial}',
                                                            style: const TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                          Text(
                                                              'Trạng thái: ${_devices[index].status}',
                                                              style: const TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400)),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ));
                                      } else {
                                        return Container(
                                          child: const Text(
                                              'Không có thiết bị nào'),
                                        );
                                      }
                                    });
                              } else {
                                return Container(
                                  child: Column(
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
                                  ),
                                );
                              }
                            } else {
                              return Container(
                                  child: const CircularProgressIndicator());
                            }
                          }))
            ])));
  }

  void searchDevice(String query) async {
    setState(() {
      isLoading = true;
    });
    final suggestions = _devices.where((element) {
      final deviceTitle = element.title.toLowerCase();
      final input = query.toLowerCase();
      return deviceTitle.contains(input);
    }).toList();
    setState(() {
      _devices = suggestions;
      isLoading = false;
    });
  }

  void reApplySelection() {
    searchDevice(_textEditingController.text.toString());
  }
}
