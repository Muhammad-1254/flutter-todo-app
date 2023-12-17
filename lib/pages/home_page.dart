import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final List<String> todoList = ["todo"];
  // final List<Map<String, String>> todoList = [];

  final TextEditingController controller = TextEditingController();
  void btnHandler() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "Todo App",
          style: TextStyle(
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 5),
                  child: Text(
                    todoList.isEmpty
                        ? "No Todo available Today"
                        : "Todo's here",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
                Container(
                  height: todoList.isEmpty ? 0 : 200,
                  color: Colors.black45,
                  child: ListView(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    children: todoList
                        .map(
                          (todo) => ListTile(
                            trailing: TextButton(
                              onPressed: () {
                                todoList.remove(todo);
                                setState(() {
                                  todoList;
                                });
                              },
                              child: const Icon(
                                Icons.delete,
                                color: Colors.red,
                                size: 25,
                              ),
                            ),
                            selected: true,
                            title: Text(
                              "->   $todo",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
            TextField(
              onSubmitted: (value) {
                todoList.add(value);
                controller.text = '';
                setState(() {
                  todoList;
                });
              },
              controller: controller,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
              decoration: const InputDecoration(
                hintText: "Enter Your Todo",
                hintStyle: TextStyle(
                    color: Colors.white54,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
                fillColor: Colors.black,
                filled: true,
                suffixIcon: Icon(Icons.work),
                suffixIconColor: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
