import 'package:appdemo/devices/report_screen.dart';
import 'package:appdemo/devices/inventory_screen.dart';
import 'package:appdemo/devices/device_model.dart';
import 'package:appdemo/devices/statusDevices.dart';
import 'package:appdemo/employees/employee_model.dart';
import 'package:appdemo/employees/get_employee_list.dart';
import 'package:appdemo/inventory/inventoryInformationModel.dart';
import 'package:appdemo/services/api.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen(this.models, {super.key});
  final DeviceData models;
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  Future<List<EmployeeData>?> DataList() async {
    final List<EmployeeData>? dataList = await getDataEmployeeFromApi();

    return dataList;
  }

  List<EmployeeData> _employee = [];
  void fetchEmployeeData() async {
    _employee = (await DataList())!;
  }

  String getUserInventory(int user_id) {
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
        backgroundColor: Colors.blue,
        appBar: AppBar(
          elevation: 0,
          title: const Text('Thiết Bị'),
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
                  height: 500,
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.models.title,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      height: 40,
                      margin: const EdgeInsets.all(20),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: (widget.models.status == ('not_handele')) ||
                                  (widget.models.status == ('active'))
                              ? const Color.fromARGB(255, 25, 208, 34)
                              : Colors.red),
                      child: Text(widget.models.status,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500)),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Model:',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text('Serial:',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500))
                                ]),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                      (widget.models.model != null)
                                          ? widget.models.model!
                                          : "Không có dữ liệu",
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black)),
                                  Text(
                                      (widget.models.serial != null)
                                          ? widget.models.serial!
                                          : "Không có dữ liệu",
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Năm sản xuất:',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text('Năm sử dụng:',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500))
                                ]),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                      (widget.models.yearManufacture != null)
                                          ? widget.models.yearManufacture!
                                          : "Không có dữ liệu",
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black)),
                                  Text(
                                      (widget.models.yearUse != null)
                                          ? widget.models.yearUse!
                                          : "Không có dữ liệu",
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Hãng sản xuất:',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text('Xuất xứ:',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500))
                                ]),
                            Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                        (widget.models.manufacturer != null)
                                            ? widget.models.manufacturer!
                                            : "Không có dữ liệu",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black)),
                                    Text(
                                        (widget.models.origin != null)
                                            ? widget.models.origin!
                                            : "Không có dữ liệu",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black))
                                  ]),
                            )
                          ],
                        )),
                  ]),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(
                      top: 0, bottom: 5, right: 10, left: 10),
                  child: const Text('Lịch sử báo hỏng thiết bị',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                GestureDetector(
                  onTap: () {
                    reportErrorBottomsheet(context, widget.models);
                  },
                  child: Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color.fromARGB(255, 208, 204, 204)),
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
                                'Xem lịch sử báo hỏng thiết bị',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Positioned(
                            right: 3,
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              size: 24.0,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      )),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(
                      top: 5, bottom: 5, right: 10, left: 10),
                  child: const Text(
                    'Lịch sử kiểm kê thiết bị',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      createInventoryBottomsheet(context, widget.models);
                    },
                    child: Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color.fromARGB(255, 208, 204, 204)),
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
                                  'Xem lịch sử kiểm kê thiết bị',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Positioned(
                              right: 3,
                              child: Icon(
                                Icons.keyboard_arrow_down,
                                size: 24.0,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ))),
                ((widget.models.status.toLowerCase() ==
                            was_broken.toLowerCase()) ||
                        (widget.models.status.toLowerCase() ==
                            liquidated.toLowerCase()) ||
                        (widget.models.status.toLowerCase() ==
                            corrected.toLowerCase()) ||
                        (widget.models.status.toLowerCase() ==
                            inactive.toLowerCase()))
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      InventoryScreen(widget.models)));
                        },
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          alignment: Alignment.center,
                          width: double.infinity,
                          height: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.blue),
                          child: const Text('Kiểm kê',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ))
                    : Container(
                        margin: const EdgeInsets.all(30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ReportScreen(widget.models)));
                                },
                                child: Container(
                                    alignment: Alignment.center,
                                    width: 120,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.blue),
                                    child: const Text(
                                      'Báo Hỏng',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )),
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Expanded(
                                child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            InventoryScreen(widget.models)));
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  width: 120,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.blue),
                                  child: const Text('Kiểm Kê',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white))),
                            ))
                          ],
                        ),
                      ),
              ])
            ])));
  }

  void reportErrorBottomsheet(BuildContext context, DeviceData models) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 400,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Text('Lịch sử báo hỏng thiết bị'),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: (models.dateFailure != null)
                      ? Container(
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          child: Column(
                            children: [
                              Text(
                                'Ngày báo hỏng:' + models.dateFailure!,
                                style: const TextStyle(color: Colors.black),
                              ),
                              const Text('Trạng thái sửa chữa'),
                            ],
                          ),
                        )
                      : const Text('Không có dữ liệu'),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Xác nhận',
                      style: TextStyle(color: Colors.red),
                    ))
              ],
            ),
          );
        });
  }

  void createInventoryBottomsheet(BuildContext context, DeviceData models) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 400,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Text('Lịch sử kiếm kê thiết bị'),
                const SizedBox(
                  height: 10,
                ),
                Flexible(
                  child: FutureBuilder<InventoryInformationModel?>(
                      future: DemoAPI().dioGetInventoryInformation(models),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data!.dataLength != 0) {
                            return ListView.builder(
                                itemCount: snapshot.data!.dataLength,
                                itemBuilder: (context, index) {
                                  return Container(
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 300,
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15)),
                                              color: Color.fromARGB(255, 232, 230, 230)),
                                          child: Row(
                                            children: [
                                              const SizedBox(width: 15,),
                                              Expanded(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(height: 5,),
                                                    Text(
                                                      'Ngày kiểm kê:' +
                                                          snapshot
                                                              .data!.data![index].date
                                                              .toString(),
                                                      style: const TextStyle(
                                                          color: Colors.black),
                                                      
                                                    ),
                                                    const SizedBox(height: 5,),
                                                    Text(
                                                      'Ghi chú:' +
                                                          ((snapshot
                                                                      .data!
                                                                      .data![index]
                                                                      .note !=
                                                                  null)
                                                              ? snapshot.data!
                                                                  .data![index].note!
                                                              : 'Không có ghi chú'),
                                                      style: const TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                    const SizedBox(height: 5,),
                                                    Text(
                                                      'Người kiểm kê:' +
                                                          getUserInventory(snapshot
                                                              .data!
                                                              .data![index]
                                                              .userId!),
                                                      style: const TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                    const SizedBox(height: 5,),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        )
                                      ],
                                    ),
                                  );
                                });
                          } else
                            return const Text('Không có dữ liệu');
                        } else
                          return const CircularProgressIndicator();
                      }),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Xác nhận',
                      style: TextStyle(color: Colors.red),
                    ))
              ],
            ),
          );
        });
  }
}
