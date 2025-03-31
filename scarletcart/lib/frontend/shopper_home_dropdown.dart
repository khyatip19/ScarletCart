import 'package:flutter/material.dart';

/// Flutter code sample for [DropdownButton.style].

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  List<String> options = <String>[
    'Busch Student Center',
    'Pal Building Cook Campus',
    '57 Lipman Drive, Douglass Campus',
    'Tillett Hall, Livingston Campus',
    'The Yard, College Avenue Campus'
  ];
  String dropdownValue = 'Busch Student Center';

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    const double refWidth = 393; //width of iphone 16
    const double refHeight = 852; //height of iphone 16
    final double widthScale = screenSize.width / refWidth;
    final double heightScale = screenSize.height / refHeight;
    final double scaleFactor =
        (widthScale < heightScale ? widthScale : heightScale);
    return SizedBox(
      // Added SizedBox to give the Container a size
      width: 210 * scaleFactor, // Set a width (adjust as needed)
      height: 50, // Set a height (adjust as needed)
      child: Container(
        alignment: Alignment.center,
        color: const Color.fromARGB(255, 235, 253, 242),
        child: DropdownButton<String>(
          value: dropdownValue,
          onChanged: (String? value) {
            // This is called when the user selects an item.
            setState(() {
              dropdownValue = value!;
            });
          },
          style: TextStyle(
            color: const Color.fromARGB(255, 23, 74, 44),
            fontSize: 14 * scaleFactor,
            fontFamily: 'Outfit',
            fontWeight: FontWeight.w600,
          ),
          selectedItemBuilder: (BuildContext context) {
            // This is the widget that will be shown when you select an item.
            // Here custom text style, alignment and layout size can be applied
            // to selected item string.
            return options.map((String value) {
              return Align(
                alignment: Alignment.centerLeft,
                child: Text(dropdownValue,
                    style: TextStyle(
                      color: const Color.fromARGB(255, 23, 74, 44),
                      fontSize: 14 * scaleFactor,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w600,
                    )),
              );
            }).toList();
          },
          items: options.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
        ),
      ),
    );
  }
}
