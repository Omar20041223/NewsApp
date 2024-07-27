import 'package:flutter/material.dart';

class ChooseCountry extends StatefulWidget {
  final Function(String) onCountryChanged;
  const ChooseCountry({Key? key, required this.onCountryChanged})
      : super(key: key);

  @override
  State<ChooseCountry> createState() => _ChooseCountryState();
}

class _ChooseCountryState extends State<ChooseCountry> {
  String? selectedCountry;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      style: TextStyle(color: Colors.red),
      value: selectedCountry,
      onChanged: (String? newValue) {
        setState(() {
          selectedCountry = newValue!;
          widget.onCountryChanged(selectedCountry!);
        });
      },
      items: <String>[
        'ae',
        'er',
        'at',
        'au',
        'be',
        'bg',
        'br',
        'ca',
        'ch',
        'eg',
        'us',
        'gb',
        'fr',
        'de'
      ] // Add more countries as needed
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value.toLowerCase()),
        );
      }).toList(),
    );
  }
}
