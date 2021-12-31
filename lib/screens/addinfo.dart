import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jethi_tech/screens/show.dart';

class AddInfo extends StatelessWidget {
  String gender = 'Male';
  late String age;
  final String? user;
  AddInfo({required this.user});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF686868),
      child: Container(
        padding: const EdgeInsets.all(40),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Add Info',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Gender',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            CupertinoPicker(
              itemExtent: 38,
              onSelectedItemChanged: (index) {
                gender = index == 0 ? 'Male' : 'Female';
              },
              children: const [
                Text(
                  'Male',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlueAccent,
                  ),
                ),
                Text(
                  'Female',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlueAccent,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Age',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (String ans) {
                age = ans;
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              color: Colors.lightBlueAccent,
              child: TextButton(
                onPressed: () {
                  GetStorage box = GetStorage();
                  box.write('$user gender', gender);
                  box.write('$user age', age);
                  box.write(user!, 'signedin');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShowData(userName: user)));
                  Navigator.pop(context);
                },
                child: const Text(
                  'Add Info',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
