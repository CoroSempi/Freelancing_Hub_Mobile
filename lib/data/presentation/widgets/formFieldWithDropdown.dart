import 'package:flutter/material.dart';
import 'dart:collection';

class FormFieldWithDropdown extends StatelessWidget {
  static const routeName = '/form-field';
  final String title;
  final String subtitle;
  final String dropDownText;

  FormFieldWithDropdown({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.dropDownText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: title,
                style: const TextStyle(
                  color: Color(0xFF2D2D2D),
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(
                text: ' $subtitle',
                style: const TextStyle(
                  color: Color(0xFFA6A4A4),
                  fontSize: 10,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 350,
          height: 40,
          child: const DropdownMenuExample(),
        ),
      ],
    );
  }
}

 

class DropdownMenuExample extends StatefulWidget {
  const DropdownMenuExample({super.key});

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

typedef MenuEntry = DropdownMenuEntry<String>;
const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  static final List<MenuEntry> menuEntries = UnmodifiableListView<MenuEntry>(
    list.map<MenuEntry>((String name) => MenuEntry(value: name, label: name)),
  );

  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: ShapeDecoration(
        color: const Color(0xFFBF272D),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: dropdownValue,
          iconEnabledColor: Colors.white,
          dropdownColor:  Colors. grey.shade900,
          isExpanded: true,
          style: const TextStyle(
            color: Color(0xFFF6F6F6),
            fontSize: 12,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
          onChanged: (String? value) {
            setState(() {
              dropdownValue = value!;
            });
          },
          items: list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
