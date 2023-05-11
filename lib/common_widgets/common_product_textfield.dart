import 'package:flutter/material.dart';

class CommonProductTextField extends StatefulWidget {
  final String selectedVal;
  final String fieldHeader;
  final Function? selectionCallBack;

  const CommonProductTextField({Key? key, this.selectionCallBack, this.selectedVal = "", this.fieldHeader = ""}) : super(key: key);

  @override
  State<CommonProductTextField> createState() => _CommonProductTextFieldState();
}

class _CommonProductTextFieldState extends State<CommonProductTextField> {

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    setState(() {
      searchController.text = widget.selectedVal;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 30,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.only(top: 5,left: 8,right: 8),
          hintText: 'Search Here...',
          hintStyle: TextStyle(fontSize: 14)
        ),
      ),
    );
  }
}



class CommonDropdownView extends StatefulWidget {
  final List<String> listData;
  final String selectedVal;
  final Function changeCallback;
  const CommonDropdownView({Key? key, required this.listData, required this.selectedVal, required this.changeCallback}) : super(key: key);

  @override
  State<CommonDropdownView> createState() => _CommonDropdownViewState();
}

class _CommonDropdownViewState extends State<CommonDropdownView> {
  String selectedValue = "";

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      hint: const Text('Select'), // Not necessary for Option 1
      value: widget.selectedVal,
      onChanged: (newValue) {
        selectedValue = newValue ?? "";
        widget.changeCallback(selectedValue);
      },
      items: widget.listData.map((location) {
        return DropdownMenuItem(
          value: location,
          child: Text(location),
        );
      }).toList(),
    );
  }
}
