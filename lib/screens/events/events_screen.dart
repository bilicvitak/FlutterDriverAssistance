import 'package:flutter/material.dart';
import 'package:flutter_driver_assistance/screens/events/events_controller.dart';
import 'package:flutter_driver_assistance/widgets/events_list.dart';
import 'package:get/get.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  late EventsController eventsController;

  @override
  void initState() {
    super.initState();
    eventsController = Get.put(EventsController());
  }

  @override
  void dispose() {
    Get.delete<EventsController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => EventsList(
        controller: eventsController,
      );
}
