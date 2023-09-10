import 'package:flutter/material.dart';
import 'package:appdemo/models/model.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen(this.models, {super.key});
  final Model models;
  static String routeName = 'inventory_screen';
  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  //final bool check = (this.widget.models.titile == 'Đang báo hỏng');
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
                  height: 480,
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
                    Text(
                      widget.models.titile,
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 40,
                      margin: const EdgeInsets.all(20),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: (widget.models.description == ('Mới')) ||
                                  (widget.models.description ==
                                      ('Đang sử dụng'))
                              ? const Color.fromARGB(255, 25, 208, 34)
                              : Colors.red),
                      child: Text(widget.models.description,
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
                                  Text(widget.models.model,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black)),
                                  Text(widget.models.serial,
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
                                  Text(widget.models.yearMan.toString(),
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black)),
                                  Text(widget.models.yearUse.toString(),
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
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(widget.models.manufacturer,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black)),
                                  Text(widget.models.origin,
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
                  height: 80,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 227, 226, 226),
                      borderRadius: BorderRadius.circular(20)),
                  child: TextFormField(
                    style: const TextStyle(
                        color: Color.fromARGB(255, 137, 37, 37)),
                    maxLines: 500,
                    //controller: _textEditingController,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 227, 224, 224),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 17, horizontal: 15),
                      hintText: 'Nhập ghi chú kiểm kê tại đây',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(width: 0.8),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                    onTap: () {
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
              ])
            ])));
  }
}
