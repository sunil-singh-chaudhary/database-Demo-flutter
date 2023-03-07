import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startfirstdemo/MyData.dart';
import 'package:startfirstdemo/db.dart';

class bottomTextField extends StatefulWidget {
  const bottomTextField({super.key});

  @override
  State<bottomTextField> createState() => _bottomTextFieldState();
}

class _bottomTextFieldState extends State<bottomTextField> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        height: 60,
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                style: const TextStyle(color: Colors.black),
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                    fillColor: Colors.white38,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)))),
              ),
            ),
            SizedBox(
              height: 40,
              width: 60,
              child: IconButton(
                onPressed: () {
                  Provider.of<MyData>(context, listen: false)
                      .insertData(DB(title: controller.text));
                },
                icon: const Icon(Icons.send),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
