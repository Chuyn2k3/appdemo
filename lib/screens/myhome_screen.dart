import 'package:appdemo/devices/bloc/device_bloc.dart';
import 'package:appdemo/home/page/home_screen.dart';
import 'package:appdemo/user/page/info_screen.dart';
import 'package:appdemo/screens/qr_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyhomeScreen extends StatefulWidget {
  const MyhomeScreen({super.key});
  static String routeName = 'myhome_screen';
  @override
  State<MyhomeScreen> createState() => _MyhomeScreenState();
}

class _MyhomeScreenState extends State<MyhomeScreen> {
  List page = [const HomeScreen(), const QRScreen(), const InfoScreen()];
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>DataDeviceBloc()
      ..getDeviceData()
      ,
      child: 
        Scaffold(
          body: IndexedStack(
              index: _currentIndex,
              children: const [HomeScreen(), QRScreen(), InfoScreen()]),
          bottomNavigationBar: BottomNavigationBar(
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            iconSize: 30,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Trang chủ',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.crop_free),
                label: 'Scan',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_2),
                label: 'Cá nhân',
              ),
            ],
          ),
        )     
    );
  }
}
