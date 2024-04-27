import 'package:flutter/material.dart';

import 'Home.dart';

enum KeypadState { hidden, visible } // Define an enum for keypad visibility

class Calling extends StatefulWidget {
  const Calling({super.key});

  @override
  // ignore: library_private_types_in_public_api
  CallingState createState() => CallingState();
}

class CallingState extends State<Calling> {
  final keys = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '*',
    '0',
    '#',
  ];

  String dialedNumbers = '';
  KeypadState keypadState = KeypadState.hidden;

  void _handleKeyPress(String key) {
    setState(() {
      dialedNumbers += key;
      print('Pressed num: $key');
    });
  }

  void _removeLastDigit() {
    if (dialedNumbers.isNotEmpty) {
      setState(() {
        dialedNumbers = dialedNumbers.substring(0, dialedNumbers.length - 1);
      });
    }
  }

  void _toggleKeypad() {
    setState(() {
      if (keypadState == KeypadState.visible) {
        dialedNumbers = '';
      }
      keypadState = keypadState == KeypadState.hidden
          ? KeypadState.visible
          : KeypadState.hidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 68, 68, 68),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Column(
                children: [
                  Text(
                    "103",
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 201, 201, 201),
                    ),
                  ),
                  Text(
                    "Calling...",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 201, 201, 201),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                dialedNumbers,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          keypadState == KeypadState.visible
              ? Expanded(
                  flex: 3,
                  child: GridView.builder(
                    padding: const EdgeInsets.all(30),
                    itemCount: keys.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.5,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () => _handleKeyPress(keys[index]),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: Text(
                              keys[index],
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              : const SizedBox(), // Show nothing when keypad is hidden
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: ElevatedButton(
                      onPressed: _toggleKeypad,

                      // ignore: sort_child_properties_last
                      child: const Icon(
                        Icons.format_list_numbered_rtl,
                        color: Colors.black,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // Button color
                        padding: const EdgeInsets.all(20), // Adjust padding
                        shape: const CircleBorder(),
                        elevation: 0,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        // ignore: sort_child_properties_last
                        child: const Icon(
                          Icons.volume_up,
                          color: Colors.black,
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white, // Button color
                          padding: const EdgeInsets.all(20), // Adjust padding
                          shape: const CircleBorder(),
                          elevation: 0,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {});
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Home()),
                          );
                        },
                        child: const Icon(
                          Icons.call_end,
                          color: Colors.white,
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding: const EdgeInsets.all(30),
                          shape: const CircleBorder(),
                          elevation: 0,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Icon(
                          Icons.mic_none_sharp,
                          color: Colors.black,
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white, // Button color
                          padding: const EdgeInsets.all(20), // Adjust padding
                          shape: const CircleBorder(),
                          elevation: 0,
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
