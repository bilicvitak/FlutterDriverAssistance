import 'package:flutter/material.dart';
import 'package:flutter_driver_assistance/models/event.dart';
import 'package:intl/intl.dart';

class EventListTile extends StatelessWidget {
  final Event event;

  const EventListTile({
    super.key,
    required this.event,
  });

  @override
  Widget build(BuildContext context) => ListTile(
        title: Text(event.eventType.replaceAll('_', ' ')),
        subtitle: Text(DateFormat('dd.MM.yyyy HH:mm:ss').format(event.created)),
        tileColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
      );
}
