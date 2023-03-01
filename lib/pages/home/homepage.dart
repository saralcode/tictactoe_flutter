import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        ),
        extendBodyBehindAppBar: true,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff0f0c29), Color(0xff24243e)],
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "TicTacToe",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "serif",
                    color: Colors.white),
                textScaleFactor: 6.sp,
              ),
              SizedBox(
                height: 25.sp,
              ),
              FloatingActionButton.extended(
                  extendedPadding: EdgeInsets.symmetric(horizontal: 25.sp),
                  onPressed: () {
                    Navigator.pushNamed(context, "/game");
                  },
                  label: Text(
                    "Play",
                    textScaleFactor: 4.5.sp,
                  )),
              SizedBox(
                height: 25.sp,
              ),
            ],
          ),
        ),
        extendBody: true,
        bottomNavigationBar: Container(
          height: 35.sp,
          width: 100.w,
          color: Colors.transparent,
          child: Column(
            children: [
              Text(
                "By Sonu Kumar",
                textScaleFactor: 4.2.sp,
                style: const TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 10.sp,
              ),
              Text(
                "BugsMirror Sample Task",
                textScaleFactor: 4.2.sp,
                style: const TextStyle(color: Colors.white),
              ),
              SizedBox(height: 10.sp)
            ],
          ),
        ));
  }
}
