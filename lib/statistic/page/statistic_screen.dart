// ignore_for_file: avoid_unnecessary_containers

import 'package:appdemo/departments/department_model.dart';
import 'package:appdemo/departments/get_department_list.dart';
import 'package:appdemo/devices/statusDevices.dart';
import 'package:appdemo/statistic/bloc/static_bloc.dart';
import 'package:appdemo/statistic/widget/pie_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatisticScreen extends StatefulWidget {
  const StatisticScreen({super.key});
  static String routeName = "statistic_screen";
  @override
  State<StatisticScreen> createState() => _StatisticScreenState();
}

class _StatisticScreenState extends State<StatisticScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          elevation: 0,
          title: const Text('Thống Kê'),
          centerTitle: true,
        ),
        body: BlocProvider(
          create: (context) => DataStatisticBloc(),
          child: const PieChartScreen(),
        ));
  }
}

class PieChartScreen extends StatefulWidget {
  const PieChartScreen({super.key});
  @override
  State<PieChartScreen> createState() => _PieChartScreenState();
}

class _PieChartScreenState extends State<PieChartScreen> {
  bool isLoading = false;
  String _selectedDepartment = all;

  Future<List<DepartmentData>?> dataListDepartment() async {
    final List<DepartmentData>? dataList = await getDataDepartmentFromApi();
    // Lọc danh sách dựa trên điều kiện
    return dataList;
  }

  List<DepartmentData> _department = [];

  void fetchDepartmentData() async {
    _department = (await dataListDepartment())!;
    listDepartment = _department.map((e) => e.title).toList();
    listDepartment.insert(0, all);
  }

  List<String> listDepartment = [];

  @override
  void initState() {
    super.initState();
    fetchDepartmentData();
  }

  @override
  Widget build(BuildContext context) {
    final dataBloc = BlocProvider.of<DataStatisticBloc>(context);
    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Column(children: [
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.only(top: 5, left: 5),
                    child: Column(
                      children: [
                        const Text(
                          'Chọn loại dữ liệu',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                            onPressed: () {
                              selectDepartment();
                            },
                            child: Container(
                              height: 30,
                              margin: const EdgeInsets.all(10),
                              width: 420,
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 232, 230, 230),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30),
                                      bottomLeft: Radius.circular(30),
                                      bottomRight: Radius.circular(30))),
                              alignment: Alignment.center,
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                      child: Text(
                                    'Khoa phòng',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                  )),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(Icons.keyboard_arrow_down)
                                ],
                              ),
                            ))
                      ],
                    ),
                  )),
            ],
          ),
          Flexible(
              child: SingleChildScrollView(
                  child: showPieChart(dataBloc, _selectedDepartment)))
        ]));
  }

  void applySelection() {
    Navigator.of(context).pop();
  }

  void selectDepartment() {
    showCupertinoModalPopup(
      context: context,
      builder: (_) {
        return CupertinoPopupSurface(
          isSurfacePainted: false,
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            height: 500, // Điều chỉnh chiều cao của bottom sheet
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Expanded(
                  child: CupertinoPicker.builder(
                    itemExtent: 40.0, // Chiều cao của mỗi item trong picker
                    onSelectedItemChanged: (int index) {
                      // Xử lý khi phần tử được chọn thay đổi
                      setState(() {
                        _selectedDepartment = listDepartment[index];
                      });
                    },
                    childCount: listDepartment.length, // Số lượng phần tử
                    itemBuilder: (BuildContext context, int index) {
                      // Tùy chỉnh giao diện của ô hiển thị phần tử
                      return Center(
                        child: Container(
                          height: 40,
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            listDepartment[index],
                            style: const TextStyle(
                              fontSize: 18.0,
                              color: Colors.black, // Màu văn bản
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: CupertinoButton(
                      onPressed: applySelection, child: const Text('Xác Nhận')),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
