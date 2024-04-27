import 'package:flutter/material.dart';
import 'package:not_found_404/widgets/Calling.dart';
// import 'package:record/record.dart';
// import 'package:audioplayers/audioplayers.dart';

class PhoneKeypad extends StatefulWidget {
  const PhoneKeypad({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PhoneKeypadState createState() => _PhoneKeypadState();
}

class _PhoneKeypadState extends State<PhoneKeypad> {
  // late AudioRecorder audioRecord;
  // late AudioPlayer audioPlayer;
  // bool isRecording = false;
  // String audioPath = '';
  String dialedNumbers = '';

  @override
  // void initState() {
  //   audioPlayer = AudioPlayer();
  //   audioRecord = AudioRecorder();
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   audioRecord.dispose();
  //   audioPlayer.dispose();
  //   super.dispose();
  // }

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

  // Future<void> _callNumber() async {
  //   try {
  //     if (await audioRecord.hasPermission()) {
  //       await audioRecord.start(const RecordConfig(), path: audioPath);
  //       setState(() {
  //         isRecording = true;
  //       });
  //     }
  //     print(dialedNumbers);
  //   } catch (e) {
  //     print("Error Start Recording : $e");
  //   }
  // }

  // Future<void> stopRecorDing() async {
  //   try {
  //     String? path = await audioRecord.stop();
  //     setState(() {
  //       isRecording = false;
  //       audioPath = path!;
  //     });
  //   } catch (e) {
  //     print("Error Stop Recording : $e");
  //   }
  // }

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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Calling()),
                    );
                    // _callNumber;
                  },
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
