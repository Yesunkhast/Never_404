import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class Contact extends StatelessWidget {
  final String title = "Хүмүүс";
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff17181c),
        elevation: 0.0,
        title: Text("${title}",
            style: const TextStyle(color: Colors.white, fontSize: 15)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person_add_alt_1_rounded),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xff17181c),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 55, 53, 53),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: 'Хайх',
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(Icons.person_add_rounded),
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.clear,
                        color: Colors.grey[600],
                      ),
                      onPressed: () {
                        searchController.clear();
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ),
            ),
          ),
          Image.asset('assets/nothing/message.jpg'),
        ],
      ),
    );
  }
}
