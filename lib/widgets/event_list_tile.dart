import 'package:flutter/material.dart';

class EventListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) => const ListTile(
        title: Text('Event Type'),
        subtitle: Text('01.01.2023. 14:30'),
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
      );
}
