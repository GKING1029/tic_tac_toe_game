import 'package:flutter/material.dart';

class TicTacToe extends StatefulWidget {
  const TicTacToe({super.key});

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  List<String> game = List.filled(9, '');
  bool firstPlayer = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        leading: Text(""),
        title: const Center(
          child: Text(
            "Tic Tac Toe",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        actions: [
          GestureDetector(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: ((context) => const TicTacToe())));
                game = List.filled(9, '');
                firstPlayer = !firstPlayer;
                setState(() {});
              },
              child: const Icon(
                Icons.refresh,
                color: Colors.black,
              ))
        ],
      ),
      body: GridView.builder(
        shrinkWrap: true,
        itemCount: 9,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              print("game[index] ${game[index]}");
              if (game[index].isEmpty) {
                if (firstPlayer) {
                  game[index] = 'O';
                  firstPlayer = false;
                } else {
                  game[index] = 'X';
                  firstPlayer = true;
                }
                checkWinner();
                setState(() {});
              }
            },
            child: Container(
              color: Colors.black,
              child: Center(
                child: Text(
                  game[index],
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 100,
                      color: Colors.lightBlue),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  checkWinner() {}
}
