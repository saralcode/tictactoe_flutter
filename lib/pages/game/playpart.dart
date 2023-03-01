import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/pages/game/gamestate.dart';

class PlayPart extends StatefulWidget {
  const PlayPart({super.key});

  @override
  State<PlayPart> createState() => _PlayPartState();
}

class _PlayPartState extends State<PlayPart> {
  @override
  Widget build(BuildContext context) {
    // GameState gameState = context.watch<GameState>();
    return Consumer<GameState>(builder: (context, gameState, child) {
      return SizedBox(
        height: 100.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (int i = 0; i < 3; i++) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int j = 0; j < 3; j++) ...[
                    button(
                      gameState,
                      i,
                      j,
                    )
                  ]
                ],
              ),
            ]
          ],
        ),
      );
    });
  }

  Widget button(GameState gameState, int posy, int posx) {
    GameData gameData = gameState.grid[posy][posx];
    return ElevatedButton(
      style: ButtonStyle(
          padding: MaterialStatePropertyAll(EdgeInsets.all(20.sp)),
          // backgroundColor: MaterialStatePropertyAll(),
          fixedSize: MaterialStatePropertyAll(Size(30.w, 30.w))),
      onPressed: () {
        gameState.onGridPress(gameData, posy, posx, context);
      },
      child: gameData == GameData.isNull
          ? const SizedBox()
          : Icon(
              gameData == GameData.isPc ? Icons.circle_outlined : Icons.close,
              size: 35.sp,
            ),
    );
  }
}
