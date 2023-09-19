import 'package:appdemo/devices/report_screen.dart';
import 'package:appdemo/devices/inventory_screen.dart';
import 'package:appdemo/devices/device_model.dart';
import 'package:appdemo/devices/statusDevices.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen(this.models, {super.key});
  final DeviceData models;
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
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
                      //Divider tạo dòng kẻ ngang
                      color: Colors.blue[700], // Màu của dòng kẻ
                      thickness: 1.4, // Độ dày của dòng kẻ
                      indent: 20, // Khoảng cách từ lề trái
                      endIndent: 20, // Khoảng cách từ lề phải
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
                      //Divider tạo dòng kẻ ngang
                      color: Colors.blue[700], // Màu của dòng kẻ
                      thickness: 1.4, // Độ dày của dòng kẻ
                      indent: 20, // Khoảng cách từ lề trái
                      endIndent: 20, // Khoảng cách từ lề phải
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
                  onTap: () {},
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
                    onTap: () {},
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
}