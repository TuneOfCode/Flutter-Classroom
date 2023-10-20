import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  late int num1;
  late int num2;
  final num1Controller = TextEditingController();
  final num2Controller = TextEditingController();
  int sum = 0;

  void clearNum1() {
    num1Controller.clear();
  }

  void clearNum2() {
    num2Controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            child: Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Tổng: $sum',
            style: const TextStyle(fontSize: 30),
          ),
          TextFormField(
            controller: num1Controller,
            decoration: InputDecoration(
              hintText: 'Nhập số thứ nhất',
              suffixIcon: IconButton(
                onPressed: clearNum1,
                icon: const Icon(Icons.clear),
              ),
            ),
            keyboardType: TextInputType.number,
            // inputFormatters: [
            //   FilteringTextInputFormatter.allow(RegExp("r[0-9]"))
            // ],
            // onChanged: (value) => {
            //   setState(() {
            //     num1 = int.parse(value);
            //   })
            // },
          ),
          TextFormField(
            controller: num2Controller,
            decoration: InputDecoration(
              hintText: 'Nhập số thứ hai',
              suffixIcon: IconButton(
                onPressed: () {
                  num2Controller.clear();
                },
                icon: const Icon(Icons.clear),
              ),
            ),
            keyboardType: TextInputType.number,
            // inputFormatters: [
            //   FilteringTextInputFormatter.allow(RegExp("r[0-9]"))
            // ],
            // onChanged: (value) => {
            //   setState(() {
            //     num2 = int.parse(value);
            //   })
            // },
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  sum = int.parse(num1Controller.text) +
                      int.parse(num2Controller.text);
                });
              },
              child: const Text('Tính tổng')),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  num1Controller.clear();
                  num2Controller.clear();
                  sum = 0;
                });
              },
              child: const Text('Đặt lại giá trị'))
        ],
      ),
    )));
  }
}
