
import 'package:flutter/material.dart';
import 'package:sweaka_supervisor_2/constants/SweakaTexts.dart';
import 'package:sweaka_supervisor_2/constants/sweakaColors.dart';
import 'package:sweaka_supervisor_2/models/client.dart';
import 'package:sweaka_supervisor_2/sweaka_icons_icons.dart';
import 'package:sweaka_supervisor_2/constants/SweakaDecoration.dart';

import '../../models/sectors.dart';
import '../../services/sectors/sectors.dart';





class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  String _selectedDay = "Monday";
  List<String> _selectedDays = ["Monday", "Tuesday", "Wednesday", "Thursday"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My App")),
      body: ListView.builder(
        itemCount: _selectedDays.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Text("Selected day: ${_selectedDays[index]}"),
              ElevatedButton(
                onPressed: () {
                  _buildModal(context, index);
                },
                child: Text("Change day"),
              ),
            ],
          );
        },
      ),
    );
  }

  void _buildModal(BuildContext context, int index) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text("Selected day: ${_selectedDays[index]}"),
            ),
            Divider(),
            ListTile(
              title: Text("Select a day:"),
              onTap: () {
                _buildDayModal(context, index);
              },
            ),
          ],
        );
      },
    );
  }

  void _buildDayModal(BuildContext context, int index) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildDayListTile(context, index, "Monday"),
            _buildDayListTile(context, index, "Tuesday"),
            _buildDayListTile(context, index, "Wednesday"),
            _buildDayListTile(context, index, "Thursday"),
            _buildDayListTile(context, index, "Friday"),
            _buildDayListTile(context, index, "Saturday"),
            _buildDayListTile(context, index, "Sunday"),
          ],
        );
      },
    );
  }

  ListTile _buildDayListTile(
      BuildContext context, int index, String dayOfWeek) {
    return ListTile(
      title: Text(dayOfWeek),
      onTap: () {
        setState(() {
          _selectedDays[index] = dayOfWeek;
        });
        Navigator.pop(context);
      },
    );
  }
}

