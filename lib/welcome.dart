import 'package:flutter/material.dart';
import 'package:jethi_tech/helper/buttons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jethi_tech/screens/addinfo.dart';
import 'package:jethi_tech/screens/show.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:jethi_tech/person.dart';

const list = {
  "users": [
    {"name": "Krishna", "id": "1", "atype": "Permanent"},
    {"name": "Sameera", "id": "2", "atype": "Permanent"},
    {"name": "Radhika", "id": "3", "atype": "Permanent"},
    {"name": "Yogesh", "id": "4", "atype": "Permanent"},
    {"name": "Radhe", "id": "5", "atype": "Permanent"},
    {"name": "Anshu", "id": "6", "atype": "Permanent"},
    {"name": "Balay", "id": "7", "atype": "Permanent"},
    {"name": "Julie", "id": "8", "atype": "Permanent"},
    {"name": "Swaminathan", "id": "9", "atype": "Permanent"},
    {"name": "Charandeep", "id": "10", "atype": "Permanent"},
    {"name": "Sankaran", "id": "11", "atype": "Permanent"},
    {"name": "Alpa", "id": "12", "atype": "Permanent"},
    {"name": "Sheth", "id": "13", "atype": "Temproary"},
    {"name": "Sabina", "id": "14", "atype": "Temproary"}
  ]
};

class WelcomePage extends StatefulWidget {
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  GetStorage box = GetStorage();
  @override
  void initState() {
    box.erase();
  }

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
      body: ListView.builder(
        itemCount: list['users']?.length,
        itemBuilder: (context, index) {
          return Tile(
            str: list['users']![index]['name'],
            index: index,
          );
        },
      ),
    );
  }
}

class Tile extends StatefulWidget {
  final String? str;
  final int index;
  Tile({required this.str, required this.index});

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  GetStorage box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Buttons(
          func: () {
            box.read(widget.str!) == null
                ? showModalBottomSheet(
                    context: context,
                    builder: (context) => AddInfo(
                      user: widget.str,
                      index: widget.index,
                    ),
                  )
                : Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ShowData(
                              userName: widget.str,
                              index: widget.index,
                            )),
                  );
          },
          str: widget.str,
          color: Colors.lightBlueAccent,
          width: 250,
        ),
        Buttons(
          func: () async {
            box.read(widget.str!) == null
                ? showModalBottomSheet(
                    context: context,
                    builder: (context) => AddInfo(
                      user: widget.str,
                      index: widget.index,
                    ),
                  )
                : setState(() {
                    box.remove(widget.str!);
                    box.remove('${widget.str} gender');
                    box.remove('${widget.str} age');
                  });
            if (Provider.of<Person>(context, listen: false).list[widget.index]
                    [0] ==
                'Sign Out') {
              Provider.of<Person>(context, listen: false).change(widget.index);
            }
          },
          str: Provider.of<Person>(context).list[widget.index][0],
          color: Colors.purpleAccent,
          width: 10,
        ),
      ],
    );
  }
}
