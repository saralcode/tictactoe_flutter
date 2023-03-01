import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

enum GameData {
  isUser,
  isPc,
  isNull,
}

bool winningCondition(List<List<GameData>> grid, GameData data) {
  return (grid[0][0] == data && grid[0][1] == data && grid[0][2] == data) ||
      (grid[1][0] == data && grid[1][1] == data && grid[1][2] == data) ||
      (grid[2][0] == data && grid[2][1] == data && grid[2][2] == data) ||
      (grid[0][0] == data && grid[1][0] == data && grid[2][0] == data) ||
      (grid[0][1] == data && grid[1][1] == data && grid[2][1] == data) ||
      (grid[0][2] == data && grid[1][2] == data && grid[2][2] == data) ||
      (grid[0][0] == data && grid[1][1] == data && grid[2][2] == data) ||
      (grid[0][2] == data && grid[1][1] == data && grid[2][0] == data);
}

GameData won(List<List<GameData>> grid) {
  if (winningCondition(grid, GameData.isUser)) {
    return GameData.isUser;
  }

  if (winningCondition(grid, GameData.isPc)) {
    return GameData.isPc;
  }
  return GameData.isNull;
}

class GameState extends ChangeNotifier {
  bool userTurn = true;

  int round = 1;
  List<List<GameData>> grid = [
    [GameData.isNull, GameData.isNull, GameData.isNull],
    [GameData.isNull, GameData.isNull, GameData.isNull],
    [GameData.isNull, GameData.isNull, GameData.isNull],
  ];

  void resetGrid() {
    round = 1;
    grid = [
      [GameData.isNull, GameData.isNull, GameData.isNull],
      [GameData.isNull, GameData.isNull, GameData.isNull],
      [GameData.isNull, GameData.isNull, GameData.isNull],
    ];

    notifyListeners();
  }

  void pcTurn(BuildContext context) {
    List<List<int>> emptyIndexes = [];
    for (var i = 0; i < 3; i++) {
      for (var j = 0; j < 3; j++) {
        if (grid[i][j] == GameData.isNull) {
          emptyIndexes.add([i, j]);
        }
      }
    }
    int random = math.Random().nextInt(emptyIndexes.length);
    onGridPress(GameData.isNull, emptyIndexes[random][0],
        emptyIndexes[random][1], context);
  }

  void showWonDialog(BuildContext context, GameData gameData) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: Text(gameData == GameData.isPc
            ? "Opps😥"
            : gameData == GameData.isUser
                ? "Wow🎉"
                : "Game Tie"),
        content: Text(
          gameData == GameData.isPc
              ? "You Loose"
              : gameData == GameData.isUser
                  ? "You Won"
                  : "No One Won",
          textScaleFactor: 4.sp,
        ),
        actions: [
          TextButton(
              onPressed: () {
                resetGrid();
                Navigator.pop(context);
                if (!userTurn) {
                  pcTurn(context);
                }
              },
              child: Text(
                "OK",
                textScaleFactor: 4.sp,
              ))
        ],
      ),
    );
  }

// On user press the button
  void onGridPress(
      GameData gameData, int posy, int posx, BuildContext context) {
    if (gameData == GameData.isNull) {
      if (userTurn) {
        grid[posy][posx] = GameData.isUser;
      } else {
        grid[posy][posx] = GameData.isPc;
      }
      round++;
      notifyListeners();
      GameData whoWon = won(grid);
      if (whoWon != GameData.isNull) {
        if (whoWon == GameData.isPc) {
          showWonDialog(context, GameData.isPc);
        } else {
          showWonDialog(context, GameData.isUser);
        }
      } else {
        userTurn = !userTurn;
        if (!userTurn && round < 10) {
          pcTurn(context);
        }
      }
      if (round == 10 && whoWon == GameData.isNull) {
        showWonDialog(context, GameData.isNull);
      }

      notifyListeners();
    }
  }
}
