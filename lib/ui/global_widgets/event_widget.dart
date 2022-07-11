import 'package:flutter/material.dart';

class EventWidget extends StatelessWidget {
  final String name;
  final String place;
  final String dateTime;

  const EventWidget(
      {Key? key,
      required this.name,
      required this.place,
      required this.dateTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black.withOpacity(0.2)),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        clipBehavior: Clip.hardEdge,
        child: Column(
          children: [
            Text(name),
            Text(place),
            Text(dateTime),
          ],
        ),
      ),
    );
  }
}
