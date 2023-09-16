import 'package:appdemo/models/report_screen.dart';
import 'package:appdemo/screens/qr_screen.dart';
import 'package:appdemo/services/api.dart';
import 'package:appdemo/services/data_model.dart';
import 'package:appdemo/services/get_data_list.dart';
import 'package:flutter/material.dart';

import 'package:appdemo/models/detail_screen.dart';

class ErrorScreen extends StatefulWidget {
  const ErrorScreen({super.key});
  static String routeName = "error_screen";
  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  bool isLoading = false;
  // Future<List<Data>?> getDataFromApi() async {
  //   // Gọi API và nhận dữ liệu
  //   final GetDataModel? apiResponse = await DemoAPI().dioGetData();

  //   // Trích xuất danh sách kiểu Data từ apiResponse
  //   final List<Data>? dataJsonList = apiResponse!.data!.toList();

  //   // Chuyển đổi danh sách JSON thành danh sách kiểu Data
  //   // final List<Data> dataList = dataJsonList!.map((dataJson) {
  //   //   return Data.fromJson(dataJson as Map<String, dynamic>);
  //   // }).toList();

  //   return dataJsonList;
  // }

  Future<List<Data>> filterDataListByCondition() async {
    final List<Data>? dataList = await getDataFromApi();

    // Lọc danh sách dựa trên điều kiện
    final List<Data> filteredDataList = dataList!.where((data) {
      return data.status == 'active'; // Điều kiện ở đây
    }).toList();

    return filteredDataList;
  }

  List<Data> _errorDevice = [];
  void fetchErrorData() async {
    _errorDevice = (await filterDataListByCondition())!;
  }

  void initState() {
    super.initState();
    fetchErrorData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          elevation: 0,
          title: const Text('Báo Hỏng'),
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
                        onChanged: searchErrorDevice,
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
                            hintText: 'Tên/mã thiết bị còn hoạt động',
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
                            searchErrorDevice(
                                _textEditingController.text.toString());
                          },
                        )),
                  ),
                ],
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, QRScreen.routeName);
                  },
                  child: Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: const Color.fromARGB(255, 225, 222, 222)),
                      margin: const EdgeInsets.only(
                          top: 5, bottom: 5, right: 10, left: 10),
                      alignment: Alignment.center,
                      child: const Stack(
                        alignment: Alignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Quét mã QR',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Positioned(
                            right: 5,
                            child: Icon(
                              Icons.keyboard_arrow_right,
                              size: 27.0,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ))),
              Row(
                children: [
                  Container(
                      margin: const EdgeInsets.only(left: 30),
                      child: const Text(
                        'Bấm vào để xem chi tiết',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w200),
                      ))
                ],
              ),
              Flexible(
                child: FutureBuilder<List<Data>>(
                    future: filterDataListByCondition(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: _errorDevice.length,
                            itemBuilder: (context, index) {
                              if (_errorDevice.length != 0) {
                                final device = _errorDevice[index];
                                return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ReportScreen(device)));
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
                                              BorderRadius.circular(20)),
                                      child: Expanded(
                                        child: Row(
                                          children: [
                                            const CircleAvatar(
                                              backgroundImage: AssetImage(
                                                  'assets/images/logo-bo-y-te.jpg'),
                                              radius: 30,
                                            ),
                                            const SizedBox(
                                              width: 50,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    device.title,
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Text(
                                                    'Model: ${device.model}',
                                                    style: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  Text(
                                                    'Serial: ${device.serial}',
                                                    style: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  Text(
                                                      'Trạng thái: ${device.status}',
                                                      style: const TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w400)),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ));
                              } else
                                return Container(
                                    child: Text('Không có thiết bị'));
                            });
                      } else
                        return Container(child: CircularProgressIndicator());
                    }),
              )
            ])));
  }

  void searchErrorDevice(String query) async {
    setState(() {
      isLoading = true;
    });
    final List<Data>? result = await filterDataListByCondition();
    final suggestions = result!.where((element) {
      final deviceTitle = element.title.toLowerCase();
      final input = query.toLowerCase();
      return deviceTitle.contains(input);
    }).toList();
    setState(() {
      _errorDevice = suggestions;
      isLoading = false;
    });
  }
}
