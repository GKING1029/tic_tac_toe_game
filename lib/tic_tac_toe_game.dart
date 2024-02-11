import 'package:flutter/material.dart';

class TicTacToe extends StatefulWidget {
  const TicTacToe({super.key});

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  bool isCompleted = false;
  List<String> game = List.filled(9, '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Center(
          child: Text(
            "Tic Tac Toe",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        actions: [
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const TicTacToe())));
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
              if (game[index].isEmpty) {
                setState(() {
                  game[index] = isCompleted ? '' : 'O';
                });
              }
            },
            onDoubleTap: () {
              if (game[index].isEmpty) {
                setState(() {
                  game[index] = isCompleted ? '' : 'X';
                });
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
}
