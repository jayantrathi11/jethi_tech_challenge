import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jethi_tech/helper/buttons.dart';

class ShowData extends StatefulWidget {
  final String? userName;

  ShowData({required this.userName});

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  GetStorage box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Jethi',
              style: GoogleFonts.libreBaskerville(
                color: Colors.white,
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
              widget.userName!,
              style: const TextStyle(
                fontSize: 50,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              box.read('${widget.userName} gender') ?? 'okay',
              style: const TextStyle(
                fontSize: 50,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              box.read('${widget.userName} age') ?? 'okay',
              style: const TextStyle(
                fontSize: 50,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Buttons(
              color: Colors.purpleAccent,
              func: () {
                box.remove(widget.userName!);
                box.remove('${widget.userName} gender');
                box.remove('${widget.userName} age');
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
