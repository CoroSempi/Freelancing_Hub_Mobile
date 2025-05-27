import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:iti_freelancing_hub/core/providers/setting_provider.dart';

class FormFieldWithDropdown extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? dropDownText;
  final List<String> items;
  final Color backgroundColor;
  final void Function(String?) onChanged;

  const FormFieldWithDropdown({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.dropDownText,
    required this.items,
    required this.backgroundColor,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settingsProviders = Provider.of<SettingsProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: title,
                style: TextStyle(
                  color: settingsProviders.isDark ? Colors.white : Colors.black,
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
          height: 50,
          child: DropdownMenuExample(
            selectedValue: dropDownText,
            items: items,
            backgroundColor: backgroundColor,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}

class DropdownMenuExample extends StatefulWidget {
  final String? selectedValue;
  final List<String> items;
  final Color backgroundColor;
  final void Function(String?) onChanged;

  const DropdownMenuExample({
    Key? key,
    required this.selectedValue,
    required this.items,
    required this.backgroundColor,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  late String dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.selectedValue ?? widget.items.first;
  }

  @override
  void didUpdateWidget(covariant DropdownMenuExample oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedValue != oldWidget.selectedValue &&
        widget.selectedValue != dropdownValue) {
      dropdownValue = widget.selectedValue ?? widget.items.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    final settingsProviders = Provider.of<SettingsProvider>(context);

    return Container(
      width: double.infinity,
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: ShapeDecoration(
        color: widget.backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: dropdownValue,
          iconEnabledColor: Colors.white,
          dropdownColor: settingsProviders.isDark ? Colors.black : Colors.white,
          isExpanded: true,
          style: TextStyle(
            color: settingsProviders.isDark ? Colors.white : Colors.black,
            fontSize: 12,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
          onChanged: (String? value) {
            if (value != null) {
              setState(() {
                dropdownValue = value;
              });
              widget.onChanged(value);
            }
          },
          items: widget.items.map<DropdownMenuItem<String>>((String value) {
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
