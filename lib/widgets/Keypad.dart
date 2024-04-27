import 'package:flutter/material.dart';

class PhoneKeypad extends StatefulWidget {
  const PhoneKeypad({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PhoneKeypadState createState() => _PhoneKeypadState();
}

class _PhoneKeypadState extends State<PhoneKeypad> {
  String dialedNumbers = '';

  void _handleKeyPress(String key) {
    setState(() {
      dialedNumbers += key;
    });
  }

  // Method to remove the last digit
  void _removeLastDigit() {
    if (dialedNumbers.isNotEmpty) {
      setState(() {
        dialedNumbers = dialedNumbers.substring(0, dialedNumbers.length - 1);
      });
    }
  }

  void _callNumber() {
    // ignore: avoid_print
    print('Calling: $dialedNumbers');
    // Add your call logic here
  }

  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      backgroundColor: Colors.white, // Background color
      body: Column(
        children: [
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
          Expanded(
            flex: 3,
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: keys.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.13, // Adjust aspect ratio for smaller keys
                crossAxisSpacing: 10,
                mainAxisSpacing: 5,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => _handleKeyPress(keys[index]),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(5), // Adjust border radius
                    ),
                    child: Center(
                      child: Text(
                        keys[index],
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black, // Button text color
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  // ignore: sort_child_properties_last
                  child: const Icon(
                    Icons.videocam_outlined,
                    color: Colors.white,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Button color
                    padding: const EdgeInsets.all(15), // Adjust padding
                    shape: const CircleBorder(),
                    elevation: 0,
                  ),
                ),
                ElevatedButton(
                  onPressed: _callNumber,
                  // ignore: sort_child_properties_last
                  child: const Icon(
                    Icons.call,
                    color: Colors.white,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.all(30),
                    shape: const CircleBorder(),
                    elevation: 0,
                  ),
                ),
                ElevatedButton(
                  onPressed: _removeLastDigit,
                  // ignore: sort_child_properties_last
                  child: const Icon(
                    Icons.backspace,
                    color: Colors.black,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Button color
                    padding: const EdgeInsets.all(15), // Adjust padding
                    shape: const CircleBorder(),
                    elevation: 0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
