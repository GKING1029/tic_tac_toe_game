import 'package:flutter/material.dart';

class TicTacToe extends StatefulWidget {
  const TicTacToe({super.key});

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  List<String> game = List.filled(9, '');
  bool firstPlayer = true;
  void _showDialogFunction() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter alertState) {
            return AlertDialog(
              backgroundColor: Colors.blue,
              title: const Text("Do you want to start a new game?"),
              content: const Column(
                mainAxisSize: MainAxisSize.min,
              ),
              actions: [
                Center(
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStatePropertyAll<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5))),
                          fixedSize:
                              const MaterialStatePropertyAll(Size(90, 30)),
                          backgroundColor:
                              const MaterialStatePropertyAll(Colors.black)),
                      onPressed: () {
                        game = List.filled(9, '');
                        firstPlayer != firstPlayer;
                        Navigator.of(context).pop();

                        setState(() {});
                      },
                      child: const Center(
                          child: Text(
                        "Yes",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      ))),
                )
              ],
            );
          });
        });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: Text(
            firstPlayer ? 'O' : 'X',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )),
        ),
        title: const Center(
          child: Text(
            "Tic Tac Toe",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        actions: [
          GestureDetector(
              onTap: () {
                _showDialogFunction();
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.refresh,
                  color: Colors.black,
                ),
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
}
