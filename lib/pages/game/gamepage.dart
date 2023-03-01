import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tictactoe/pages/game/gamestate.dart';
import 'package:tictactoe/pages/game/playpart.dart';
import 'package:provider/provider.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
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
              instruction(),
              SizedBox(
                height: 25.sp,
              ),
              const PlayPart(),
              SizedBox(
                height: 25.sp,
              ),
              FloatingActionButton.extended(
                  backgroundColor: Colors.pink,
                  onPressed: () {
                    context.read<GameState>().resetGrid();
                  },
                  icon: Icon(
                    Icons.restart_alt_rounded,
                    size: 25.sp,
                  ),
                  label: Text(
                    "Reset",
                    textScaleFactor: 5.5.sp,
                  ))
            ],
          ),
        ));
  }
}

// instruction Widget

Widget instruction() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Row(
        children: [
          Text(
            " You : ",
            textScaleFactor: 6.sp,
            style: const TextStyle(color: Colors.white),
          ),
          Icon(
            Icons.close,
            color: Colors.white,
            size: 30.sp,
          )
        ],
      ),
      Row(
        children: [
          Text(
            " PC : ",
            textScaleFactor: 6.sp,
            style: const TextStyle(color: Colors.white),
          ),
          Icon(
            Icons.circle_outlined,
            color: Colors.white,
            size: 30.sp,
          )
        ],
      )
    ],
  );
}
