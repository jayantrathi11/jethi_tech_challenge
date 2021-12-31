import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jethi_tech/helper/buttons.dart';

class ShowData extends StatelessWidget {
  final String? userName;
  GetStorage box = GetStorage();
  ShowData({required this.userName});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Jethi',
              style: GoogleFonts.libreBaskerville(
                color: Colors.black,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Tech',
              style: GoogleFonts.libreBaskerville(
                color: Colors.red,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              userName!,
              style: const TextStyle(
                fontSize: 50,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              box.read('$userName gender') ?? 'okay',
              style: const TextStyle(
                fontSize: 50,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              box.read('$userName age') ?? 'okay',
              style: const TextStyle(
                fontSize: 50,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Buttons(
              color: Colors.purpleAccent,
              func: () {
                box.remove(userName!);
                box.remove('$userName gender');
                box.remove('$userName age');
                Navigator.pop(context);
              },
              str: 'Sign Out',
              width: 200,
            )
          ],
        ),
      ),
    );
  }
}
